package com.mit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mit.model.AccountDTO;
import com.mit.model.ContractDTO;
import com.mit.model.KfbDTO;
import com.mit.model.UserDTO;
import com.mit.service.AccountService;
import com.mit.service.ContractService;
import com.mit.service.KfbService;
import com.mit.service.UserService;

@RequestMapping("/account/")
@Controller
public class AccountController {

	private final AccountService ACCOUNT_SERVICE;
	private final UserService USER_SERVICE;
	private final ContractService CONTRACT_SERVICE;
	private final KfbService KFB_SERVICE;

	@Autowired
	public AccountController(AccountService accountService, UserService userService, KfbService kfb_SERVICE,
			ContractService contract_SERVICE) {
		this.ACCOUNT_SERVICE = accountService;
		this.USER_SERVICE = userService;
		this.CONTRACT_SERVICE = contract_SERVICE;
		this.KFB_SERVICE = kfb_SERVICE;
	}

	@GetMapping("register/{policyNumber}") // 자동이체 등록 form 이동
	public String registerForm(@PathVariable String policyNumber, Authentication auth, Model model) {
		UserDTO userInfo = (UserDTO) auth.getPrincipal();
		String ssn = userInfo.getSsn();
		String name = userInfo.getName();
		System.out.println("account컨트롤 get:" + ssn);

		KfbDTO kfbDTO = KFB_SERVICE.selectBySsn(ssn); // 주민번호 기준의 KFB정보조회

		int subtractedValue; //전체 한도값 변수 
		int limitAmount=0;  //타사가입금액 

		if (kfbDTO == null) {
			subtractedValue = 18000000; // kfbDTO가 null이면 1800만으로 세팅
			
		} else {
			limitAmount = kfbDTO.getLimitAmount(); // 타사한도
			subtractedValue = 18000000 - limitAmount; // 가입가능금액= 총한도 - 타사가입한도  
			model.addAttribute("limitAmount", limitAmount);
		}

		model.addAttribute("subtractedValue", subtractedValue);
		model.addAttribute("name", name);
		System.out.println("subtractedValue:" + subtractedValue);

		return "contract/accountRegister";
	}

	@PostMapping("register")
	public String register(@ModelAttribute AccountDTO accountDTO, @RequestParam("policyNumber") String policyNumber,
			@RequestParam("setAmount") int setAmount, Authentication auth, RedirectAttributes redirectAttributes) {
		System.out.println("post매핑:" + accountDTO.getPolicyNumber());
		
		ACCOUNT_SERVICE.register(accountDTO);

		// Contract의 setAmount 저장
		ContractDTO contractDTO = new ContractDTO();
		contractDTO.setPolicyNumber(policyNumber);
		contractDTO.setSetAmount(setAmount);

		// ContractDTO DB에 업데이트
		CONTRACT_SERVICE.updateamount(contractDTO);

		// KfbDTO 한도 업데이트
		KfbDTO kfbDTO = new KfbDTO();
		UserDTO userInfo = (UserDTO) auth.getPrincipal();
		String ssn = userInfo.getSsn();
		String name = userInfo.getName();
		
		
		KfbDTO existingKfb= KFB_SERVICE.selectBySsn(ssn);  //kfb 등록여부 체크 
		System.out.println("kfb여부:"+existingKfb);
		if(existingKfb==null) {
			kfbDTO.setSsn(ssn);
			kfbDTO.setLimitAmount(setAmount);
			kfbDTO.setName(name);
			KFB_SERVICE.insertKfb(kfbDTO);
		}
		else {
			KFB_SERVICE.updateLimitAmount(ssn, setAmount);
		}

		redirectAttributes.addAttribute("policyNumber", policyNumber);
		System.out.println("한도업데이트:" + setAmount);

		return "redirect:/contract/selectOne/{policyNumber}";

	}
}