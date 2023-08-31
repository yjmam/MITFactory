package com.mit.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mit.model.AccountDTO;
import com.mit.model.ContractDTO;

@Repository
public class AccountService {
	private final String NAMESPACE = "com.mit.mapper.AccountMapper";
	private final SqlSession SESSION;

	@Autowired
	public AccountService(SqlSession sqlSession) {
		this.SESSION = sqlSession;
	}

	public void register(AccountDTO accountDTO) {
		System.out.println("----accountService----");
		SESSION.insert(NAMESPACE + ".insert", accountDTO);
	}
	
	public AccountDTO selectOne(String policyNumber) {
		
		return SESSION.selectOne(NAMESPACE + ".selectOne", policyNumber);
	}
	
	public AccountDTO selectAccount(String policyNumber) {
		return SESSION.selectOne(NAMESPACE + ".selectAccount", policyNumber);
	}
}