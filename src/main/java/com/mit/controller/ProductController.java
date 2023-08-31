package com.mit.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;//0816
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat; //0816
import java.util.ArrayList;
import java.util.Date;//0816
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.mit.model.ContractDTO;
import com.mit.model.DepositDTO;
import com.mit.model.InvestDTO;
import com.mit.model.PickProdDTO;
import com.mit.model.ProductDTO;
import com.mit.model.ProductListWrapper;
import com.mit.model.UserDTO;
import com.mit.service.ContractService;
import com.mit.service.DepositService;
import com.mit.service.InvestService;
import com.mit.service.PickProdService;
import com.mit.service.ProductService;
import com.mit.service.UserService;

@RequestMapping("/product/")
@Controller
public class ProductController {
	private final ProductService PRODUCT_SERVICE;

	private final InvestService INVEST_SERVICE;
	private final PickProdService PICKPROD_SERVICE;
	private final UserService USER_SERVICE;
	private final ContractService CONTRACT_SERVICE;
	private final DepositService DEPOSIT_SERVICE; // 0809추가

	@Autowired
	public ProductController(ProductService productService, InvestService investService,
			PickProdService pickProdService, UserService userService, ContractService contract_SERVICE,
			DepositService depositService) {
		this.PRODUCT_SERVICE = productService;
		this.INVEST_SERVICE = investService;
		this.PICKPROD_SERVICE = pickProdService;
		this.USER_SERVICE = userService;
		this.CONTRACT_SERVICE = contract_SERVICE;
		this.DEPOSIT_SERVICE = depositService; // 0809추가
	}

	public static double generateMonthlyReturn() {
		Random random = new Random();
		double randomValue = random.nextDouble(); // 0.0 이상 1.0 미만의 랜덤 값 생성

		double monthlyReturn;
		if (randomValue < 0.3) {
			// -5부터 -1까지의 수익률 생성
			monthlyReturn = Math.round((random.nextDouble() * 4 - 5) * 100.0) / 100.0;
		} else {
			// 0부터 5까지의 수익률 생성
			monthlyReturn = Math.round(random.nextDouble() * 6 * 100.0) / 100.0;
		}

		return monthlyReturn;
	}

	public static double generateQuerterlyReturn() {
		Random random = new Random();
		double randomValue = random.nextDouble(); // 0.0 이상 1.0 미만의 랜덤 값 생성

		double querterlyReturn;
		if (randomValue < 0.2) {
			// -5부터 -1까지의 수익률 생성
			querterlyReturn = Math.round((random.nextDouble() * 4 - 5) * 100.0) / 100.0;
		} else {
			// 1부터 10까지의 수익률 생성
			querterlyReturn = Math.round(random.nextDouble() * 11 * 100.0) / 100.0;
		}

		return querterlyReturn;
	}

	public static double generateAnnualReturn() {
		Random random = new Random();
		double randomValue = random.nextDouble(); // 0.0 이상 1.0 미만의 랜덤 값 생성

		double annualReturn;
		if (randomValue < 0.1) {
			// -5부터 -1까지의 수익률 생성
			annualReturn = Math.round((random.nextDouble() * 4 - 5) * 100.0) / 100.0;
		} else {
			// 0부터 15까지의 수익률 생성
			annualReturn = Math.round(random.nextDouble() * 16 * 100.0) / 100.0;
		}

		return annualReturn;
	}

	public static double generateTotalReturn() {
		Random random = new Random();
		double randomValue = random.nextDouble(); // 0.0 이상 1.0 미만의 랜덤 값 생성

		double totalReturn;
		if (randomValue < 0.1) {
			// -5부터 10까지의 수익률 생성
			totalReturn = Math.round((random.nextDouble() * 14 - 5) * 100.0) / 100.0;
		} else {
			// 10부터 21까지의 수익률 생성
			totalReturn = Math.round((random.nextDouble() * 11 + 10) * 100.0) / 100.0;
		}
		return totalReturn;
	}

	@PostMapping("register")
	public String registerProduct(ProductDTO productDTO) {

		if (productDTO.getRiskLevel().contains("저위험")) { // 0818수정
			double rate = productDTO.getRate();
			// 0810추가
			productDTO.setMonthlyReturn(rate / 12);
			productDTO.setQuerterlyReturn(rate / 4);
			productDTO.setAnnualReturn(rate);
			productDTO.setTotalReturn(rate);
			System.out.println("insert 이율보증형:" + productDTO);
		} else {

			double monthlyReturn = generateMonthlyReturn();
			System.out.println("랜덤값 1개월 수익률 : " + monthlyReturn);
			double querterlyReturn = generateQuerterlyReturn();
			System.out.println("랜덤값 3개월 수익률 : " + querterlyReturn);
			double annualReturn = generateAnnualReturn();
			System.out.println("랜덤값 1년 수익률 : " + annualReturn);
			double totalReturn = generateTotalReturn();
			System.out.println("랜덤값 총 수익률 : " + totalReturn);

			productDTO.setMonthlyReturn(monthlyReturn);
			productDTO.setQuerterlyReturn(querterlyReturn);
			productDTO.setAnnualReturn(annualReturn);
			productDTO.setTotalReturn(totalReturn);
			System.out.println("insert productDTO :" + productDTO);
		}

		PRODUCT_SERVICE.insert(productDTO);

		return "redirect:/admin/product/" + 1;
	}

	@PostMapping("update/{productId}")
	public String updateProduct(@PathVariable int productId, HttpSession session, ProductDTO productDTO) {
		if (productDTO.getRiskLevel().contains("저위험")) { // 0818수정
			double rate = productDTO.getRate();
			// 0810추가
			productDTO.setMonthlyReturn(rate / 12);
			productDTO.setQuerterlyReturn(rate / 4);
			productDTO.setAnnualReturn(rate);
			productDTO.setTotalReturn(rate);
		}
		productDTO.setId(productId);
		PRODUCT_SERVICE.update(productDTO);

		return "redirect:/admin/product/" + 1;
	}

	@GetMapping("selectInvest") // 상품 리스트 출력 (가입 시)
	public String selectInvest(Model model, Authentication auth,
			@RequestParam(value = "search", required = false) String keyword, HttpSession session) {
		UserDTO logIn = (UserDTO) auth.getPrincipal();

		System.out.println("product여기." + logIn.getId());

		int userId = logIn.getId();

		InvestDTO InvestResult = INVEST_SERVICE.getInvestByUserId(userId);

		// 상품검색 로직 추가
		if (keyword != null && !keyword.isEmpty()) {
			List<ProductDTO> searchResults = PRODUCT_SERVICE.searchProduct(keyword);
			System.out.println("상품검색결과 :" + searchResults); // 검색확인용
			model.addAttribute("productList", searchResults);
		}

		else {
			List<ProductDTO> productList = PRODUCT_SERVICE.selectInvestByUserId(userId); // userId 기준의 투자성향 정보 가져오기
			model.addAttribute("productList", productList);
		}

		List<ProductDTO> topReturnProductList = PRODUCT_SERVICE.selectTopTotalReturn(userId); // 상위수익률 리스트 추출
		model.addAttribute("topReturnProductList", topReturnProductList);

		// 위험등급 별 인기상품
		String riskLevel = InvestResult.getInvestResult();
		switch (riskLevel) {
		case "고위험":
			model.addAttribute("topHighRiskProducts", PRODUCT_SERVICE.selectTopForHighRisk());
			model.addAttribute("topMediumRiskProducts", PRODUCT_SERVICE.selectTopForMediumRisk());
			model.addAttribute("topLowRiskProducts", PRODUCT_SERVICE.selectTopForLowRisk());
			model.addAttribute("topveryLowRiskProducts", PRODUCT_SERVICE.selectTopForveryLowRisk());
			break;
		case "중위험":
			model.addAttribute("topMediumRiskProducts", PRODUCT_SERVICE.selectTopForMediumRisk());
			model.addAttribute("topLowRiskProducts", PRODUCT_SERVICE.selectTopForLowRisk());
			model.addAttribute("topveryLowRiskProducts", PRODUCT_SERVICE.selectTopForveryLowRisk());
			break;
		case "저위험":
			model.addAttribute("topLowRiskProducts", PRODUCT_SERVICE.selectTopForLowRisk());
			model.addAttribute("topveryLowRiskProducts", PRODUCT_SERVICE.selectTopForveryLowRisk());
			break;
		case "초저위험":
			model.addAttribute("topveryLowRiskProducts", PRODUCT_SERVICE.selectTopForveryLowRisk());
			break;
		default:
			break;
		}

		// 기준일자(당일)출력 위해 추가
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		model.addAttribute("today", today);
		System.out.println("today:" + today);

		return "product/productList";
	}

	// 위험등급에 따른 상품 리스트 중 선택 등록
	@PostMapping("selectInvest")
	public String selectedInvest(@RequestParam("selectedProducts") List<Integer> selectedProductIds,
			Authentication auth, @RequestParam(name = "step") String step, RedirectAttributes attributes) {
		UserDTO logIn = (UserDTO) auth.getPrincipal();
		int userId = logIn.getId();

		String policyNumber = CONTRACT_SERVICE.selectByUserId(userId); // 최신증번 호출하는부분
		System.out.println("post policy찍히나:" + policyNumber);

		// 기존 PickProdDTO 날리기 추가
		ContractDTO contractDTO = CONTRACT_SERVICE.selectOne(policyNumber);

		if (contractDTO.getContractStatus().contains("입력중")) {

			PICKPROD_SERVICE.delete(policyNumber);

			List<PickProdDTO> selectedProducts = new ArrayList<>();
			for (Integer productId : selectedProductIds) {
				PickProdDTO pickProdDTO = new PickProdDTO();
				pickProdDTO.setPolicyNumber(policyNumber);
				pickProdDTO.setProductId(productId);

				ProductDTO productDTO = PRODUCT_SERVICE.selectOne(productId);
				System.out.println("상품DTO 확인: " + productId);

				if (productDTO != null) {
					// 상품의 riskLevel을 PickProdDTO에 등록
					pickProdDTO.setRiskLevel(productDTO.getRiskLevel());
					System.out.println("상품DTO 확인2: " + productDTO.getRiskLevel());
				}
				selectedProducts.add(pickProdDTO);

				System.out.println("/selectInvest Postmapping:" + productId);
			}
			PICKPROD_SERVICE.register(selectedProducts);
			return "redirect:/pickProd/showPickProd?policyNumber=" + policyNumber + "&step=" + step;

		} else {
			List<PickProdDTO> selectedProducts = new ArrayList<>();
			// List<ProductDTO> selectedProductInfo = new ArrayList<>();
			for (Integer productId : selectedProductIds) {
				PickProdDTO pickProdDTO = new PickProdDTO();
				pickProdDTO.setPolicyNumber(policyNumber);
				pickProdDTO.setProductId(productId);

				ProductDTO productDTO = PRODUCT_SERVICE.selectOne(productId);
				System.out.println("상품DTO 확인: " + productId);

				if (productDTO != null) {
					// 상품의 riskLevel을 PickProdDTO에 등록
					pickProdDTO.setRiskLevel(productDTO.getRiskLevel());
					System.out.println("상품DTO 확인2: " + productDTO.getRiskLevel());
				}
				selectedProducts.add(pickProdDTO);

			}
			System.out.println("펀드변경 selectedProducts : " + selectedProducts);
			attributes.addFlashAttribute("changedProducts", selectedProducts);

			System.out.println("펀드변경 selectedProducts 끝? ");
			return "redirect:/pickProd/changePickProd?policyNumber=" + policyNumber;

		}

	}

	@GetMapping("selectInvest/simple") // 간편운용지시 상품리스트
	public String selectSimpleStep(@RequestParam(name = "step") String step,
			@RequestParam(value = "search", required = false) String keyword, Model model, Authentication auth) {
		System.out.println("selectsimple step찍히나?" + step);
		System.out.println("selectsimple search찍히나?" + keyword);

		// 상품검색 로직 추가
		if (keyword != null && !keyword.isEmpty()) {
			List<ProductDTO> searchResults = PRODUCT_SERVICE.searchSimpleProduct(keyword);
			System.out.println("상품검색결과 :" + searchResults); // 검색확인용
			model.addAttribute("productList", searchResults);
			model.addAttribute("step", step);
		}

		else {
			List<ProductDTO> productList = PRODUCT_SERVICE.selectSimpleProduct();
			model.addAttribute("step", step);
			model.addAttribute("productList", productList);
		}

		// 기준일자(당일)출력 위해 추가
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		model.addAttribute("today", today);
		System.out.println("today:" + today);

		return "product/productList";
	}

	// 상품공시실 조회
	@GetMapping("productStorage")
	public String productStorage(Model model, @RequestParam(value = "search", required = false) String keyword) {

		if (keyword != null && !keyword.isEmpty()) {
			List<ProductDTO> searchResults = PRODUCT_SERVICE.searchProduct(keyword);
			System.out.println("상품검색결과 :" + searchResults); // 검색확인용
			model.addAttribute("productList", searchResults);
		}

		else {
			List<ProductDTO> AllproductList = PRODUCT_SERVICE.selectAll();
			List<ProductDTO> lowRiskProducts = new ArrayList<>();
			List<ProductDTO> mediumRiskProducts = new ArrayList<>();
			List<ProductDTO> highRiskProducts = new ArrayList<>();
			List<ProductDTO> rateProducts = new ArrayList<>();

			System.out.println("상품리스트:" + AllproductList);

			for (ProductDTO product : AllproductList) {
				if (product.getRiskLevel().equals("고위험")) {
					highRiskProducts.add(product);
				} else if (product.getRiskLevel().equals("중위험")) {
					mediumRiskProducts.add(product);
				} else if (product.getRiskLevel().equals("저위험")) {
					lowRiskProducts.add(product);
				} else {
					rateProducts.add(product);
				}
			}

			model.addAttribute("highRiskProducts", highRiskProducts);
			model.addAttribute("mediumRiskProducts", mediumRiskProducts);
			model.addAttribute("lowRiskProducts", lowRiskProducts);
			model.addAttribute("rateProducts", rateProducts);
		}

		return "product/productStorage";
	}

	/*
	 * // 페이징처리
	 * 
	 * @GetMapping("productStorage/{pageNo}") public String
	 * productStorage(@PathVariable int pageNo, Model model) { int maxPage =
	 * PRODUCT_SERVICE.selectMaxPage(); System.out.println("maxPage : " + maxPage);
	 * int startPage = 0; int endPage = 0; // 만약 maxPage가 5이하일 경우 if (maxPage <= 5)
	 * { startPage = 1; endPage = maxPage; } else if (pageNo <= 3) { // 만약 pageNo가
	 * 3이하일 경우 startPage = 1; endPage = 5; } else if (pageNo >= maxPage - 2) { // 만약
	 * pageNo가 maxPage-2이상일 경우 startPage = maxPage - 4; endPage = maxPage; } else {
	 * // 그외의 경우 startPage = pageNo - 2; endPage = pageNo + 2; }
	 * 
	 * model.addAttribute("productList", PRODUCT_SERVICE.selectAll(pageNo));
	 * List<ProductDTO> AllproductList = (List<ProductDTO>)
	 * model.getAttribute("productList"); List<ProductDTO> lowRiskProducts = new
	 * ArrayList<>(); List<ProductDTO> mediumRiskProducts = new ArrayList<>();
	 * List<ProductDTO> highRiskProducts = new ArrayList<>(); List<ProductDTO>
	 * rateProducts = new ArrayList<>();
	 * 
	 * for (ProductDTO product : AllproductList) { if
	 * (product.getRiskLevel().equals("고위험")) { highRiskProducts.add(product); }
	 * else if (product.getRiskLevel().equals("중위험")) {
	 * mediumRiskProducts.add(product); } else if
	 * (product.getRiskLevel().equals("저위험")) { lowRiskProducts.add(product); } else
	 * { rateProducts.add(product); } }
	 * 
	 * model.addAttribute("startPage", startPage); model.addAttribute("endPage",
	 * endPage); model.addAttribute("maxPage", maxPage);
	 * model.addAttribute("highRiskProducts", highRiskProducts);
	 * model.addAttribute("mediumRiskProducts", mediumRiskProducts);
	 * model.addAttribute("lowRiskProducts", lowRiskProducts);
	 * model.addAttribute("rateProducts", rateProducts);
	 * 
	 * return "product/productStorage"; }
	 */

	// 상품 세부내용조회
	@GetMapping("productDetail/{id}")
	public String productDetail(@PathVariable int id, Model model) { // Model을 통해서 DB를 가져온다.
		System.out.println("상품세부조회:" + id);

		ProductDTO productDTO = PRODUCT_SERVICE.selectOne(id);
		model.addAttribute("productDTO", productDTO);
		return "product/productDetail";

	}

	// 펀드변경초기화면 0809
	@GetMapping("productChange")
	public String productChange(Authentication auth, HttpSession session, Model model) {

		// 로그인 정보가 없는 경우
		if (auth == null || !auth.isAuthenticated()) {
			session.setAttribute("isLoggedIn", false);
			System.out.println("로그인정보여부 : " + false);

		} else {
			UserDTO logIn = (UserDTO) auth.getPrincipal();
			int userId = logIn.getId();

			System.out.println("펀드변경 userId : " + userId);

			ContractDTO contractDTO = CONTRACT_SERVICE.selectContractByUserId(userId);
			System.out.println("productChange contractDTO1 : " + contractDTO);

			if (contractDTO == null) {
				model.addAttribute("contractDTO", contractDTO);

			} else {
				String policyNumber = contractDTO.getPolicyNumber();
				System.out.println("policyNumber" + policyNumber);
				List<DepositDTO> depositDTO = DEPOSIT_SERVICE.selectAll(policyNumber);
				System.out.println("depositDTO" + depositDTO);
				List<PickProdDTO> pickProdList;
				int reserves;
				int interest;

				if (depositDTO == null || depositDTO.isEmpty()) {
					pickProdList = PICKPROD_SERVICE.selectContractAll(policyNumber);
					int listLength = pickProdList.size();
					for (int i = 0; i < listLength; i++) {
						PickProdDTO pickProd = pickProdList.get(i);
						pickProd.setInterest(0);
						pickProd.setReserves(0);
					}
					System.out.println("productChange contractDTO" + contractDTO);
					System.out.println("수익추가 한 pickProdList" + pickProdList);
					model.addAttribute("contractDTO", contractDTO);
					model.addAttribute("policyNumber", policyNumber);
					model.addAttribute("pickProdList", pickProdList);
				} else {
					pickProdList = PICKPROD_SERVICE.selectContractAll(policyNumber);
					int listLength = pickProdList.size();
					int totalAmount = DEPOSIT_SERVICE.sumDepositAmount(policyNumber);
					System.out.println("productChange totalAmount" + totalAmount);
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
						System.out.println("productChange reserves" + reserves);
						pickProd.setInterest(interest);
						pickProd.setReserves(reserves);
					}
					System.out.println("productChange contractDTO" + contractDTO);
					System.out.println("수익추가 한 pickProdList" + pickProdList);
					model.addAttribute("contractDTO", contractDTO);
					model.addAttribute("policyNumber", policyNumber);
					model.addAttribute("pickProdList", pickProdList);
				}
			}
		}

		return "product/productChangeStep1";
	}

	// csv업로드& 다운로드 0817
	private static String decodeFromEucKrToUtf8(String str) {
		try {
			byte[] utf8StringBuffer = str.getBytes("utf-8");
			return new String(utf8StringBuffer, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return str;
		}
	}

	@PostMapping("productListExcelUpload")
	public String productListExcelUpload(HttpSession session, @RequestParam("file") List<MultipartFile> files,
			Model model) {

		System.out.println("파일 추가" + session.getServletContext().getRealPath("/"));
		String uploadPath = session.getServletContext().getRealPath("/") + "upload/";

		// 현재 날짜와 시간을 포맷팅하여 폴더명으로 사용
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmss");
		String uniqueFolderName = dateFormat.format(new Date());

		uploadPath += uniqueFolderName;
		String tempFilePath;
		File dir = new File(uploadPath);
		if (!dir.exists()) {
			dir.mkdirs();
		}

		try {
			for (MultipartFile file : files) {
				File temp = new File(uploadPath, file.getOriginalFilename());
				file.transferTo(temp);
				tempFilePath = temp.getAbsolutePath();
				System.out.println("temp : " + tempFilePath);
				List<ProductDTO> productList = new ArrayList<>();

				try {
					BufferedReader br = new BufferedReader(new FileReader(tempFilePath, Charset.forName("EUC-KR")));
					String line;
					boolean firstLine = true;

					while ((line = br.readLine()) != null) {
						if (firstLine) {
							firstLine = false;
							continue; // Skip header line
						}
						String decodedLine = decodeFromEucKrToUtf8(line);
						String[] fields = decodedLine.split(","); // Assuming comma-separated values

						if (fields.length == 7) { // Assuming 7 fields in the CSV
							ProductDTO product = new ProductDTO();
							product.setProductName(fields[0]);
							product.setRiskLevel(fields[1]);
							product.setProductStatus(fields[2]);
							product.setManageCompany(fields[3]);
							product.setFee(Float.parseFloat(fields[4]));
							;
							product.setRate(fields[5]);
							product.setContent(fields[6]);

							productList.add(product);
						}
					}
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}

				// Now 'products' list contains the parsed data
				for (ProductDTO product : productList) {
					System.out.println(product);
				}
				model.addAttribute("productList", productList);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "/admin/productExcelList";
	}

	@PostMapping("excelUpdateInsert")
	public String excelUpdateInsert(HttpSession session, ProductListWrapper productWrapperList) {

		System.out.println("productWrapperList.getList(): " + productWrapperList.getProductWrapperList());
		List<ProductDTO> productList = productWrapperList.getProductWrapperList();

		for (ProductDTO productDTO : productList) {
			System.out.println("상품추가 productDTO :" + productDTO);
		}

		for (ProductDTO productDTO : productList) {
			if (productDTO.getRiskLevel().contains("저위험")) {
				double rate = productDTO.getRate();
				productDTO.setMonthlyReturn(rate / 12);
				productDTO.setQuerterlyReturn(rate / 4);
				productDTO.setAnnualReturn(rate);
				productDTO.setTotalReturn(rate);
				System.out.println("insert 초저위험:" + productDTO);
			} else {

				double monthlyReturn = generateMonthlyReturn();
				System.out.println("랜덤값 1개월 수익률 : " + monthlyReturn);
				double querterlyReturn = generateQuerterlyReturn();
				System.out.println("랜덤값 3개월 수익률 : " + querterlyReturn);
				double annualReturn = generateAnnualReturn();
				System.out.println("랜덤값 1년 수익률 : " + annualReturn);
				double totalReturn = generateTotalReturn();
				System.out.println("랜덤값 총 수익률 : " + totalReturn);

				productDTO.setMonthlyReturn(monthlyReturn);
				productDTO.setQuerterlyReturn(querterlyReturn);
				productDTO.setAnnualReturn(annualReturn);
				productDTO.setTotalReturn(totalReturn);
				System.out.println("insert productDTO :" + productDTO);
			}

			PRODUCT_SERVICE.insert(productDTO);
		}

		return "redirect:/admin/product/" + 1;
	}

	// 상품검색
	@GetMapping("searchProduct")
	public String searchProduct(@RequestParam("search") String keyword, Model model) {
		List<ProductDTO> searchResults = PRODUCT_SERVICE.searchProduct(keyword);
		System.out.println("상품검색결과 :" + searchResults);

		model.addAttribute("productList", searchResults);
		return "product/productList";
	}
    //0822 계약리스트 도넛 카운트
    @ResponseBody
    @RequestMapping(value = "pickProductBest",  method = RequestMethod.POST)
    public String showPickProductBest(Model model) {
      System.out.println("도넛 왔니?");
       List<Map<String, Object>> pickProductList = PICKPROD_SERVICE.pickProdCount();
       for (Map<String, Object> pickProd : pickProductList) {
           System.out.println("상품이름: " + pickProd.get("product_name") + ", 선택비율: " + pickProd.get("selection_ratio"));
       }
       //리스트를Gson형태로 변환하기
       String pickProdListJson = new Gson().toJson(pickProductList);
       return pickProdListJson;
    }
    
}
