package com.trade.pojo;

/**
 * Storage entity. @author MyEclipse Persistence Tools
 */

public class Storage implements java.io.Serializable {

	// Fields
	/*
	 * 	仓库操作id
	 * 	操作商品
	 * 	数量
	 * 	操作员
	 * */
	private Integer SId;
	// private Integer PId;
	private Product product;
	private Integer SNum;
	private String SAdminer;

	// Constructors

	/** default constructor */
	public Storage() {
	}

	/** full constructor */
	public Storage(Product product, Integer SNum, String SAdminer) {
		this.product = product;
		this.SNum = SNum;
		this.SAdminer = SAdminer;
	}

	// Property accessors

	public Integer getSId() {
		return this.SId;
	}

	public void setSId(Integer SId) {
		this.SId = SId;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getSNum() {
		return this.SNum;
	}

	public void setSNum(Integer SNum) {
		this.SNum = SNum;
	}

	public String getSAdminer() {
		return this.SAdminer;
	}

	public void setSAdminer(String SAdminer) {
		this.SAdminer = SAdminer;
	}

}