package com.trade.dao;

import java.util.List;

import com.trade.pojo.Product;

public interface ProductDao {
	public void deleteById(int id)throws Exception;
	public void insert(Product pro)throws Exception;
	public void update(Product pro)throws Exception;
	public int findAllProCount()throws Exception;
	public List<Product> findall(int cp , int ls)throws Exception;
	public Product findByid(int id)throws Exception;
	public List<Product> findBySup(int id)throws Exception;
	public List<Product> findByProName(String name)throws Exception;
	public List<Product> findByAddress(String address)throws Exception;
	public List<Product> findAll()throws Exception;
}
