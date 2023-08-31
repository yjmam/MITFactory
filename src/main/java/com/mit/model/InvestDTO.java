package com.mit.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
//투자성향분석 결과
public class InvestDTO {
    private int id;
    private int userId;
    private String investResult;            //투자성향분석결과 : 고위험, 중위험, 저위험
    private Timestamp investDate;           //투자성향분석일
    private Timestamp modifyDate;   

}
