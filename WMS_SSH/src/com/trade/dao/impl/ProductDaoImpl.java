package com.trade.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.trade.dao.ProductDao;
import com.trade.pojo.Product;

public class ProductDaoImpl extends HibernateDaoSupport implements ProductDao{

	public void deleteById(int id) throws Exception {
		Product pro = (Product) this.getHibernateTemplate().get(Product.class, id);
		this.getHibernateTemplate().delete(pro);
	}

	public int findAllProCount() throws Exception {
		String hql="from Product";
		List<Product>list=this.getHibernateTemplate().find(hql);
		return list.size();
	}

	public List<Product> findByAddress(String address) throws Exception {
		String hql="from Product where PAddress like ? ";
		List<Product>list=this.getHibernateTemplate().find(hql,new Object[]{"%"+address+"%"});
		return list;
	}

	public List<Product> findByProName(String name) throws Exception {
		String hql="from Product where PName like? ";
		List<Product>list=this.getHibernateTemplate().find(hql,new Object[]{"%"+name+"%"});
		return list;
	}

	public List<Product> findBySup(int id) throws Exception {
		String hql="from Product where sup.supId = ? ";
		List<Product>list=this.getHibernateTemplate().find(hql,new Object[]{id});
		return list;
	}

	public Product findByid(int id) throws Exception {
		Product pro = (Product) this.getHibernateTemplate().get(Product.class, id);
		return pro;
	}

	public List<Product> findall(final int cp, final int ls) throws Exception {
		List list = this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql ="FROM Product";
				Query query = session.createQuery(hql);
				query.setFirstResult((cp-1)*ls);
				query.setMaxResults(ls);
				return query.list();
			}
		});
		return list;
	}

	public void insert(Product pro) throws Exception {
		this.getHibernateTemplate().save(pro);
	}

	public void update(Product pro) throws Exception {
		this.getHibernateTemplate().update(pro);
	}

	public List<Product> findAll() throws Exception {
		String hql="from Product";
		List<Product>list=this.getHibernateTemplate().find(hql);
		return list;
	}

}
