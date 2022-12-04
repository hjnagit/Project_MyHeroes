package com.myproject.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myproject.heroes.domain.ChatVO;

@Repository
public class ChatDAOImpl implements ChatDAO{

	private static final Logger log = LoggerFactory.getLogger(ChatDAOImpl.class);
	
	private static final String NAMESPACE = "com.myproject.heroes.mappers.ChatMapper";

	@Inject
	private SqlSession sqlSession;

	
	@Override
	public void insert(ChatVO vo) throws Exception {
		sqlSession.insert(NAMESPACE+".insert", vo);
	}


	@Override
	public List<ChatVO> chatAll() throws Exception {
		return sqlSession.selectList(NAMESPACE+".chatAll");
	}

}
