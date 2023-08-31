package com.mit.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.mit.model.AccountDTO;
import com.mit.model.ContractDTO;
import com.mit.model.PickProdDTO;
import com.mit.model.UserDTO;
import com.mit.service.AccountService;
import com.mit.service.ContractService;
import com.mit.service.InvestService;
import com.mit.service.KfbService;
import com.mit.service.PickProdService;
import com.mit.service.UserService;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@RequestMapping("/user/")
@Controller
public class UserController {

	private final UserService USER_SERVICE;
	private final ContractService CONTRACT_SERVICE;
	private final AccountService ACCOUNT_SERVICE;
	private final KfbService KFB_SERVICE;
	private final InvestService INVEST_SERVICE;
	private final PasswordEncoder ENCODER;
	private final PickProdService PICKPROD_SERVICE;

	@Autowired
	   public UserController(UserService userService, ContractService contractService, PickProdService pickProdService, AccountService accountService,
	         KfbService kfbService, InvestService investService, BCryptPasswordEncoder passwordEncoder) {
	      this.USER_SERVICE = userService;
	      this.CONTRACT_SERVICE = contractService;
	      this.PICKPROD_SERVICE = pickProdService;
	      this.ACCOUNT_SERVICE = accountService;
	      this.KFB_SERVICE = kfbService;
	      this.INVEST_SERVICE = investService;
	      this.ENCODER = passwordEncoder;
	}

	@GetMapping("logIn")
	public String showlogIn() {
		return "user/logIn";
	}

	@GetMapping("register")
	public String showRegister() {
		return "user/register";
	}

	// 0811
	@GetMapping("recommendRegister/{recommenderId}")
	public String showRecommendRegister(@PathVariable int recommenderId, Model model) {
		model.addAttribute("recommenderId", recommenderId);
		return "user/register";
	}

	private void register(UserDTO attempt) {
		attempt.setPassword(encryptPW(attempt.getPassword()));
		/* attempt.setSsn(encryptSSN(attempt.getSsn())); */
		USER_SERVICE.register(attempt);
	}

	@GetMapping("logOut")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@ResponseBody
	@PostMapping(value = "validate", produces = "application/text; charset=utf8")
	public String validateUsername(UserDTO userDTO) {
		System.out.println(userDTO);
		JsonObject jsonObject = new JsonObject();
		String userSsn = userDTO.getSsn();
		System.out.println("회원가입 userSsn: " + userSsn);

		if (USER_SERVICE.loadUserByUsername(userDTO.getUsername()) == null) {
			List<UserDTO> userList = USER_SERVICE.selectAll();
			int userListLength = userList.size();
			boolean ssnExists = false;
			for (int i = 0; i < userListLength; i++) {
				if (ENCODER.matches(userSsn, userList.get(i).getSsn())) {
					ssnExists = true;
					jsonObject.addProperty("result", "fail");
					jsonObject.addProperty("message", "이미 존재하는 회원입니다.");
				}
			}
			if (!ssnExists) {
				userDTO.setSsn(encryptSSN(userDTO.getSsn()));
				String userEncryptSsn = userDTO.getSsn();
				System.out.println("회원가입 userEncryptSsn: " + userEncryptSsn);
				register(userDTO);
				jsonObject.addProperty("result", "success");
				jsonObject.addProperty("message", "!!! 회원 가입 성공 !!!");
			}
		} else {
			jsonObject.addProperty("result", "fail");
			jsonObject.addProperty("message", "이미 존재하는 회원 아이디입니다.");
		}
		return jsonObject.toString();
	}

	/*
	 * @ResponseBody
	 * 
	 * @PostMapping(value = "validate", produces = "application/text; charset=utf8")
	 * public String validateUsername(UserDTO userDTO) { System.out.print(userDTO);
	 * JsonObject jsonObject = new JsonObject(); if
	 * (USER_SERVICE.loadUserByUsername(userDTO.getUsername()) == null) {
	 * register(userDTO); jsonObject.addProperty("result", "success");
	 * jsonObject.addProperty("message", "!!! 회원 가입 성공 !!!");
	 * 
	 * } else { jsonObject.addProperty("result", "fail");
	 * jsonObject.addProperty("message", "이미 존재하는 회원 아이디입니다."); }
	 * 
	 * return jsonObject.toString(); }
	 */
	// 비밀번호 암호화
	private String encryptPW(String password) {
		return ENCODER.encode(password);
	}

	// 주민번호 암호화
	private String encryptSSN(String ssn) {
		String securitySsn = ENCODER.encode(ssn);
		return securitySsn;
	}

	@GetMapping("myInfo/{id}")
	public String myInfo(@PathVariable int id, HttpSession session, Authentication authentication, Model model) {
		UserDTO userDTO = USER_SERVICE.myInfo(id);

		model.addAttribute("userDTO", userDTO);
		System.out.println("myDTO:" + userDTO);

		return "user/myInfo";
	}

	@GetMapping("myProduct/{id}")
	public String myProduct(@PathVariable int id, HttpSession session, Authentication authentication, Model model) {
		UserDTO userDTO = USER_SERVICE.myInfo(id);
		ContractDTO contractDTO = CONTRACT_SERVICE.selectContractByUserId(id);

		if (contractDTO == null) {
			// contractDTO 값이 없을 경우 메인 페이지로 리다이렉트
			model.addAttribute("noContract", true);
			System.out.println("myproduct값:" + contractDTO);
			return "user/myProduct"; // 메인 페이지 URL에 맞게 변경
		}

		model.addAttribute("userDTO", userDTO);
		model.addAttribute("contractDTO", contractDTO);

		String policyNumber = contractDTO.getPolicyNumber();
		List<PickProdDTO> pickProdList = PICKPROD_SERVICE.selectContractAll(policyNumber);
		model.addAttribute("pickProdList", pickProdList);
		System.out.println("확인4:" + pickProdList);

		return "user/myProduct";
	}

	@GetMapping("myContract/{id}")
	public String myContract(@PathVariable int id, HttpSession session, Authentication authentication, Model model) {
		UserDTO userDTO = USER_SERVICE.myInfo(id);
		ContractDTO contractDTO = CONTRACT_SERVICE.selectContractByUserId(id);
		System.out.println("확인:" + contractDTO);

		if (contractDTO == null) {
			// contractDTO 값이 없을 경우 메인 페이지로 리다이렉트
			model.addAttribute("noContract", true);
			System.out.println("확인1:" + contractDTO);
			/* return "redirect:/"; */
			return "user/myContract";
		}

		model.addAttribute("userDTO", userDTO);
		model.addAttribute("contractDTO", contractDTO);

		String policyNumber = contractDTO.getPolicyNumber();
		AccountDTO accountDTO = ACCOUNT_SERVICE.selectAccount(policyNumber);
		model.addAttribute("accountDTO", accountDTO);
		System.out.println("확인2:" + accountDTO);

		return "user/myContract";
	}

	// sms인증
	@ResponseBody
	@RequestMapping("phoneCheck")
	public String sendSMS(@RequestParam("phone") String phone) {
		System.out.println("phone : " + phone);
		int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000);

		USER_SERVICE.certifiedPhoneNumber(phone, randomNumber);

		return Integer.toString(randomNumber);
	}

	// 로그인한 사용자의 userid를 얻어와 반환하는 로직 작성
//	@ResponseBody
//	@RequestMapping("getUserId")
//	public String getUserId() {
//	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//	    String userId = authentication.getName(); // 로그인한 사용자의 아이디를 가져옴
//	    return userId;
//	}

	@GetMapping("friendRecommend")
	   public String showFriendRecommendationPage(HttpServletRequest request, HttpSession session, Authentication authentication, Model model) {
	       if (session.getAttribute("logInRole") != null) {
	           UserDTO userDTO = (UserDTO) authentication.getPrincipal(); // 사용자 정보를 가져옴
	           int userId = userDTO.getId(); // 사용자 아이디를 가져옴
	           //IRP가입여부 체크
	           ContractDTO contractDTO = CONTRACT_SERVICE.selectContractByUserId(userId);
	           if(contractDTO !=null && "정상".equals(contractDTO.getContractStatus())) {
	           session.setAttribute("userId", userId);
	           model.addAttribute("userId", userId); // userId를 모델에 추가
	           return "user/friendRecommend";
	           } else {
	               return "redirect:/contract/join";
	           }
	       } else {
	           return "redirect:/user/logIn";
	       }
	   }

	 @ResponseBody
	    @RequestMapping(value = "friendSMS")
	    public String friendSMS(HttpServletRequest request) throws Exception {

	        String imageId = "ST01FZ230817070334702F2wsgcSg1ln";
	        String friendphone = request.getParameter("friendphone");
	        String text = request.getParameter("text");

	        String api_key = "NCSWR16XKB2SHHYN";
	        String api_secret = "AVFPZROIDUEVMO7CLPTUGTJCVOVM2678";
	        Message coolsms = new Message(api_key, api_secret);

	        HashMap<String, String> params = new HashMap<String, String>();
	        params.put("to", friendphone); // 가져온 전화번호를 사용
	        params.put("from", "01077699442"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	        params.put("text", text); // 문자내용
	        params.put("type", "MMS"); // 문자 타입
	        params.put("imageId", "ST01FZ230817070334702F2wsgcSg1ln"); // 이미지 타입

	        System.out.println(params);

	        try {
	            JSONObject result = coolsms.send(params); // 보내기&전송결과받기
	            System.out.println("result : " + result);
	          //   if ((boolean)result.get("status") == true) {
	            // 메시지 보내기 성공 및 전송결과 출력
	          //   System.out.println("성공");
	          //  } else {
	            // 메시지 보내기 실패
	         //    System.out.println("실패");
	         //    }
	        } catch (CoolsmsException e) {
	            e.printStackTrace();
	        }

	        return "/";

	    }
	}