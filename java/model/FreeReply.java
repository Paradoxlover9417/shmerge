package org.example.goSeoul.model;

import java.sql.Date;

import lombok.Data;

@Data
public class FreeReply {
	private int freereply_no;
	private int free_no;
	private String freereply_id;
	private String freereply_nick;
	private String freereply_content;
	private Date freereply_date;


}