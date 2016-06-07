package com.psi.entity;

import java.io.Serializable;

public class ReplenishB implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;						// id
	private String replenishId;				// 进货单ID
	private Goods goods;					// 商品
	private Supplier supplier;				// 供应商
	private String num;						// 该商品进货数量
	private Double goodsMoney;				// 该商品总额

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReplenishId() {
		return replenishId;
	}
	public void setReplenishId(String replenishId) {
		this.replenishId = replenishId;
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
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public Supplier getSupplier() {
		return supplier;
	}
	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

}
