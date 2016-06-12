package com.psi.entity;

import java.io.Serializable;

/**
 * 退货单商品实体类
 * @author 曾宇康
 *
 */
public class ReturnSaleB implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;				// ID
	private String returnSaleId;	// 退货单ID
	private SaleB saleB;			// 销售单商品ID 对应的销售单商品
	private String num;				// 退货数量
	private Double goodsMoney;		// 退货商品金额
	
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
