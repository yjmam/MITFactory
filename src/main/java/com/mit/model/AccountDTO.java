package com.mit.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AccountDTO {
	private int id;
	private String policyNumber;			//증권번호
	private String bank;
	private String bankAccount;
	private String autoDate;				//자동이체 일자
	private int autoAmount;					//자동이체 금액
	private Timestamp entryDate;
	private Timestamp modifyDate;

}
