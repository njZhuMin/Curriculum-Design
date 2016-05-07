package com.trade.pojo;

/**
 * AbstractClient entity provides the base persistence definition of the Client
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractClient implements java.io.Serializable {

	// Fields

	private Integer CId;
	private String name;
	private String SName;
	private String address;
	private String encoding;
	private String tel;
	private String fax;
	private String PName;
	private String PTel;
	private String email;
	private String bank;
	private String bankNum;

	// Constructors

	/** default constructor */
	public AbstractClient() {
	}

	/** full constructor */
	public AbstractClient(String name, String SName, String address,
			String encoding, String tel, String fax, String PName, String PTel,
			String email, String bank, String bankNum) {
		this.name = name;
		this.SName = SName;
		this.address = address;
		this.encoding = encoding;
		this.tel = tel;
		this.fax = fax;
		this.PName = PName;
		this.PTel = PTel;
		this.email = email;
		this.bank = bank;
		this.bankNum = bankNum;
	}

	// Property accessors

	public Integer getCId() {
		return this.CId;
	}

	public void setCId(Integer CId) {
		this.CId = CId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSName() {
		return this.SName;
	}

	public void setSName(String SName) {
		this.SName = SName;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEncoding() {
		return this.encoding;
	}

	public void setEncoding(String encoding) {
		this.encoding = encoding;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getFax() {
		return this.fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getPName() {
		return this.PName;
	}

	public void setPName(String PName) {
		this.PName = PName;
	}

	public String getPTel() {
		return this.PTel;
	}

	public void setPTel(String PTel) {
		this.PTel = PTel;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBank() {
		return this.bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getBankNum() {
		return this.bankNum;
	}

	public void setBankNum(String bankNum) {
		this.bankNum = bankNum;
	}

}