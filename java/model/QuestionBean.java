package org.example.goSeoul.model;

import lombok.Data;

@Data
public class QuestionBean {

    private int q_no;
    private int user_no;
    private String q_title;
    private String q_content;
    private String q_tag;
    private String q_category;
}
