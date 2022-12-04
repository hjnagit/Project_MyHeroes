package com.myproject.service;

import java.util.List;

import com.myproject.heroes.domain.ChatVO;

public interface ChatService {
	public void insert(ChatVO vo) throws Exception;
	
	public List<ChatVO> chatAll() throws Exception;
}
