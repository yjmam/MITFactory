package com.mit.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//엑셀다운import
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.mit.model.ContractDTO;
import com.mit.model.ProductDTO;
import com.mit.model.UserDTO;
import com.mit.service.AdminService;
import com.mit.service.ContractService;
import com.mit.service.DepositService;
import com.mit.service.PickProdService;
import com.mit.service.ProductService;

@RequestMapping("/admin/")
@Controller
public class AdminController {

	private final ProductService PRODUCT_SERVICE;
	private final ContractService CONTRACT_SERVICE;
	private final DepositService DEPOSIT_SERVICE;
	private final PickProdService PICKPROD_SERVICE; // 상품별 선택비율그래프위해 선언
	private final AdminService ADMIN_SERVICE; // 0818

	@Autowired
	public AdminController(ProductService productService, ContractService contractService,
			DepositService depositService, PickProdService pickProdService, AdminService adminService) {
		this.PRODUCT_SERVICE = productService;
		this.CONTRACT_SERVICE = contractService;
		this.DEPOSIT_SERVICE = depositService;
		this.PICKPROD_SERVICE = pickProdService;
		this.ADMIN_SERVICE = adminService;
	}

	@GetMapping("product")
	public String showAdminProduct(Model model) {
		return "admin/product";
	}

	// 페이징처리
	@GetMapping("product/{pageNo}")
	public String showAdminProduct(@PathVariable int pageNo, Authentication auth, Model model) {
		int maxPage = PRODUCT_SERVICE.selectMaxPage();
		System.out.println("maxPage : " + maxPage);
		int startPage = 0;
		int endPage = 0;
		// 만약 maxPage가 5이하일 경우
		if (maxPage <= 5) {
			startPage = 1;
			endPage = maxPage;
		} else if (pageNo <= 3) {
			// 만약 pageNo가 3이하일 경우
			startPage = 1;
			endPage = 5;
		} else if (pageNo >= maxPage - 2) {
			// 만약 pageNo가 maxPage-2이상일 경우
			startPage = maxPage - 4;
			endPage = maxPage;
		} else {
			// 그외의 경우
			startPage = pageNo - 2;
			endPage = pageNo + 2;
		}

		UserDTO logIn = (UserDTO) auth.getPrincipal();
		model.addAttribute("logInRole", logIn.getRole());
		model.addAttribute("logInUsername", logIn.getUsername());
		model.addAttribute("productList", PRODUCT_SERVICE.selectAll(pageNo));
		// "productList" 데이터를 서버 콘솔에 출력
		List<ProductDTO> productList = (List<ProductDTO>) model.getAttribute("productList");
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("maxPage", maxPage);
		return "admin/product";

	}

	@GetMapping("productInsert")
	public String showInsertProduct(Authentication auth, Model model) {
		UserDTO logIn = (UserDTO) auth.getPrincipal();
		model.addAttribute("logInUsername", logIn.getUsername());
		return "admin/productInsert";
	}

	@GetMapping("productUpdate/{productId}")
	public String showUpdateProduct(@PathVariable int productId, HttpSession session, Authentication auth,
			Model model) {

		UserDTO logIn = (UserDTO) auth.getPrincipal();
		ProductDTO productDTO = PRODUCT_SERVICE.selectOne(productId);
		model.addAttribute("productDTO", productDTO);
		model.addAttribute("logInUsername", logIn.getUsername());
		model.addAttribute("logInRole", logIn.getRole());

		return "admin/productUpdate";
	}

	@GetMapping("cancellation/{pageNo}")
	public String showCancellationContract(@PathVariable int pageNo, Authentication auth, Model model) {
		int maxPage = CONTRACT_SERVICE.selectMaxPage();
		System.out.println("maxPage : " + maxPage);
		int startPage = 0;
		int endPage = 0;
		// 만약 maxPage가 5이하일 경우
		if (maxPage <= 5) {
			startPage = 1;
			endPage = maxPage;
		} else if (pageNo <= 3) {
			// 만약 pageNo가 3이하일 경우
			startPage = 1;
			endPage = 5;
		} else if (pageNo >= maxPage - 2) {
			// 만약 pageNo가 maxPage-2이상일 경우
			startPage = maxPage - 4;
			endPage = maxPage;
		} else {
			// 그외의 경우
			startPage = pageNo - 2;
			endPage = pageNo + 2;
		}

		UserDTO logIn = (UserDTO) auth.getPrincipal();
		model.addAttribute("logInRole", logIn.getRole());
		model.addAttribute("logInUsername", logIn.getUsername());

		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("maxPage", maxPage);

		model.addAttribute("cancellationList", CONTRACT_SERVICE.selectCancellation(pageNo));

		// "cancellationList" 데이터를 서버 콘솔에 출력
		List<ContractDTO> cancellationList = (List<ContractDTO>) model.getAttribute("cancellationList");
		for (ContractDTO contract : cancellationList) {
			System.out.println(contract);
		}

		return "admin/cancellation";
	}

	@GetMapping("pickProductCount")
	public String showPickProdCount(Authentication auth, Model model) {
		UserDTO logIn = (UserDTO) auth.getPrincipal();
		model.addAttribute("logInUsername", logIn.getUsername());

		List<Map<String, Object>> pickProductList = PICKPROD_SERVICE.pickProdCount();
		for (Map<String, Object> pickProd : pickProductList) {
			System.out.println("상품이름: " + pickProd.get("product_name") + ", 선택비율: " + pickProd.get("selection_ratio"));
		}

		// 리스트를Gson형태로 변환하기
		String pickProdListJson = new Gson().toJson(pickProductList);
		model.addAttribute("pickProdListJson", pickProdListJson);

		return "admin/pickProductCount";
	}

	// 관리자 고객계약리스트 출력 0810
	@GetMapping("contractStatus/{pageNo}")
	public String ContractStatus(@PathVariable int pageNo, Model model) {
		int maxPage = CONTRACT_SERVICE.selectContractMaxPage();
		System.out.println("maxPage : " + maxPage);
		int startPage = 0;
		int endPage = 0;
		// 만약 maxPage가 5이하일 경우
		if (maxPage <= 5) {
			startPage = 1;
			endPage = maxPage;
		} else if (pageNo <= 3) {
			// 만약 pageNo가 3이하일 경우
			startPage = 1;
			endPage = 5;
		} else if (pageNo >= maxPage - 2) {
			// 만약 pageNo가 maxPage-2이상일 경우
			startPage = maxPage - 4;
			endPage = maxPage;
		} else {
			// 그외의 경우
			startPage = pageNo - 2;
			endPage = pageNo + 2;
		}

		List<ContractDTO> contractList = CONTRACT_SERVICE.selectAdminContract(pageNo);
		/*
		 * for (ContractDTO contract : contractList) { System.out.println(contract); }
		 */
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("contractList", contractList);

		return "admin/adminContractStatus";

	}

	// 엑셀다운로드
	@GetMapping("/excel/download")
	public void excelDownload(HttpServletResponse response) throws IOException {
		List<ContractDTO> contractList = CONTRACT_SERVICE.excelAdminContract();
		for (ContractDTO contract : contractList) {
			System.out.println(contract);
		}
		Row row = null;
		Cell dataCell = null;

		Workbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("계약리스트");
		CellStyle style = wb.createCellStyle(); // 셀 스타일 생성
		Font font = wb.createFont(); // 폰트 스타일 생성

		font.setBoldweight(Font.BOLDWEIGHT_BOLD); // 글자 진하게
		font.setFontHeight((short) (16 * 18)); // 글자 크기
		font.setFontName("맑은 고딕"); // 글씨체

		Row titleRow = sheet.createRow(0); // 타이틀행을 생성한다. 첫번째줄이기때문에 createRow(0)
		int rowNum = 0;

		Cell titleCell = titleRow.createCell(rowNum); // 첫번째행의 첫번째열을 지정한다.
		titleCell.setCellValue("◎ IRP 계약현황 ◎"); // setCellValue 셀에 값넣기.
		titleRow.setHeight((short) 920); // Row에서 setHeight를 하면 행 높이가 조정된다.
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 5)); // 셀 병합 첫번째줄~아홉번째 열까지 병합
		// new CellRangeAddress(시작 row, 끝 row, 시작 col, 끝 col)

		style.setWrapText(true); // 문자열을 입력할때 \n 같은 개행을 인식해준다.
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); // 수직 가운데 정렬
		style.setAlignment(CellStyle.ALIGN_CENTER); // 수평 가운데 정렬
		style.setFont(font); // 스타일에 font 스타일 적용하기
		titleCell.setCellStyle(style); // 정리한 스타일들을 titleCell에 적용해주자 !

		CellStyle dataStyle = wb.createCellStyle(); // 데이터스타일은 테두리를 만들어보자
		dataStyle.setBorderRight(HSSFCellStyle.BORDER_THIN); // 오른쪽 테두리
		dataStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN); // 왼쪽 테두리
		dataStyle.setBorderTop(HSSFCellStyle.BORDER_THIN); // 상단 테두리
		dataStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 하단 테두리

		// Header
		row = sheet.createRow(3);
		dataCell = row.createCell(0);
		dataCell.setCellValue(" ");

		dataCell = row.createCell(1);
		dataCell.setCellValue("증권번호");
		dataCell = row.createCell(2);
		dataCell.setCellValue("이름");
		dataCell = row.createCell(3);
		dataCell.setCellValue("계약상태");
		dataCell = row.createCell(4);
		dataCell.setCellValue("계약일자");
		dataCell = row.createCell(5);
		dataCell.setCellValue("해지일자");

		int listLength = contractList.size();
		rowNum = 4; // 네번째줄이 헤더니까 그 밑에서부터 데이터 삽입
		int cellNum = 0;
		Row dataRow = null; // for문을 돌려주기위해.

		// Body
		for (int i = 0; i < listLength; i++) {
			cellNum = 0;
			dataRow = sheet.createRow(rowNum++); // for문 돌면서 행 1줄씩 추가
			dataCell = dataRow.createCell(cellNum++); // 열 한줄씩 추가
			dataCell.setCellValue(i + 1); // 첫번째칸은 순번
			// dataCell.setCellStyle(dataStyle); // 테두리 스타일 적용

			ContractDTO contractDTO = contractList.get(i);

			dataCell = dataRow.createCell(cellNum++);
			dataCell.setCellValue(contractDTO.getPolicyNumber());

			dataCell = dataRow.createCell(cellNum++);
			dataCell.setCellValue(contractDTO.getName());

			dataCell = dataRow.createCell(cellNum++);
			dataCell.setCellValue(contractDTO.getContractStatus());

			dataCell = dataRow.createCell(cellNum++);
			String entryDatetime = contractDTO.getEntryDate().toString();
			System.out.println("contractDTO 계약일자" + entryDatetime);
			String entryDatePart = entryDatetime.substring(0, 10);
			System.out.println("contractDTO 계약일자 entryDatePart" + entryDatePart);
			dataCell.setCellValue(entryDatePart);

			dataCell = dataRow.createCell(cellNum++);
			if (contractDTO.getEndDate() != null) {
				String endDatetime = contractDTO.getEndDate().toString();
				String endDatePart = endDatetime.substring(0, 10);
				dataCell.setCellValue(endDatePart);
			} else {
				dataCell.setCellValue(""); // 빈 값 처리
			}

		}

		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename=contract.xlsx");

		// Excel File Output
		wb.write(response.getOutputStream());
	}

	// 서버저장파일 파일 업로드 csvform다운로드0818
	@RequestMapping(value = "/csvFormDownLoad", method = RequestMethod.GET)
	public void fileDownLoad(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String downloadPath = session.getServletContext().getRealPath("/") + "download/";
		ADMIN_SERVICE.csvfileDownLoad(request, response, downloadPath);
	}

	// 0821 계약현황 그래프
	@ResponseBody
	@RequestMapping(value = "dailyContractCount", method = RequestMethod.POST)
	public String showDailyContractCount(Model model) {

		List<Map<String, Object>> contractCountList = CONTRACT_SERVICE.dailyContractCount();

		List<Map<String, Object>> newContractDataList = new ArrayList<>();
		// 날짜형식 조정하기 2023-07-23T00:00 -> 2023-07-23
		for (Map<String, Object> contractData : contractCountList) {
			String datetime = contractData.get("entry_date").toString();
			String datePart = datetime.substring(0, 10);

			Map<String, Object> newContractData = new HashMap<>();
			newContractData.put("entry_date", datePart);
			newContractData.put("contract_count", contractData.get("contract_count"));

			newContractDataList.add(newContractData);
		}

		// 리스트를Gson형태로 변환하기
		// JsonObject json = new JsonObject();
		String newContractDataListJson = new Gson().toJson(newContractDataList);
		/*
		 * model.addAttribute("newContractDataListJson", newContractDataListJson);
		 * json.addProperty("newContractDataListJson", newContractDataListJson);
		 */
		// return "admin/dailyContractCount";

		return newContractDataListJson;
	}

	// 0821 계약현황 계약상태별 갯수
	@ResponseBody
	@RequestMapping(value = "contractStatusCount", method = RequestMethod.POST)
	public String showcontractStatusCount(Model model) {
		List<Map<String, Object>> contractCount = CONTRACT_SERVICE.contractStatusCount();
		String ContractStatusJson = new Gson().toJson(contractCount);
		return ContractStatusJson;
	}

	// 0823 배치대신 계약삭제
	@ResponseBody
	@RequestMapping(value = "contractDelete", method = RequestMethod.GET)
	public int contractDelete() {
		System.out.println("삭제 ㅏㅏㅇ낭나?");
		int result = CONTRACT_SERVICE.contractDelete();
		System.out.println("삭제개수" + result);
		return result;
	}

	
	//그냥
	public int Delete() {
		System.out.println("삭제 들어왔어?");
		int result = CONTRACT_SERVICE.contractDelete();
		System.out.println("삭제개수" + result);
		return result;
	}
}