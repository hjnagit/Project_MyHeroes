package com.myproject.heroes;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.myproject.heroes.domain.ChatVO;
import com.myproject.service.ChatService;

@RestController
@RequestMapping("/ajax/*")
public class AjaxController {
	

	private static final Logger log = LoggerFactory.getLogger(AjaxController.class);
	
	@Inject
	private ChatService service;
	
	@GetMapping("/chatAll")
	public ResponseEntity<List<ChatVO>> chatAll() throws Exception {
		log.info("chatAll 왔음다 슝");
		
		return new ResponseEntity<List<ChatVO>>(service.chatAll(),HttpStatus.OK);
	}
	
}
