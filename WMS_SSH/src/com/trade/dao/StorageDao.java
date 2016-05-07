package com.trade.dao;

import java.util.List;

import com.trade.pojo.Storage;

public interface StorageDao {
	public void addToStorage(Storage storage)throws Exception;
	public boolean findStoByPName(String name)throws Exception;
	public Storage findByPName(String name)throws Exception;
	public void updateStorage(Storage storage)throws Exception;
	public List<Storage> findAll()throws Exception;
}
