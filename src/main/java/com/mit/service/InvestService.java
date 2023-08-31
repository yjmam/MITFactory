package com.mit.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mit.model.InvestDTO;

@Service
public class InvestService {
	private final String NAMESPACE = "com.mit.mapper.InvestMapper";
	private final SqlSession SESSION;

	@Autowired
	public InvestService(SqlSession sqlSession) {
		this.SESSION = sqlSession;
	}

//데이터베이스에 투자 결과를 저장하는 메서드
	public void saveInvestResult(Integer userId, String investResult) {

		if (userId == null) {
			userId = -1;
		}
		InvestDTO investDTO = new InvestDTO();
		investDTO.setUserId(userId);
		investDTO.setInvestResult(investResult);

		SESSION.insert(NAMESPACE + ".saveInvestResult", investDTO);
	}

//userId 기준 투자성향 가져오기 
	public InvestDTO getInvestByUserId(int userId) {
		return SESSION.selectOne(NAMESPACE + ".selectOne", userId);
	}
}