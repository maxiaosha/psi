package com.psi.entity;

import java.io.Serializable;

/**
 * �˻�����Ʒʵ����
 * @author ���
 *
 */
public class ReturnSaleB implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;				// ID
	private String returnSaleId;	// �˻���ID
	private SaleB saleB;			// ���۵���ƷID ��Ӧ�����۵���Ʒ
	private String num;				// �˻�����
	private Double goodsMoney;		// �˻���Ʒ���
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReturnSaleId() {
		return returnSaleId;
	}
	public void setReturnSaleId(String returnSaleId) {
		this.returnSaleId = returnSaleId;
	}
	public SaleB getSaleB() {
		return saleB;
	}
	public void setSaleB(SaleB saleB) {
		this.saleB = saleB;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public Double getGoodsMoney() {
		return goodsMoney;
	}
	public void setGoodsMoney(Double goodsMoney) {
		this.goodsMoney = goodsMoney;
	}

}
