package com.psi.entity;

import java.io.Serializable;

/**
 * 销售单商品实体类
 * @author 曾宇康
 *
 */
public class SaleB implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;						// id
	private Sale sale;					// 销售单ID
	private GoodsStock goodsStock;			// 商品库存
	private String num;						// 该商品销售数量
	private String returnNum;				// 该商品退货数量
	private Double goodsMoney;				// 该商品总额
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
