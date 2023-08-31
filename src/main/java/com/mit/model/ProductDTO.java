package com.mit.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProductDTO {
	private int id;
	private String productName;
	private String riskLevel;				//위험등급(상품)
	private String productStatus;			//판매여부
	private String manageCompany;			//운용사
	private float fee;						//수수료
	private double monthlyReturn;				//1개월 수익률
	private double querterlyReturn;			//3개월 수익률
	private double annualReturn;				//1년 수익률
	private double totalReturn;				//누적 수익률
	private double rate;						//적용이율
	private String content;					//상품설명
	private Timestamp entryDate;
	private Timestamp modifyDate;	


    public void setRate(String rate) {
        //적용이율이 빈 값일 경우 기본값으로 0 설정
        this.rate = rate.isEmpty() ? 0.0 : Double.parseDouble(rate);
    }
	
}
