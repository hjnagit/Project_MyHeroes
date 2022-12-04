package com.myproject.heroes;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myproject.heroes.domain.ChatVO;
import com.myproject.service.ChatService;

@Controller
@RequestMapping("/with/*")
public class ChatController {
	

	private static final Logger log = LoggerFactory.getLogger(ChatController.class);
	
	@Inject
	private ChatService service;
	
	@GetMapping("/games")
	public void accessDenied() {
		log.info("games() 호출 ");
	}
	
	@GetMapping("/insertAjax")
	//public @ResponseBody ResponseEntity<String> insertContent( ChatVO vo) throws Exception {
	public String insertContent( ChatVO vo) throws Exception {
		log.info("insert 왔음다 슝");
		log.info(vo+"");
		service.insert(vo);
		
		log.info("@@@@@@@@@@@@@@끝임다");
		//return new ResponseEntity<String>("WriteOK",HttpStatus.OK);
		return "/with/games";
	}
	
	
	
}
