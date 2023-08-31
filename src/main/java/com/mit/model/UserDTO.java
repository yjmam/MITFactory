package com.mit.model;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@Data
public class UserDTO implements UserDetails {
	private int id; // 아이디는 1000번부터 생성, 테스트 아이디는 9000번부터
	private String username;
	private String password;
	private String ssn; // 주민번호
	private String name;
	private String email;
	private String tel;
	private String role; // ROLE_RULE, ROLE_ADMIN
	private String birthYear;
	private String birthMonth;
	private String birthDay;
	private int recommenderId; //추천인아이디 0811
	private Timestamp entryDate;
	private Timestamp modifyDate;

	private List<GrantedAuthority> authorities;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(List<GrantedAuthority> authorities) {
		this.authorities = authorities;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

}
