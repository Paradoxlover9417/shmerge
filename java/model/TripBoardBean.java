package org.example.goSeoul.model;

import java.util.Date;

import lombok.Data;

@Data
public class TripBoardBean {
	 private String travel_no;
	 private String local_no;
	 private String travel_title;
	 private String travel_content;
	 private String travel_category;
	 private String travel_tag;
	 private int travel_hit;
	 private int travel_like;
	 private int travel_dislike;
	 private Date travel_date;
	 private String travel_filename;
	 private String travel_filepath;
}
