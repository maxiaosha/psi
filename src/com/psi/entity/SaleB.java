package com.psi.entity;

import java.io.Serializable;

/**
 * ���۵���Ʒʵ����
 * @author ���
 *
 */
public class SaleB implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;						// id
	private Sale sale;					// ���۵�ID
	private GoodsStock goodsStock;			// ��Ʒ���
	private String num;						// ����Ʒ��������
	private String returnNum;				// ����Ʒ�˻�����
	private Double goodsMoney;				// ����Ʒ�ܶ�
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
		
	public Sale getSale() {
		return sale;
	}
	public void setSale(Sale sale) {
		this.sale = sale;
	}
	public GoodsStock getGoodsStock() {
		return goodsStock;
	}
	public void setGoodsStock(GoodsStock goodsStock) {
		this.goodsStock = goodsStock;
	}
	public String getReturnNum() {
		return returnNum;
	}
	public void setReturnNum(String returnNum) {
		this.returnNum = returnNum;
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
