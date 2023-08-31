package com.mit.controller;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mit.model.PickProdDTO;
import com.mit.model.ProductDTO;
import com.mit.service.PickProdService;
import com.mit.service.ProductService;
import com.mit.service.UserService;

@RequestMapping("/pickProd/")
@Controller
public class PickProdController {

	private final PickProdService PICKPROD_SERVICE;
	private final UserService USER_SERVICE;
	private final ProductService PRODUCT_SERVICE; // 0809현정추가

	@Autowired
	public PickProdController(PickProdService pickProdService, UserService userService, ProductService productService) {
		this.PICKPROD_SERVICE = pickProdService;
		this.USER_SERVICE = userService;
		this.PRODUCT_SERVICE = productService;// 0809현정추가
	}

	// 선택상품 리스트 출력 (비율선택Form)
	@GetMapping("showPickProd")
	public String showPickProd(@RequestParam String policyNumber, @RequestParam(name = "step") String step,
			Model model) { // 증번을 매개변수로 하여 증번기준의 상품리스트 출력
		List<PickProdDTO> pickProdList = PICKPROD_SERVICE.selectPolicyNumber(policyNumber);
		System.out.println("/showPickProd: " + policyNumber);
		model.addAttribute("pickProdList", pickProdList);

		if ("simpleStep".equals(step)) {
			for (PickProdDTO pickProd : pickProdList) {
				pickProd.setInvestRatio(100); // 100% 고정값
				/* pickProd.setEditable(false); */
			}
		}
		return "pickProd/pickProdForm";
	}

	// 상품비율 ratio 업데이트 메서드
	@ResponseBody
	@PostMapping("updateRatio")
	public String updateRatio(@RequestBody List<PickProdDTO> pickProdDTOList) {
		System.out.println("controller: " + pickProdDTOList);
		for (PickProdDTO pickProdDTO : pickProdDTOList) {
			PICKPROD_SERVICE.updateRatio(pickProdDTO);
		}
		String policyNumber = pickProdDTOList.get(0).getPolicyNumber();
		System.out.println("비율업데이트: " + pickProdDTOList.get(0).getPolicyNumber());
		return "redirect:/account/register/" + policyNumber;

	}

	// 선택상품 리스트 출력 (비율선택Form)펀드변경 0820
	@GetMapping("changePickProd")
	public String changePickProd(@RequestParam String policyNumber, Model model) { // 증번을 매개변수로 하여 증번기준의 상품리스트 출력
		List<PickProdDTO> selectedProducts = new ArrayList<>();
		selectedProducts = (List<PickProdDTO>) model.asMap().get("changedProducts");

		System.out.println("펀드변경 선택상품 리스트1 : " + selectedProducts);
		int listLength = selectedProducts.size();
		for (int i = 0; i < listLength; i++) {
			PickProdDTO pickProdDTO = selectedProducts.get(i);
			int productId = pickProdDTO.getProductId();
			System.out.println("productId : " + productId);
			ProductDTO changePickProdDTO = PRODUCT_SERVICE.selectOne(productId);
			System.out.println("변경선택 펀드 changePickProdDTO: " + changePickProdDTO);
			pickProdDTO.setProductName(changePickProdDTO.getProductName());
			pickProdDTO.setManageCompany(changePickProdDTO.getManageCompany());
			pickProdDTO.setFee(changePickProdDTO.getFee());
			pickProdDTO.setRate(changePickProdDTO.getRate());
			pickProdDTO.setTotalReturn(changePickProdDTO.getTotalReturn());
		}

		System.out.println("펀드변경 선택상품 selectedProducts : " + selectedProducts);
		model.addAttribute("pickProdList", selectedProducts);
		return "/pickProd/pickProdChangeForm";
	}

	// 펀드변경 상품비율변경 메서드 0820
	@ResponseBody
	@PostMapping(value = "changeRatio", produces = "application/text; charset=utf8")
	public String changeRatio(@RequestBody List<PickProdDTO> pickProdDTOList) {

		System.out.println("controller: " + pickProdDTOList);
		String policyNumber = pickProdDTOList.get(0).getPolicyNumber();
		System.out.println("policyNumber: " + policyNumber);
		PICKPROD_SERVICE.delete(policyNumber);

		for (PickProdDTO pickProdDTO : pickProdDTOList) {
			System.out.println("상품변경for insert이전 : " + pickProdDTO);
			PICKPROD_SERVICE.changePickProd(pickProdDTO);
		}

		// JSONArray arrJson = new JSONArray();
		JSONObject json = new JSONObject();
		json.put("location", "/");
		// System.out.println("json.toString(): " + json.toString());

		return json.toString();

	}

}
