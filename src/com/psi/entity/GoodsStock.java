package com.psi.entity;

import java.io.Serializable;

/**
 * ��Ʒ���ʵ����
 * @author ���
 *
 */
public class GoodsStock implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;						// ID
	private String sn;						// �����
	private Goods goods;					// ��Ӧ��Ʒ-GOODS_ID
	private ReplenishB replenishB;			// ��Ӧ�ɹ�������Ʒ-REPLENISH_B_ID
	private String productionDate;			// �����ο����������
	private String num;						// �����ο������
	
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
