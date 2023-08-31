package com.mit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mit.model.ContractDTO;
import com.mit.service.ContractService;

@Controller
public class HomeController {
	private final ContractService CONTRACT_SERVICE;

	@Autowired
	public HomeController(ContractService contract_service) {

		this.CONTRACT_SERVICE = contract_service;

	}

	@RequestMapping("/")
	public String showIndex(HttpSession session, Model model) {
		Object userIdObj = session.getAttribute("logInId");
		System.out.println("userIdObj : " + userIdObj);
		boolean hasContract;
		if (userIdObj != null) {
			int userId = Integer.parseInt(userIdObj.toString());
			ContractDTO contractDTO = CONTRACT_SERVICE.selectContractByUserId(userId);
			hasContract = (contractDTO != null); // 계약이 있으면 true

			System.out.println("로그인된 사용자 ID: " + userId);
			System.out.println("로그인된 사용자 contractDTO: " + contractDTO);
			System.out.println("로그인된 사용자 hasContract: " + hasContract);
			System.out.println("인덱스 화면 요청");

			// hasContract 값을 세션에 저장
			session.setAttribute("hasContract", hasContract);

			model.addAttribute("hasContract", hasContract);

			return "index";
		} else {
			// 비로그인 상태일 경우 처리
			System.out.println("비로그인 상태");
			System.out.println("인덱스 화면 요청");
			hasContract = false; // 계약이 있으면 false
			System.out.println("비로그인 hasContract: " + hasContract);

			// hasContract 값을 세션에 저장
			session.setAttribute("hasContract", hasContract);

			return "index";
		}
	}

	@RequestMapping("pension")
	public String showPension() {
		return "pension";
	}

	@GetMapping("showIRP")
	public String showIRP() {
		return "IRPDetail";
	}
}