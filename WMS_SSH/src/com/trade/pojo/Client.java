package com.trade.pojo;

/**
 * Client entity. @author MyEclipse Persistence Tools
 */
public class Client extends AbstractClient implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Client() {
	}

	/** full constructor */
	public Client(String name, String SName, String address, String encoding,
			String tel, String fax, String PName, String PTel, String email,
			String bank, String bankNum) {
		super(name, SName, address, encoding, tel, fax, PName, PTel, email,
				bank, bankNum);
	}

}
