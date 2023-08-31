package com.mit.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mit.model.PickProdDTO;

@Repository
public class PickProdService {
	private final String NAMESPACE = "com.mit.mapper.PickProdMapper";
	private final SqlSession SESSION;

	@Autowired
	public PickProdService(SqlSession sqlSession) {
		this.SESSION = sqlSession;
	}

	// 선택된상품 PickProd 리스트에 등록
	public void register(List<PickProdDTO> selectedProducts) {
		SESSION.insert(NAMESPACE + ".insert", selectedProducts);

//			for (PickProdDTO pickProdDTO : selectedProducts) {
//				SESSION.insert(NAMESPACE + ".insert", pickProdDTO);
//			}
	}

	// 선택 상품 전체조회
	public List<PickProdDTO> selectAll() {
		return SESSION.selectList(NAMESPACE + ".selectAll");
	}

	// 해당 증번의 상품 조회
	public List<PickProdDTO> selectPolicyNumber(String policyNumber) {
		System.out.println("pickprodServie:" + policyNumber);
		return SESSION.selectList(NAMESPACE + ".selectPolicyNumber", policyNumber);
	}

	public int updateRatio(PickProdDTO pickProdDTO) {
		return SESSION.update(NAMESPACE + ".updateRatio", pickProdDTO);
	}

	// 통계, 전체 중 상품선택비율
	public List<Map<String, Object>> pickProdCount() {
		return SESSION.selectList(NAMESPACE + ".pickProdCount");
	}

	// 개별계약의 상품비중
	public List<PickProdDTO> selectContractAll(String policyNumber) {
		return SESSION.selectList(NAMESPACE + ".selectContractAll", policyNumber);
	}

	// 신규 중복방지 위한 pickprod 삭제 0809
	public void delete(String policyNumber) {
		SESSION.delete(NAMESPACE + ".delete", policyNumber);

	}

	// 펀드변경위해 insert 0809
	public void changePickProd(PickProdDTO pickProdDTOList) {
		SESSION.insert(NAMESPACE + ".changePickProd", pickProdDTOList);

	}
}
