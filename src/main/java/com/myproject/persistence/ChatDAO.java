package com.myproject.persistence;

import com.myproject.heroes.domain.ChatVO;

public interface ChatDAO {
	public void insert(ChatVO vo) throws Exception;
}
