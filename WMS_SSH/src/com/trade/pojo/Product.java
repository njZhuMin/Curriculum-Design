package com.trade.pojo;

import java.util.Set;

/**
 * Product entity. @author MyEclipse Persistence Tools
 */

public class Product implements java.io.Serializable {

	// Fields
	/*
	 * 	货物列表
	 * 	
	 * 	编号
	 * 	名称
	 * 	缩写
	 * 	产地
	 * 	批号
	 * 	规格
	 * 	包装  有或无
	 * 	计量单位
	 * 	比准文号
	 * 	供应商
	 * 	备注
	 * 
	 * 
	 * */
	private Integer PId;
	private String PName;
	private String PSName;
	private String PAddress;
	private String PNum;
	private String PNorms;
	private String PPackage;
	private String PUnit;
	private String PPassNum;
	private Integer PSingleMoney;
	// private Integer supId;
	private Supplier sup;
	private String remark;
	private Set<Orderline> orderlines;
	private Set<Storage> storages;

	// Constructors

	/** default constructor */
	public Product() {
	}

	/** full constructor */
	public Product(Integer PSingleMoney,String PName, String PSName, String PAddress, String PNum,
			String PNorms, String PPackage, String PUnit, String PPassNum,
			Supplier sup, String remark) {
		this.PName = PName;
		this.PSName = PSName;
		this.PAddress = PAddress;
		this.PNum = PNum;
		this.PNorms = PNorms;
		this.PPackage = PPackage;
		this.PUnit = PUnit;
		this.PPassNum = PPassNum;
		this.sup = sup;
		this.PSingleMoney=PSingleMoney;
		this.remark = remark;
	}

	// Property accessors
	
	public Integer getPId() {
		return this.PId;
	}

	public Integer getPSingleMoney() {
		return PSingleMoney;
	}

	public void setPSingleMoney(Integer pSingleMoney) {
		PSingleMoney = pSingleMoney;
	}

	public Set<Storage> getStorages() {
		return storages;
	}

	public void setStorages(Set<Storage> storages) {
		this.storages = storages;
	}

	public Set<Orderline> getOrderlines() {
		return orderlines;
	}

	public void setOrderlines(Set<Orderline> orderlines) {
		this.orderlines = orderlines;
	}

	public void setPId(Integer PId) {
		this.PId = PId;
	}

	public String getPName() {
		return this.PName;
	}

	public void setPName(String PName) {
		this.PName = PName;
	}

	public String getPSName() {
		return this.PSName;
	}

	public void setPSName(String PSName) {
		this.PSName = PSName;
	}

	public String getPAddress() {
		return this.PAddress;
	}

	public void setPAddress(String PAddress) {
		this.PAddress = PAddress;
	}

	public String getPNum() {
		return this.PNum;
	}

	public void setPNum(String PNum) {
		this.PNum = PNum;
	}

	public String getPNorms() {
		return this.PNorms;
	}

	public void setPNorms(String PNorms) {
		this.PNorms = PNorms;
	}

	public String getPPackage() {
		return this.PPackage;
	}

	public void setPPackage(String PPackage) {
		this.PPackage = PPackage;
	}

	public String getPUnit() {
		return this.PUnit;
	}

	public void setPUnit(String PUnit) {
		this.PUnit = PUnit;
	}

	public String getPPassNum() {
		return this.PPassNum;
	}

	public void setPPassNum(String PPassNum) {
		this.PPassNum = PPassNum;
	}

	public Supplier getSup() {
		return sup;
	}

	public void setSup(Supplier sup) {
		this.sup = sup;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}