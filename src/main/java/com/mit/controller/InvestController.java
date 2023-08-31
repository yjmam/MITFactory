package com.mit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.mit.model.InvestDTO;
import com.mit.model.UserDTO;
import com.mit.service.InvestService;
import com.mit.service.UserService;

@RequestMapping("/invest/")
@Controller
public class InvestController {

	private final InvestService INVEST_SERVICE;
	private final UserService USER_SERVICE;

	@Autowired
	public InvestController(InvestService investService, UserService userService) {
		this.INVEST_SERVICE = investService;
		this.USER_SERVICE = userService;
	}

	@GetMapping("showInvestPage")
	public String showInvestPage() {
		return "contract/invest"; // JSP 페이지 이름
	}

	@ResponseBody
	@GetMapping("saveInvestResult")
	public String saveInvestResult(@RequestParam int score, Authentication auth, HttpSession session) {

		UserDTO logIn = (UserDTO) auth.getPrincipal();

		System.out.println("여깁니다." + logIn.getId());

		int userId = logIn.getId();
		String result = getInvestResult(score); // 투자 결과를 구함
		INVEST_SERVICE.saveInvestResult(userId, result);

		System.out.println(score);
		System.out.println(result);
		JsonObject json = new JsonObject();
		json.addProperty("result", true);
		return json.toString();

	}

	private String getInvestResult(int totalScore) {
		if (totalScore < 15) {
			return "저위험";
		} else if (totalScore < 20) {
			return "중위험";
		} else {
			return "고위험";
		}
	}

	// 0821
	@ResponseBody
	@PostMapping(value = "checkInvest", produces = "application/text; charset=utf8")
	public String checkInvest(@RequestParam int userId, HttpSession session) {
		System.out.println("checkInvest  userId" + userId);
		InvestDTO investResult = INVEST_SERVICE.getInvestByUserId(userId);
		JsonObject json = new JsonObject();
		json.addProperty("result", (investResult != null) ? (true) : (false));
		return json.toString();

//        if (investResult != null) {
//            System.out.println("checkInvest success");
//             json.addProperty("result", true);
//             return json.toString();
//        } else {
//            System.out.println("checkInvest fail");
//            json.addProperty("result", false);
//            return json.toString();
//
//        }
	}

}
