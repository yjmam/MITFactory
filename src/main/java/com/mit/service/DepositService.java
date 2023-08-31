package com.mit.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mit.model.ContractDTO;
import com.mit.model.DepositDTO;
import com.mit.model.PickProdDTO;
import com.mit.model.UserDTO;

@Repository
public class DepositService {
	private final String NAMESPACE = "com.mit.mapper.DepositMapper";
	private final SqlSession SESSION;

	@Autowired
	public DepositService(SqlSession sqlSession) {
		this.SESSION = sqlSession;
	}

	@Transactional
	public void insertDeposit(DepositDTO depositDTO) {
		SESSION.insert(NAMESPACE + ".insertDeposit", depositDTO);
	}

	// 0809
	public int sumDepositAmount(String policyNumber) {

		return SESSION.selectOne(NAMESPACE + ".sumDepositAmount", policyNumber);
	}

	// 0810
	public List<DepositDTO> selectAll(String policyNumber) {

		return SESSION.selectList(NAMESPACE + ".selectAll", policyNumber);
	}

	//0811 계약삭제시 deposit 삭제
	public void deleteDeposit(String policyNumber) {
		SESSION.delete(NAMESPACE + ".deleteDeposit", policyNumber);
		
	}

}
