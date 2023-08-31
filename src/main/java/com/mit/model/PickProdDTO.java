package com.mit.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PickProdDTO {
	private int id;
	private String policyNumber;
	private int productId;
	private int investRatio; // 투입비율
	private Timestamp entryDate;
	private Timestamp modifyDate;
	private String productName; // 상품명 추가
	private double productMonthlyReturn;
	private double productQuerterlyReturn;
	private double productAnnualReturn;
	private double productTotalReturn;
	private int interest; // 0809
	private int reserves; // 0809

	private String riskLevel;				//pickProd 리스트에 출력하기위해 추가등록 	
	private String manageCompany;			//운용사
	private float fee;						//수수료	
	private double totalReturn;				//누적 수익률
	private double rate;						//적용이율

	}

