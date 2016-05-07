package com.trade.dao;

import java.util.List;

import com.trade.pojo.Client;

/*
 * 客户
 * */
public interface ClientDao {
	
	public void addClient(Client client) throws Exception;
	
	public void updateClient(Client client) throws Exception;
	
	public int selAllClient()throws Exception;
	
	public void deleteClient(int id)throws Exception;
	
	public Client findById(int id)throws Exception;
	
	public boolean hasClient(String name)throws Exception;
	
	public List<Client> findAllClient(int cp,int ls)throws Exception;
	
	public List<Client> selClientByName(String name)throws Exception;
	
	public List<Client> selClientBySName(String sname)throws Exception;
	
	public List<Client> selClientByAddress(String address)throws Exception;
	public List<Client> selClientByPName(String PName)throws Exception;
	public int selClientId(String name)throws Exception;
	public List<Client> findAll()throws Exception;
	
	public int findIs(String name)throws Exception;
	
	
}
