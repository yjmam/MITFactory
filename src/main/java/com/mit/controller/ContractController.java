package com.mit.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mit.model.AccountDTO;
import com.mit.model.ContractDTO;
import com.mit.model.DepositDTO;
import com.mit.model.PickProdDTO;
import com.mit.model.UserDTO;
import com.mit.service.AccountService;
import com.mit.service.ContractService;
import com.mit.service.DepositService;
import com.mit.service.KfbService;
import com.mit.service.PickProdService;
import com.mit.service.UserService;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@RequestMapping("/contract/")
@Controller
public class ContractController {

	private final ContractService CONTRACT_SERVICE;
	private final PickProdService PICKPROD_SERVICE;
	private final AccountService ACCOUNT_SERVICE;
	private final DepositService DEPOSIT_SERVICE;
	private final UserService USER_SERVICE;
	private final KfbService KFB_SERVICE;

	@Autowired
	public ContractController(ContractService contractService, PickProdService pickProdService,
			AccountService accountService, DepositService depositService, UserService userService,
			KfbService kfbservice) {
		this.CONTRACT_SERVICE = contractService;
		this.PICKPROD_SERVICE = pickProdService;
		this.ACCOUNT_SERVICE = accountService;
		this.DEPOSIT_SERVICE = depositService;
		this.USER_SERVICE = userService;
		this.KFB_SERVICE = kfbservice;
	}

	// 증번생성
	@GetMapping("create/{Id}")
	public String create(Authentication auth, @PathVariable int Id, @RequestParam(name = "step") String step) {
		UserDTO logIn = (UserDTO) auth.getPrincipal();
		ContractDTO contractDTO = new ContractDTO();
		contractDTO.setUserId(logIn.getId());
		System.out.println("");

		// policyNumber 생성
		String year = String.valueOf(logIn.getEntryDate().getYear() + 1900); // 년도 가져오기
		String user_id = String.valueOf(logIn.getId());

		int maxId = CONTRACT_SERVICE.getMaxId();
		String formattedMaxId = String.format("%04d", maxId); // max(id) 값을 4자리 형식으로 포맷팅

		String policyNumber = year + user_id + formattedMaxId; // policyNumber 생성

		contractDTO.setPolicyNumber(policyNumber);
		CONTRACT_SERVICE.create(contractDTO);

		System.out.println("step이뭐야?" + step);

		if (step.equals("generalStep")) {
			return "redirect:/invest/showInvestPage"; // 일반운용지시 선택시 이동
		} else {
			return "redirect:/product/selectInvest/simple?step=" + step; // 간편운용지시 선택시 이동
		}
	}

	// 해지대상계약 관리자승인시 해지처리
	@GetMapping("contractCancellation/{policyNumber}")
	public String updateContract(@PathVariable String policyNumber, HttpSession session) {
		ContractDTO contractDTO = CONTRACT_SERVICE.selectCancel(policyNumber);
		contractDTO.setContractStatus("해지");
		CONTRACT_SERVICE.adminUpdate(contractDTO);
		KFB_SERVICE.updateKfb(contractDTO);
		DEPOSIT_SERVICE.deleteDeposit(policyNumber); // 0811 계액해지시 deposit삭제
		return "redirect:/admin/cancellation/" + 1;
	}

	// 계약 상세 정보 조회
	@GetMapping("selectOne/{policyNumber}")
	public String selectOne(@PathVariable String policyNumber, Authentication auth, Model model) {
		UserDTO logIn = (UserDTO) auth.getPrincipal();
		ContractDTO contractDTO = CONTRACT_SERVICE.selectOne(policyNumber);
		AccountDTO accountDTO = ACCOUNT_SERVICE.selectOne(policyNumber);

		// model 데이터 추가
		model.addAttribute("logInName", logIn.getName());
		model.addAttribute("logInSsn", logIn.getSsn());
		model.addAttribute("logIn", logIn);
		model.addAttribute("contract", contractDTO);
		model.addAttribute("account", accountDTO);

		return "contract/contractDetail"; // contractDetail.jsp 뷰로 이동

	}

	// 개인 계약해지신청화면
	@GetMapping("cancelContract")
	public String cancelContract(Authentication auth, HttpSession session, Model model) {
		UserDTO logIn = (UserDTO) auth.getPrincipal();
		int userId = logIn.getId();
		int reserves;
		int interest;
		int listLength;
		ContractDTO contractDTO = CONTRACT_SERVICE.selectContractByUserId(userId);
		if (contractDTO == null) {

			model.addAttribute("contractDTO", contractDTO);
		} else {

			String policyNumber = contractDTO.getPolicyNumber();
			System.out.println("policyNumber: " + policyNumber);
			AccountDTO accountDTO = ACCOUNT_SERVICE.selectAccount(policyNumber);
			List<DepositDTO> depositDTO = DEPOSIT_SERVICE.selectAll(policyNumber);
			System.out.println("계약해지 depositDTO" + depositDTO);
			if (depositDTO == null || depositDTO.isEmpty()) {
				// When depositDTO is null or empty
				List<PickProdDTO> pickProdList = PICKPROD_SERVICE.selectContractAll(policyNumber);
				listLength = pickProdList.size();
				for (int i = 0; i < listLength; i++) {
					PickProdDTO pickProd = pickProdList.get(i);
					System.out.println("수익률 추가 전 pickProdList : " + pickProd);
					pickProd.setInterest(0);
					pickProd.setReserves(0);
				}

				model.addAttribute("contractDTO", contractDTO);
				model.addAttribute("depositDTO", depositDTO);
				model.addAttribute("accountDTO", accountDTO);
				model.addAttribute("pickProdList", pickProdList);
				model.addAttribute("depositTf", depositDTO.isEmpty()); // true가 빈거

			} else {
				int totalAmount = DEPOSIT_SERVICE.sumDepositAmount(policyNumber);
				System.out.println("productChange totalAmount" + totalAmount);
				List<PickProdDTO> pickProdList = PICKPROD_SERVICE.selectContractAll(policyNumber);

				listLength = pickProdList.size();

				for (int i = 0; i < listLength; i++) {
					PickProdDTO pickProd = pickProdList.get(i);
					System.out.println("수익률 추가 전 pickProdList : " + pickProd);
					String prodictName = pickProd.getProductName();
					System.out.println("productChange prodictName" + prodictName);
					double investRatio = pickProd.getInvestRatio();
					double annualReturn = pickProd.getProductAnnualReturn();
					System.out.println("productChange annualReturn" + annualReturn);
					interest = (int) (totalAmount * (investRatio / 100) * (annualReturn / 100));
					System.out.println("productChange 이자 " + interest);
					reserves = (int) (totalAmount * (investRatio / 100)) + interest;
					System.out.println("productChange 적립금" + reserves);

					pickProd.setInterest(interest);
					pickProd.setReserves(reserves);

				}
				model.addAttribute("contractDTO", contractDTO);
				model.addAttribute("accountDTO", accountDTO);
				model.addAttribute("depositDTO", depositDTO);
				model.addAttribute("pickProdList", pickProdList);
				model.addAttribute("depositTf", depositDTO.isEmpty()); // true가 빈거
			}
		}

		return "contract/cancelContract";
	}

	// 개인 계약해지신청하면 계약해지처리중으로 변경0825
    @ResponseBody
    @PostMapping(value = "cancel/{policyNumber}")
	public int customerCancelContract(@PathVariable String policyNumber) {
		System.out.println("사용자계약해지 증번: " + policyNumber);
		ContractDTO contractDTO = CONTRACT_SERVICE.selectCancel(policyNumber);
		System.out.println("계약해지contractDTO" + contractDTO);
		contractDTO.setContractStatus("해지접수중");
		int result = CONTRACT_SERVICE.updateContractStatus(contractDTO);

		return result;
	}


	@PostMapping("update/{policyNumber}")
	public String contractStatusUpdate(@PathVariable String policyNumber) {
		System.out.println("업데이트 증번: " + policyNumber);
		ContractDTO contractDTO = CONTRACT_SERVICE.selectOne(policyNumber);
		contractDTO.setContractStatus("정상");
		CONTRACT_SERVICE.updateContractStatus(contractDTO);
		int userId = contractDTO.getUserId();
		UserDTO userDTO = USER_SERVICE.selectUserId(userId);
		System.out.println("계약 업데이트시 userDTO :" + userDTO);
		int recommenderId = userDTO.getRecommenderId();
		if (recommenderId != 0) {
			DepositDTO depositDTO = new DepositDTO();
			depositDTO.setPolicyNumber(policyNumber);
			depositDTO.setInputAmount(20000);
			depositDTO.setWriter("추천이벤트");
			System.out.println(depositDTO.toString());
			DEPOSIT_SERVICE.insertDeposit(depositDTO);
			String recommenderPolicyNumber = CONTRACT_SERVICE.selectByUserId(recommenderId); // 0818
			System.out.println("추천인 계약번호 :" + recommenderPolicyNumber); // 0818
			DepositDTO recommendDepositDTO = new DepositDTO(); // 0818
			recommendDepositDTO.setPolicyNumber(recommenderPolicyNumber); // 0818
			recommendDepositDTO.setInputAmount(20000); // 0818
			recommendDepositDTO.setWriter("추천이벤트_추천고객"); // 0818
			DEPOSIT_SERVICE.insertDeposit(recommendDepositDTO); // 0818
		}
		return "contract/contractComplete";
	}

	// 가입완료 화면
	@GetMapping("contractComplete")
	public String showContractComplete(Authentication auth, Model model) {
		UserDTO logIn = (UserDTO) auth.getPrincipal();
		model.addAttribute("logInName", logIn.getName());
		return "contract/contractComplete";
	}

	// irp신규가입 0808추가
	@GetMapping("join")

	public String showJoin(HttpSession session, Authentication authentication, Model model) {

		UserDTO logIn = (UserDTO) authentication.getPrincipal();
		int userId = logIn.getId();
		String contractExistence;
		String irpExistence;

		System.out.println("join logInId : " + userId);
		List<Object> contractDTO = CONTRACT_SERVICE.selectAllContract(userId);
		System.out.println("join의 계약유무 contractDTO : " + contractDTO);
		ContractDTO irpDTO = CONTRACT_SERVICE.selectContractByUserId(userId);
		System.out.println("join의 irp 계약유무 irpDTO : " + irpDTO);
		if (irpDTO == null && (contractDTO == null || contractDTO.size() == 0)) {
			contractExistence = "false";
			irpExistence = "false";
		} else if (irpDTO == null && contractDTO != null && contractDTO.size() >= 1) {
			irpExistence = "false";
			contractExistence = "true";
		} else {
			irpExistence = "true";
			contractExistence = "true";
		}

		model.addAttribute("contractExistence", contractExistence);
		model.addAttribute("irpExistence", irpExistence);
		System.out.println("contractExistence : " + contractExistence);
		System.out.println("IRPExistence : " + irpExistence);
		model.addAttribute("logIn", logIn);
		/*
		 * model.addAttribute("logInId", logIn.getId());
		 * model.addAttribute("logInUsername", logIn.getUsername());
		 * model.addAttribute("logInName", logIn.getName());
		 * model.addAttribute("logInSsn", logIn.getSsn());
		 * model.addAttribute("logInRole", logIn.getRole());
		 */
		return "/contract/join";
	}

	@ResponseBody
	   @RequestMapping(value = "sendSms")
	   public String sendSms(HttpServletRequest request, Authentication authentication, Model model) throws Exception {

	      UserDTO logIn = (UserDTO) authentication.getPrincipal();
	      String userPhoneNumber = logIn.getTel(); // 사용자의 전화번호를 가져옴   
	      String logInName = logIn.getName(); // 사용자의 이름을 가져옴
	      
	      
	      String api_key = "NCSWR16XKB2SHHYN";
	      String api_secret = "AVFPZROIDUEVMO7CLPTUGTJCVOVM2678";
	      Message coolsms = new Message(api_key, api_secret);

	      HashMap<String, String> params = new HashMap<String, String>();
	      params.put("to", userPhoneNumber); // 가져온 전화번호를 사용      
	      params.put("from", (String) request.getParameter("from")); // 발신번호
	      params.put("text", (String) request.getParameter("text")); // 문자내용
	      params.put("type", "sms"); // 문자 타입

	      System.out.println(params);

	      try {
	         JSONObject result = coolsms.send(params); // 보내기&전송결과받기
	         System.out.println("result : " + result);
	         // if ((boolean)result.get("status") == true) {
	         // 메시지 보내기 성공 및 전송결과 출력
	         // System.out.println("성공");
	         // } else {
	         // 메시지 보내기 실패
	         // System.out.println("실패");
	         // }
	      } catch (CoolsmsException e) {
	         e.printStackTrace();
	      }

	      return "/";
	   }
	
	@PostMapping("saveSignature/{policyNumber}")
	public String saveSignature(@RequestBody String signatureData, @PathVariable String policyNumber,
			Authentication authentication) {
		System.out.println("싸인가지고 왔니");
		ContractDTO contractDTO = new ContractDTO();
		contractDTO.setPolicyNumber(policyNumber);
		contractDTO.setConfirm(signatureData);
		System.out.println(policyNumber);
		System.out.println("signatureData : " + signatureData);

		CONTRACT_SERVICE.updateContractConfirm(contractDTO);

		return "contract/contractDetail";

	}

	// 배치프로그램
	@Component
	public class ScheduleTasks {
	       @Autowired
	       private ServletContext servletContext; // ServletContext 주입

	       @Scheduled(cron = "0 40 6 * * ?")
	       public void firstTask() {
	           int deletedContractCount = CONTRACT_SERVICE.delete(); // 삭제한 건수 저장

	           // 결과를 ServletContext에 저장
	           servletContext.setAttribute("deletedContractCount", deletedContractCount);

	           System.out.println("일배치완료");
		}

	}
}
