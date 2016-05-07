package com.trade.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.trade.dao.AdminerDao;
import com.trade.pojo.Adminer;

public class AdminerDaoImpl extends HibernateDaoSupport implements AdminerDao{

	public boolean delete(int id) throws Exception {
		Adminer adminer = (Adminer) this.getHibernateTemplate().get(Adminer.class, id);
		this.getHibernateTemplate().delete(adminer);
		return true;
	}

	public List<Adminer> findBySel(String name) throws Exception {
		return null;
	}

	public Adminer findByid(int id) throws Exception {
		Adminer adminer=(Adminer)this.getHibernateTemplate().get(Adminer.class, id);
		return adminer;
	}

	public Adminer findByname(String name) throws Exception {
		String hql="from Adminer where AIdcard= ?";
		List<Adminer> list=this.getHibernateTemplate().find(hql,name);
		return list.get(0);
	}

	public boolean findIs(String name) throws Exception {
		String hql="from Adminer where AIdcard=?";
		List<Adminer>list=this.getHibernateTemplate().find(hql, name);
		if(list.isEmpty()){
		return true;
		}
		return false;
	}

	public List<Adminer> findall() throws Exception {
		List<Adminer>list=this.getHibernateTemplate().find("from Adminer");
		return list;
	}

	public boolean insertAdminer(Adminer adminer) throws Exception {

		this.getHibernateTemplate().save(adminer);
		return true;
	}

	public boolean login(String name, String pwd) throws Exception {
		String hql="from Adminer where AIdcard=? and APwd=?";
		List<Adminer>list=this.getHibernateTemplate().find(hql, new Object[]{name,pwd});
		if(list.isEmpty()){
		return false;
		}
		return true;
	}

	public boolean update(Adminer adminer) throws Exception {
		this.getHibernateTemplate().update(adminer);
		return true;
	}

	public boolean findName(String name) throws Exception {
		String hql="from Adminer where AName= ?";
		List<Adminer>list=this.getHibernateTemplate().find(hql, new Object[]{name});
		if(list.isEmpty()){
		return true;
		}
		return false;
	}

}
