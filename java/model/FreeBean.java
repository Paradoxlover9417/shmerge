package org.example.goSeoul.model;


import java.util.Date;

import lombok.Data;

@Data
public class FreeBean {

    private int free_no;
    private int user_no;
    private String free_id;
    private String free_nick;
    private String free_title;
    private String free_content;
    private String free_category;
    private String free_tag;
    private int free_hit;
    private int free_like;
    private int free_dislike;
    private Date free_date;
    private String free_filename;


	// page
	private int startRow;
	private int endRow;
	// 검색
	private String search;
	private String keyword;

	// etc.
	private int ref;
	private int re_step;
	private int re_level;
	private String ip;
	
}