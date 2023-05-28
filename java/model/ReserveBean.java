package org.example.goSeoul.model;

import lombok.Data;

import java.util.Date;

@Data
public class ReserveBean {
    private int reserve_no;
    private int with_no;
    private int user_no;
    private String reserve_id;
    private String reserve_nick;
    private Date reserve_date;

}
