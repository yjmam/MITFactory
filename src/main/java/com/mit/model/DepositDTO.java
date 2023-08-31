package com.mit.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class DepositDTO {
	private int id;
	private String policyNumber;
	private int productId;
	private int inputAmount;			//입금금액
	private String writer;				//입금처리자 mit
	private Timestamp entryDate;

}
