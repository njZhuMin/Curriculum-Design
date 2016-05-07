package com.trade.pojo;

import java.util.Set;

/**
 * Supplier entity. @author MyEclipse Persistence Tools
 */

public class Supplier implements java.io.Serializable {

	// Fields
	/*
	 * 	供应商id	
	 * 	
	 * 
	 * 
	 * 
	 * */
	private Integer supId;
	private String supName;
	private String supSName;
	private String supAddress;
	private String supEncoding;
	private String supTel;
	private String supFax;
	private String supPeople;
	private String supPTel;
	private String supEmail;
	private String supBank;
	private Set<Product> products;

	// Constructors

	/** default constructor */
	public Supplier() {
	}

	/** full constructor */
	public Supplier(String supName, String supSName, String supAddress,
			String supEncoding, String supTel, String supFax, String supPeople,
			String supPTel, String supEmail, String supBank) {
		this.supName = supName;
		this.supSName = supSName;
		this.supAddress = supAddress;
		this.supEncoding = supEncoding;
		this.supTel = supTel;
		this.supFax = supFax;
		this.supPeople = supPeople;
		this.supPTel = supPTel;
		this.supEmail = supEmail;
		this.supBank = supBank;
	}

	// Property accessors

	public Integer getSupId() {
		return this.supId;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	public void setSupId(Integer supId) {
		this.supId = supId;
	}

	public String getSupName() {
		return this.supName;
	}

	public void setSupName(String supName) {
		this.supName = supName;
	}

	public String getSupSName() {
		return this.supSName;
	}

	public void setSupSName(String supSName) {
		this.supSName = supSName;
	}

	public String getSupAddress() {
		return this.supAddress;
	}

	public void setSupAddress(String supAddress) {
		this.supAddress = supAddress;
	}

	public String getSupEncoding() {
		return this.supEncoding;
	}

	public void setSupEncoding(String supEncoding) {
		this.supEncoding = supEncoding;
	}

	public String getSupTel() {
		return this.supTel;
	}

	public void setSupTel(String supTel) {
		this.supTel = supTel;
	}

	public String getSupFax() {
		return this.supFax;
	}

	public void setSupFax(String supFax) {
		this.supFax = supFax;
	}

	public String getSupPeople() {
		return this.supPeople;
	}

	public void setSupPeople(String supPeople) {
		this.supPeople = supPeople;
	}

	public String getSupPTel() {
		return this.supPTel;
	}

	public void setSupPTel(String supPTel) {
		this.supPTel = supPTel;
	}

	public String getSupEmail() {
		return this.supEmail;
	}

	public void setSupEmail(String supEmail) {
		this.supEmail = supEmail;
	}

	public String getSupBank() {
		return this.supBank;
	}

	public void setSupBank(String supBank) {
		this.supBank = supBank;
	}

	
}