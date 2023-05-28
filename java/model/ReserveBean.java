package org.example.goSeoul.model;

import lombok.Data;

import java.util.Date;

@Data
public class ReserveBean {
    private int reserve_no;
    private int with_no;
    private Date reserve_date;
    private int user_no;
}
