package com.trade.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.trade.dao.OrderLineDao;
import com.trade.pojo.Orderline;

public class OrderLineDaoImpl extends HibernateDaoSupport implements OrderLineDao{

	public void addOrder(Orderline order) throws Exception {
		this.getHibernateTemplate().save(order);
	}

	public List<Orderline> findAllIn(final int cp, final int ls) throws Exception {
		List list = this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql ="FROM Orderline where OStyle = 1";
				Query query = session.createQuery(hql);
				query.setFirstResult((cp-1)*ls);
				query.setMaxResults(ls);
				return query.list();
			}
		});
		return list;
	}

	public List<Orderline> findAllReturn(final int cp, final int ls) throws Exception {
		List list = this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql ="FROM Orderline where OStyle = 2";
				Query query = session.createQuery(hql);
				query.setFirstResult((cp-1)*ls);
				query.setMaxResults(ls);
				return query.list();
			}
		});
		return list;
	}

	public int findAllIn() throws Exception {
		String hql ="FROM Orderline where OStyle = 1";
		List<Orderline>list=this.getHibernateTemplate().find(hql);
		return list.size();
	}

	public int findAllOut() throws Exception {
		String hql ="FROM Orderline where OStyle = 2";
		List<Orderline>list=this.getHibernateTemplate().find(hql);
		return list.size();
	}

	public Orderline findById(int id) throws Exception {
		Orderline o = (Orderline) this.getHibernateTemplate().get(Orderline.class, id);
		return o;
	}

	public void update(Orderline order) throws Exception {
		this.getHibernateTemplate().update(order);
	}

	public List<Orderline> findAllInForXml() throws Exception {
		String hql ="from Orderline where OStyle = 1";
		List<Orderline>list=this.getHibernateTemplate().find(hql);
		return list;
	}

	public List<Orderline> findAllReForXml() throws Exception {
		String hql ="from Orderline where OStyle = 2";
		List<Orderline>list=this.getHibernateTemplate().find(hql);
		return list;
	}

	public List<Orderline> findPayListByIn(final int cp, final int ls) throws Exception {
		List list = this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql ="FROM Orderline where OStyle = 1 and OAllMoney=OPayMoney";
				Query query = session.createQuery(hql);
				query.setFirstResult((cp-1)*ls);
				query.setMaxResults(ls);
				return query.list();
			}
		});
		return list;
	}

	public List<Orderline> findNoPayListByIn( final int cp,final int ls) throws Exception {
		List list = this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql ="FROM Orderline where OStyle = 1 and OAllMoney<>OPayMoney";
				Query query = session.createQuery(hql);
				query.setFirstResult((cp-1)*ls);
				query.setMaxResults(ls);
				return query.list();
			}
		});
		return list;
	}

	public int findAllInNoPay() throws Exception {
		String hql ="FROM Orderline where OStyle = 1 and OAllMoney<>OPayMoney";
		List<Orderline>list=this.getHibernateTemplate().find(hql);
		return list.size();
	}

	public int findAllInPay() throws Exception {
		String hql ="FROM Orderline where OStyle = 1 and OAllMoney=OPayMoney";
		List<Orderline>list=this.getHibernateTemplate().find(hql);
		return list.size();
	}

	public int findAllReNoPay() throws Exception {
		String hql ="FROM Orderline where OStyle = 2 and OAllMoney<>OPayMoney";
		List<Orderline>list=this.getHibernateTemplate().find(hql);
		return list.size();
	}

	public int findAllRePay() throws Exception {
		String hql ="FROM Orderline where OStyle = 2 and OAllMoney=OPayMoney";
		List<Orderline>list=this.getHibernateTemplate().find(hql);
		return list.size();
	}

	public List<Orderline> findNoPayListByRe(final int cp, final int ls) throws Exception {
		List list = this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql ="FROM Orderline where OStyle = 2 and OAllMoney<>OPayMoney";
				Query query = session.createQuery(hql);
				query.setFirstResult((cp-1)*ls);
				query.setMaxResults(ls);
				return query.list();
			}
		});
		return list;
	}

	public List<Orderline> findPayListByRe(final int cp, final int ls) throws Exception {
		List list = this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql ="FROM Orderline where OStyle = 2 and OAllMoney=OPayMoney";
				Query query = session.createQuery(hql);
				query.setFirstResult((cp-1)*ls);
				query.setMaxResults(ls);
				return query.list();
			}
		});
		return list;
	}
}
