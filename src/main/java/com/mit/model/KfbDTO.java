package com.mit.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
//은행연합회 더미 데이터(타사 한도)
public class KfbDTO {
	private int id;
	private String ssn;				//주민번호
	private String name;			//이름
	private int limitAmount;		//한도금액
	private Timestamp entryDate;
	private Timestamp modifyDate;

}
