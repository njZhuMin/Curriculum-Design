package com.trade.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.trade.dao.SupplierDao;
import com.trade.pojo.Supplier;

public class SupplierDaoImpl extends HibernateDaoSupport implements SupplierDao{

	public void addSup(Supplier sup) throws Exception {
		this.getHibernateTemplate().save(sup);
	}

	public void deleteSup(int id) throws Exception {
		Supplier sup = (Supplier) this.getHibernateTemplate().get(Supplier.class, id);
		this.getHibernateTemplate().delete(sup);
	}

	public List<Supplier> findAllSup(final int cp,final int ls) throws Exception {
		List list = this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql ="FROM Supplier";
				Query query = session.createQuery(hql);
				query.setFirstResult((cp-1)*ls);
				query.setMaxResults(ls);
				return query.list();
			}
		});
		return list;
	}

	public Supplier findById(int id) throws Exception {
		Supplier sup = (Supplier) this.getHibernateTemplate().get(Supplier.class, id);
		return sup;
	}
	public List<Supplier> findSupByAddress(String Address) throws Exception {
		String hql ="from Supplier where supAddress=?";
		List<Supplier>list=this.getHibernateTemplate().find(hql, new Object[]{Address});
		return list;
	}

	public List<Supplier> findSupByName(String name) throws Exception {
		String hql ="from Supplier where supName=?";
		List<Supplier>list=this.getHibernateTemplate().find(hql, new Object[]{name});
		return list;
	}

	public List<Supplier> findSupBySName(String SName) throws Exception {
		String hql ="from Supplier where supSName=?";
		List<Supplier>list=this.getHibernateTemplate().find(hql, new Object[]{SName});
		return list;
	}

	public void update(Supplier sup) throws Exception {
		this.getHibernateTemplate().update(sup);
	}

	public int allSupCount() throws Exception {
		String hql ="from Supplier";
		List<Supplier>list=this.getHibernateTemplate().find(hql);
		return list.size();
	}

	public List<Supplier> findAllSupToPro() throws Exception {
		String hql ="from Supplier";
		List<Supplier>list=this.getHibernateTemplate().find(hql);
		return list;
	}

	public List<Supplier> findAll() throws Exception {
		String hql ="from Supplier";
		List<Supplier>list=this.getHibernateTemplate().find(hql);
		return list;
	}
//根据name查询sup_id
	public Supplier findsup_id(String name) throws Exception {
    String hql ="from Supplier where supName =?"  ;
    List<Supplier> list= this.getHibernateTemplate().find(hql, new Object[]{name}) ;
    if(list.isEmpty()){
    		return null ;
    }else{
    	return list.get(0) ;
	}
	}





}
