package com.mit.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Service;

import com.mit.model.UserDTO;

// 로그인 성공했을때 다음 연결동작 정의
@Service
public class UserLogInSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		System.out.print("여기까진왔어" + authentication);
		
		 // 인증된 사용자 정보 가져오기
        UserDTO userDTO = (UserDTO) authentication.getPrincipal();

        // 사용자 이름과 권한(role) 정보를 세션에 저장합니다.
        int logInId = userDTO.getId();
        String logInUsername = userDTO.getUsername();
        String logInRole = userDTO.getRole();

        request.getSession().setAttribute("logInId", logInId);
        request.getSession().setAttribute("logInUsername", logInUsername);
        request.getSession().setAttribute("logInRole", logInRole);

        response.sendRedirect("/");
    }

}
