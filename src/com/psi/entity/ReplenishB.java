package com.psi.entity;

import java.io.Serializable;

public class ReplenishB implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;						// id
	private String replenishId;				// ������ID
	private Goods goods;					// ��Ʒ
	private Supplier supplier;				// ��Ӧ��
	private String num;						// ����Ʒ��������
	private Double goodsMoney;				// ����Ʒ�ܶ�

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
