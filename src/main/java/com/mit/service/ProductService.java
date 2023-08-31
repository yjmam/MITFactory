package com.mit.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mit.model.ProductDTO;

@Repository
public class ProductService {
	private final String NAMESPACE = "com.mit.mapper.ProductMapper";
	private final SqlSession SESSION;
	private final int PAGE_SIZE = 10;

	@Autowired
	public ProductService(SqlSession sqlSession) {
		this.SESSION = sqlSession;
	}

	public void insert(ProductDTO productDTO) {
		SESSION.insert(NAMESPACE + ".register", productDTO);
	}

	// 전체리스트 줄때, 페이징처리된 값도 함께주기
	public List<ProductDTO> selectAll(int pageNo) {
		HashMap<String, Integer> paramMap = new HashMap<>();
		paramMap.put("size", PAGE_SIZE);
		paramMap.put("startRow", (pageNo - 1) * PAGE_SIZE);
		return SESSION.selectList(NAMESPACE + ".selectAll", paramMap);
	}

	// 페이징처리 위한선언
	public int selectMaxPage() {
		int total = SESSION.selectOne(NAMESPACE + ".count");
		int maxPage = total / PAGE_SIZE;
		if (total % PAGE_SIZE != 0) {
			maxPage++;
		}
		System.out.println("MaxPage: " + maxPage);
		return maxPage;
	}

	public ProductDTO selectOne(int productId) {
		return SESSION.selectOne(NAMESPACE + ".selectOne", productId);
	}

	public void update(ProductDTO productDTO) {
		SESSION.update(NAMESPACE + ".update", productDTO);
	}

	public List<ProductDTO> selectInvestByUserId(int userId) {
		return SESSION.selectList(NAMESPACE + ".selectInvest", userId);
	}

	public List<ProductDTO> selectSimpleProduct() { // 간편운용지시 상품조회 추가 (0804)
		return SESSION.selectList(NAMESPACE + ".selectSimpleProduct");
	}

	// 상품공시실 전체리스트 
	public List<ProductDTO> selectAll() {		
		return SESSION.selectList(NAMESPACE + ".selectAllStorage");
	}

	// 상위수익률 조회
	public List<ProductDTO> selectTopTotalReturn(int userId) {
		System.out.println("수익률조회 userid:" + userId);
		return SESSION.selectList(NAMESPACE + ".selectTopTotalReturn", userId);
	}

	// 위험등급 별 많이 선택한 상품리스트
	public List<ProductDTO> selectTopForHighRisk() {
		return SESSION.selectList(NAMESPACE + ".selectTopProductsForHighRisk");
	}

	public List<ProductDTO> selectTopForMediumRisk() {
		return SESSION.selectList(NAMESPACE + ".selectTopProductsForMediumRisk");
	}

	public List<ProductDTO> selectTopForLowRisk() {
		return SESSION.selectList(NAMESPACE + ".selectTopProductsForlowRisk");
	}
	
	public List<ProductDTO> selectTopForveryLowRisk() {
		return SESSION.selectList(NAMESPACE + ".selectTopForveryLowRisk");
	}

	//상품검색 기능 
	public List<ProductDTO> searchProduct(String keyword) {
		return SESSION.selectList(NAMESPACE + ".searchProductsByKeyword", keyword);
	}
	
	public List<ProductDTO> searchSimpleProduct(String keyword) {
		System.out.println("simple검색");
		return SESSION.selectList(NAMESPACE + ".searchSimpleProductsByKeyword", keyword);
	}

}
