package com.trade.dao;

import java.util.List;

import com.trade.pojo.Supplier;

public interface SupplierDao {
	public void addSup(Supplier sup) throws Exception;
	public int allSupCount()throws Exception;
	
	public void deleteSup(int id) throws Exception;
	
	public void update(Supplier sup)throws Exception;
	
	public Supplier findById(int id)throws Exception;
	
	public List<Supplier> findAllSupToPro() throws Exception;
	
	public List<Supplier> findAllSup(int cp,int ls)throws Exception;
	
	public List<Supplier> findSupByName(String name)throws Exception;
	public List<Supplier> findAll()throws Exception;
	
	public List<Supplier> findSupByAddress(String Address)throws Exception;
	public List<Supplier> findSupBySName(String SName)throws Exception;
	//
	public Supplier findsup_id(String name )throws Exception ;
}
