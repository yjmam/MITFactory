package com.mit.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ContractDTO {
	private int id;
	private int userId;
	private String policyNumber;			//증권번호 년도+pp+유저아이디(1000번~)
	private String contractType;			//가입유형: IRP, DC/DB
	private String contractStatus;			//계약상태 : 정상, 해지접수중, 해지, 입력중
	private int setAmount;					//당사 가입한도
	private String confirm;					//서명이미지 경로
	private Timestamp entryDate;
	private Timestamp endDate;				//계약해지일
	private Timestamp modifyDate;	
	private String name; //해지관리자 처리시 계약자 이름 넣기위해 추가 0725
	private String ssn; //해지 처리시 ssn 정보 필요해서 추가 0725
	
}
