package com.myproject.heroes.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ChatVO {
	private int chat_bno;
	private String chat_content;
	private String user_id;
	private Timestamp chat_ragdate;
	private Timestamp chat_updatedate;
}
