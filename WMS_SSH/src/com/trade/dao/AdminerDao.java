package com.trade.dao;

import java.util.List;

import com.trade.pojo.Adminer;

public interface AdminerDao {
	public boolean delete (int id) throws Exception;
	
	public boolean insertAdminer(Adminer adminer) throws Exception;


	public boolean update(Adminer adminer) throws Exception;

	public List<Adminer> findall() throws Exception;

	public Adminer findByid(int id) throws Exception;

	public boolean login(String name , String pwd) throws Exception;

	public boolean findIs(String name) throws Exception;

	public Adminer findByname(String name) throws Exception;

	public List<Adminer> findBySel(String name) throws Exception;
	public boolean findName(String name)throws Exception;
}
