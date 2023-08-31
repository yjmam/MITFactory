package com.mit.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mit.model.ContractDTO;

@Repository
public class ContractService {
	private final String NAMESPACE = "com.mit.mapper.ContractMapper";
	private final SqlSession SESSION;
	private final int PAGE_SIZE = 10;

	@Autowired
	public ContractService(SqlSession sqlSession) {
		this.SESSION = sqlSession;

	}

	public int getMaxId() {
		return SESSION.selectOne(NAMESPACE + ".getMaxId");
	}

	// 전체리스트 줄때, 페이징처리된 값도 함께주기
	public List<ContractDTO> selectCancellation(int pageNo) {
		HashMap<String, Integer> paramMap = new HashMap<>();
		paramMap.put("size", PAGE_SIZE);
		paramMap.put("startRow", (pageNo - 1) * PAGE_SIZE);
		return SESSION.selectList(NAMESPACE + ".selectCancellation", paramMap);
	}

	// 페이징처리 위한선언
	public int selectMaxPage() {
		int total = SESSION.selectOne(NAMESPACE + ".countCancellation");
		int maxPage = total / PAGE_SIZE;
		if (total % PAGE_SIZE != 0) {
			maxPage++;
		}
		System.out.println("MaxPage: " + maxPage);
		return maxPage;
	}

	public ContractDTO selectOne(String policyNumber) {

		return SESSION.selectOne(NAMESPACE + ".selectOne", policyNumber);
	}

	public void update(ContractDTO contractDTO) {

		SESSION.update(NAMESPACE + ".update", contractDTO);
	}

	public void create(ContractDTO contractDTO) {
		SESSION.insert(NAMESPACE + ".create", contractDTO);

	}

	// 사용자기준 최근등록된 증번 조회(deposit에서도 사용)
	public String selectByUserId(int userId) {
		return SESSION.selectOne(NAMESPACE + ".getPolicyNumberByUserId", userId);

	}

	public void updateamount(ContractDTO contractDTO) {
		System.out.println("여기왔다 updateamount");
		SESSION.update(NAMESPACE + ".updateamount", contractDTO);

	}

	// 관리자 해지접수중인것 체크
	public ContractDTO selectCancel(String policyNumber) {

		return SESSION.selectOne(NAMESPACE + ".selectCancel", policyNumber);
	}

	// 관리자해지승인시 계약상태 update
	public void adminUpdate(ContractDTO contractDTO) {

		SESSION.update(NAMESPACE + ".adminUpdate", contractDTO);
	}

	// 일자별 가입현황출력
	public List<Map<String, Object>> dailyContractCount() {
		return SESSION.selectList(NAMESPACE + ".dailyContractCount");
	}

	// 계약해지신청위해 입력
	public ContractDTO selectContractByUserId(int userId) {
		return SESSION.selectOne(NAMESPACE + ".selectContractByUserId", userId);
	}

	// 고객 계약해지시 계약상태 변경
	public int updateContractStatus(ContractDTO contractDTO) {
		return SESSION.update(NAMESPACE + ".updateContractStatus", contractDTO);

	}

	// IRP가입시 당사계약여부 체크
	public List<Object> selectAllContract(int userId) {
		return SESSION.selectList(NAMESPACE + ".selectAllContract", userId);
	}

	public String getContractStatusByPolicyNumber(String policyNumber) { // 다인 deposit
		return SESSION.selectOne(NAMESPACE + ".getContractStatusByPolicyNumber", policyNumber);
	}

	public int getSetAmountByPolicyNumber(String policyNumber) { // 다인 deposit
		return SESSION.selectOne(NAMESPACE + ".getSetAmountByPolicyNumber", policyNumber);
	}

	// 계약전체 가져오기
	public List<ContractDTO> selectAdminContract(int pageNo) {
		HashMap<String, Integer> paramMap = new HashMap<>();
		paramMap.put("size", PAGE_SIZE);
		paramMap.put("startRow", (pageNo - 1) * PAGE_SIZE);
		return SESSION.selectList(NAMESPACE + ".selectAdimAllContract", paramMap);
	}

	// 페이징처리 위한선언
	public int selectContractMaxPage() {
		int total = SESSION.selectOne(NAMESPACE + ".countContract");
		int maxPage = total / PAGE_SIZE;
		if (total % PAGE_SIZE != 0) {
			maxPage++;
		}
		System.out.println("MaxPage: " + maxPage);
		return maxPage;
	}

	public List<ContractDTO> excelAdminContract() {
		return SESSION.selectList(NAMESPACE + ".excelAdimAllContract");
	}

	// 서명저장
	public void updateContractConfirm(ContractDTO contractDTO) {
		SESSION.update(NAMESPACE + ".updateContractConfirm", contractDTO);
	}

	// 배치용
	public int delete() {
		return SESSION.delete(NAMESPACE + ".delete");
	}

	// 0821 admin카운트
	public List<Map<String, Object>> contractStatusCount() {
		return SESSION.selectList(NAMESPACE + ".contractStatusCount");
	}

	   // 0823 admin계약삭제
	   public int contractDelete() {
	      return SESSION.delete(NAMESPACE + ".contractDelete");
	   }
}
