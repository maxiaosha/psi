package com.psi.entity;

import java.io.Serializable;

/**
 * 商品库存实体类
 * @author 曾宇康
 *
 */
public class GoodsStock implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;						// ID
	private String sn;						// 库存编号
	private Goods goods;					// 对应商品-GOODS_ID
	private ReplenishB replenishB;			// 对应采购单内商品-REPLENISH_B_ID
	private String productionDate;			// 该批次库存生产日期
	private String num;						// 该批次库存数量
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSn() {
		return sn;
	}
	public void setSn(String sn) {
		this.sn = sn;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public ReplenishB getReplenishB() {
		return replenishB;
	}
	public void setReplenishB(ReplenishB replenishB) {
		this.replenishB = replenishB;
	}
	public String getProductionDate() {
		return productionDate;
	}
	public void setProductionDate(String productionDate) {
		this.productionDate = productionDate;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
}
