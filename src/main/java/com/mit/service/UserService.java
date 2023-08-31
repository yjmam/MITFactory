package com.mit.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import com.mit.model.UserDTO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Repository
public class UserService implements UserDetailsService {
	private final String NAMESPACE = "com.mit.mapper.UserMapper";
	private final SqlSession SESSION;

	@Autowired
	public UserService(SqlSession sqlSession) {
		this.SESSION = sqlSession;
	}

	public UserDTO auth(UserDTO userDTO) {
		return SESSION.selectOne(NAMESPACE + ".auth", userDTO);
	}

	public boolean register(UserDTO userDTO) {
		if (SESSION.selectOne(NAMESPACE + ".selectOneByUsername", userDTO) == null) {
			SESSION.insert(NAMESPACE + ".register", userDTO);
			return true;
		} else {
			return false;
		}
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserDTO userDTO = new UserDTO();
		userDTO.setUsername(username);

		UserDetails origin = SESSION.selectOne(NAMESPACE + ".selectOneByUsername", userDTO);

		return origin;
	}

	public List<UserDTO> selectAll() {
		return SESSION.selectList(NAMESPACE + ".selectAll");
	}

	public UserDTO myInfo(int id) {
		return SESSION.selectOne(NAMESPACE + ".selectOne", id);
	}

	public UserDTO myIrp(int id) {
		return SESSION.selectOne(NAMESPACE + ".selectOne", id);
	}

	public void update(UserDTO userDTO) {
		SESSION.update(NAMESPACE + ".update", userDTO);
	}

	// sms인증
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		String api_key = "NCSWR16XKB2SHHYN";
		String api_secret = "AVFPZROIDUEVMO7CLPTUGTJCVOVM2678";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", userPhoneNumber); // 수신전화번호
		params.put("from", "01077699442"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", "[TEST] 인증번호는" + "[" + randomNumber + "]" + "입니다."); // 문자 내용 입력
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}

	}
	
    //0811
	public UserDTO selectUserId(int userId) {		
		return SESSION.selectOne(NAMESPACE + ".selectOne", userId);
	}

}
