package com.trade.pojo;

/**
 * Orderline entity. @author MyEclipse Persistence Tools
 */

public class Orderline implements java.io.Serializable {

	// Fields

	/*
	 * 订单ID 订单商品 订单编号 订单总金额 订单实付金额 操作员 经手人 订单日期 付款方式
	 */
	private Integer OId;
	private String ONumId;
	// private Integer PId;
	private Product product;
	private Integer ONum;
	private Integer OAllMoney;
	private Integer OPayMoney;
	private String OAdminerId;
	private String ODate;
	private Integer OStyle;
	private Integer OPayStyle;

	// Constructors

	/** default constructor */
	public Orderline() {
	}

	/** full constructor */
	public Orderline(String ONumId, Product product, Integer ONum,
			Integer OAllMoney, Integer OPayMoney, String OAdminerId,
			String ODate, Integer OStyle, Integer OPayStyle) {
		this.ONumId = ONumId;
		this.product = product;
		this.ONum = ONum;
		this.OAllMoney = OAllMoney;
		this.OPayMoney = OPayMoney;
		this.OAdminerId = OAdminerId;
		this.ODate = ODate;
		this.OStyle = OStyle;
		this.OPayStyle = OPayStyle;
	}

	// Property accessors

	public Integer getOId() {
		return this.OId;
	}

	public void setOId(Integer OId) {
		this.OId = OId;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getONum() {
		return this.ONum;
	}

	public void setONum(Integer ONum) {
		this.ONum = ONum;
	}

	public Integer getOAllMoney() {
		return this.OAllMoney;
	}

	public void setOAllMoney(Integer OAllMoney) {
		this.OAllMoney = OAllMoney;
	}

	public Integer getOPayMoney() {
		return this.OPayMoney;
	}

	public void setOPayMoney(Integer OPayMoney) {
		this.OPayMoney = OPayMoney;
	}

	public String getOAdminerId() {
		return this.OAdminerId;
	}

	public void setOAdminerId(String OAdminerId) {
		this.OAdminerId = OAdminerId;
	}


	public String getODate() {
		return this.ODate;
	}

	public void setODate(String ODate) {
		this.ODate = ODate;
	}

	public Integer getOStyle() {
		return this.OStyle;
	}

	public void setOStyle(Integer OStyle) {
		this.OStyle = OStyle;
	}

	public String getONumId() {
		return ONumId;
	}

	public void setONumId(String oNumId) {
		ONumId = oNumId;
	}

	public Integer getOPayStyle() {
		return OPayStyle;
	}

	public void setOPayStyle(Integer oPayStyle) {
		OPayStyle = oPayStyle;
	}

}