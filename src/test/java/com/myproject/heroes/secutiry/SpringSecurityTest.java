package com.myproject.heroes.secutiry;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		{
			"file:src/main/webapp/WEB-INF/spring/root-context.xml",
			"file:src/main/webapp/WEB-INF/spring/security-context.xml"
		}
		)
public class SpringSecurityTest {
	
	private static final Logger log = LoggerFactory.getLogger(SpringSecurityTest.class);
	
	@Inject
	private DataSource ds;
	
	@Inject
	private PasswordEncoder pwEncoder;
	
	//@Test
	public void 암호화테스트() throws Exception {
		log.info("ψ(｀∇´)ψ 암호화테스트  호출됨");
		log.info("ψ(｀∇´)ψ 암호화테스트  12345: " + pwEncoder.encode("12345"));
	}
	
	//@Test
	public void 사용자생성() throws Exception{
		log.info("사용자생성 호출됨");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		for(int i=0; i<10; i++) {
			con = ds.getConnection();
			String sql = "insert into user(userid, pw, name, email) values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			String pw = pwEncoder.encode("pw"+i);
			pstmt.setString(2, pw);
			log.info("사용자생성 암호화된 pw : " + pw);
			
			if(i<8) {
				pstmt.setString(1, "user"+i);
				pstmt.setString(3, "사용자"+i);
				pstmt.setString(4, "user"+i+"@heroes.com");
			}else if(i<9) {
				pstmt.setString(1, "manager"+i);
				pstmt.setString(3, "매니저"+i);
				pstmt.setString(4, "manager"+i+"@heroes.com");
			}else {
				pstmt.setString(1, "admin"+i);
				pstmt.setString(3, "관리자"+i);
				pstmt.setString(4, "admin"+i+"@heroes.com");
			}
			pstmt.executeUpdate();
		}
		
		
	}
	
	@Test
	public void 인증정보테이블() throws Exception{
		log.info("ψ(｀∇´)ψ 인증정보테이블  호출됨");
		// 마이바티스 뭐 이런 거 안 쓰고 연결 잘 되나 테스트~

		Connection con = null;
		PreparedStatement pstmt = null;
		
		for(int i = 0; i < 10; i++) {
			con = ds.getConnection();
			String sql = "insert into user_auth(userid, auth) "
					+ "values(?, ?)";
			pstmt = con.prepareStatement(sql);
			// 아이디: user1   /  권한:  ROLE_USER  ROLE_MANAGER    ROLE_ADMIN

			if( i < 8 ) {
				// 유저 만들고
				pstmt.setString(1, "user"+i);
				pstmt.setString(2, "ROLE_USER");
			} else if (i < 9) {
				// 매니저 만들고
				pstmt.setString(1, "manager"+i);
				pstmt.setString(2, "ROLE_MANAGER");
			} else {
				// 관리자 만들고
				pstmt.setString(1, "admin"+i);
				pstmt.setString(2, "ROLE_ADMIN");
			}
			pstmt.executeUpdate();
		}// for
	}
}
