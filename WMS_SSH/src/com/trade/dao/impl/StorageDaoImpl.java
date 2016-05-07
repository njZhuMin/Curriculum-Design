package com.trade.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.trade.dao.StorageDao;
import com.trade.pojo.Client;
import com.trade.pojo.Storage;

public class StorageDaoImpl extends HibernateDaoSupport implements StorageDao{

	public void addToStorage(Storage storage) throws Exception {
		this.getHibernateTemplate().save(storage);
	}

	public Storage findByPName(String name) throws Exception {
		String hql = "from Storage where product.PName=?";
		List<Storage>list=this.getHibernateTemplate().find(hql, new Object[]{name});
		return list.get(0);
	}

	public boolean findStoByPName(String name) throws Exception {
		String hql = "from Storage where product.PName=?";
		List<Storage>list=this.getHibernateTemplate().find(hql, new Object[]{name});
		if(list.size()>0){
			return false;
		}
		return true;
	}

	public void updateStorage(Storage storage) throws Exception {
		this.getHibernateTemplate().update(storage);
	}

	public List<Storage> findAll() throws Exception {
		String hql = "from Storage";
		List<Storage> list = this.getHibernateTemplate().find(hql);
		return list;
	}



}
