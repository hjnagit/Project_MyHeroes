package com.myproject.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myproject.heroes.domain.ChatVO;
import com.myproject.persistence.ChatDAO;

@Service
public class ChatServiceImpl implements ChatService {

	private static final Logger log = LoggerFactory.getLogger(ChatServiceImpl.class);


	@Inject
	private ChatDAO dao;

	@Override
	public void insert(ChatVO vo) throws Exception {
		dao.insert(vo);
	}

	@Override
	public List<ChatVO> chatAll() throws Exception {
		return dao.chatAll();
	}

}
