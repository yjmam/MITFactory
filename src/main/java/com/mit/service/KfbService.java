package com.mit.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mit.model.ContractDTO;
import com.mit.model.KfbDTO;

@Repository
public class KfbService {
	private final String NAMESPACE = "com.mit.mapper.KfbMapper";
	private final SqlSession SESSION;

	@Autowired
	public KfbService(SqlSession sqlSession) {
		this.SESSION = sqlSession;
	}

	//관리자해지승인 시 kfb 한도 업데이트 
	public void updateKfb(ContractDTO contractDTO) {
		SESSION.update(NAMESPACE + ".updateKfb", contractDTO);
	}

	// AccountController 에서 user의 ssn 기준으로 KFB 한도 정보 조회
	public KfbDTO selectBySsn(String ssn) {
		return SESSION.selectOne(NAMESPACE + ".selectBySsn", ssn);
	}

	//kfb테이블 기고객의 경우 한도 업데이트 
	public void updateLimitAmount(String ssn, int setAmount) {
		HashMap<String, Object> paramMap = new HashMap<>();
		paramMap.put("ssn", ssn);		
		paramMap.put("setAmount", setAmount);  //contract의 setAmount(한도)를 limitAmount로 설정 
		SESSION.update(NAMESPACE + ".updateLimitAmount", paramMap);
	}

	//KFB 정보 insert 
	public void insertKfb(KfbDTO kfbDTO) {
		 SESSION.insert(NAMESPACE + ".insertKfb", kfbDTO);		
	}

}