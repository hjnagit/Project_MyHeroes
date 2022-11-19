package com.myproject.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;

public class CustomNoopPasswordEncoder implements PasswordEncoder{
	// 멤버변수
	private static final Logger log = LoggerFactory.getLogger(CustomNoopPasswordEncoder.class);
	
	// password = "{noop}1234"
	// 비밀번호 암호화(인코딩) 필수임.. 스프링 5부터?  --> so 일단 임시로 인코딩
		
	
	@Override
	public String encode(CharSequence rawPassword) {
		// 사용자가 입력한 비밀번호를 인코딩(암호화)
		log.info(" rawPassword : " + rawPassword);
		
		return rawPassword.toString();
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		log.info("(～￣▽￣)～ encode()   rawPassword: " + rawPassword);
		log.info("(～￣▽￣)～ encode()   encodedPassword: " + encodedPassword);
		// 원시 데이터 vs 인코딩한 데이터 비교
		
		//    입력한 비밀번호랑 -- 인코딩한 거랑 같은지 물어봄 --> 같으면? true / 다르면? false
		return rawPassword.toString().equals(encodedPassword);
	}

}
