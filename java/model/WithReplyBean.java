package org.example.goSeoul.model;

import lombok.Data;

import java.util.Date;

@Data
public class WithReplyBean {
    private int withreply_no;
    private int with_no;
    private int user_no;
    private String withreply_id;
    private String withreply_nick;
    private String withreply_content;
    private Date withreply_date;
}
