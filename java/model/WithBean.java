package org.example.goSeoul.model;

import lombok.Data;

import java.util.Date;

@Data
public class WithBean {
    private int with_no;
    private int user_no;
    private String with_id;
    private String with_nick;
    private String with_title;
    private String with_content;
    private int with_maxto;
    private int with_curno;
    private String with_tag;
    private int with_hit;
    private String with_category;
    private String with_age;
    private String with_gender;
    private String with_start;
    private String with_end;
    private Date with_date;
    private String with_filename;
}
