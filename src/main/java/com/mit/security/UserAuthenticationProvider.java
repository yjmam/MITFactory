package com.mit.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.mit.model.UserDTO;
import com.mit.service.UserService;

@Service
public class UserAuthenticationProvider implements AuthenticationProvider {
	private final UserService USER_SERVICE;
	private final BCryptPasswordEncoder PASSWORD_ENCODER;
	
	@Autowired
	public UserAuthenticationProvider(UserService userService, BCryptPasswordEncoder passwordEncoder) {
		this.USER_SERVICE = userService;
		this.PASSWORD_ENCODER = passwordEncoder;
		
	}

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = authentication.getPrincipal().toString();
		String password = authentication.getCredentials().toString();
			
		System.out.println("username: " + username);
		System.out.println("password: " + password);
		
		UserDTO userDTO = (UserDTO) USER_SERVICE.loadUserByUsername(username);
		
	      if (userDTO != null && PASSWORD_ENCODER.matches(password, userDTO.getPassword())) {
	          List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
	          authorities.add(new SimpleGrantedAuthority(userDTO.getRole()));

	          for (GrantedAuthority authority : authorities) {
	             System.out.println(authority.getAuthority());
	          }
	             
	          userDTO.setAuthorities(authorities);

	          return new UsernamePasswordAuthenticationToken(userDTO, null, userDTO.getAuthorities());
	       }

	       return null;

	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

}
