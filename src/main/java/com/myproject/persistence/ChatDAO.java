package com.myproject.persistence;

import java.util.List;

import com.myproject.heroes.domain.ChatVO;

public interface ChatDAO {
	public void insert(ChatVO vo) throws Exception;
	
	public List<ChatVO> chatAll() throws Exception;
}
