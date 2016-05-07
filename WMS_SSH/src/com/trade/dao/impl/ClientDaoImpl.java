package com.trade.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.trade.dao.ClientDao;
import com.trade.pojo.Adminer;
import com.trade.pojo.Client;

public class ClientDaoImpl extends HibernateDaoSupport implements ClientDao{

	public void addClient(Client client) throws Exception {
		this.getHibernateTemplate().save(client);
	}

	public void deleteClient(int id) throws Exception {
		Client client = (Client) this.getHibernateTemplate().get(Client.class, id);
		this.getHibernateTemplate().delete(client);
	}

	public Client findById(int  id) throws Exception {
		Client client = (Client) this.getHibernateTemplate().get(Client.class, id);
		return client;
	}

	public boolean hasClient(String name) throws Exception {
		String hql="from Client where name=?";
		List<Client>list=this.getHibernateTemplate().find(hql, new Object[]{name});
		if(list.isEmpty()){
		return true;
		}
		return false;
	}

	public int selAllClient() throws Exception {
		String hql="from Client";
		List<Client>list=this.getHibernateTemplate().find(hql);
		return list.size();
	}

	public List<Client> selClientByAddress(String address) throws Exception {
		String hql ="from Client where address=?";
		List<Client>list=this.getHibernateTemplate().find(hql, new Object[]{address});
		return list;
	}

	public List<Client> selClientByName(String name) throws Exception {
		String hql ="from Client where name=?";
		List<Client>list=this.getHibernateTemplate().find(hql, new Object[]{name});
		return list;
	}

	public List<Client> selClientByPName(String PName) throws Exception {
		String hql ="from Client where PName=?";
		List<Client>list=this.getHibernateTemplate().find(hql, new Object[]{PName});
		return list;
	}

	public List<Client> selClientBySName(String sname) throws Exception {
		String hql ="from Client where SName=?";
		List<Client>list=this.getHibernateTemplate().find(hql, new Object[]{sname});
		return list;
	}

	public void updateClient(Client client) throws Exception {
		this.getHibernateTemplate().update(client);
		
	}

	public List<Client> findAllClient(final int cp, final int ls) throws Exception {
		List list = this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql ="FROM Client";
				Query query = session.createQuery(hql);
				query.setFirstResult((cp-1)*ls);
				query.setMaxResults(ls);
				return query.list();
			}
		});
		return list;
	}

	public int selClientId(String name) throws Exception {
		String hql ="from Client where name=?";
		List<Client>list=this.getHibernateTemplate().find(hql, new Object[]{name});
		Client client = list.get(0);
		return client.getCId();
	}

	public List<Client> findAll() throws Exception {
		String hql="From Client";
		List<Client>list=this.getHibernateTemplate().find(hql);
		return list;
	}

	//@Override
	public int findIs(String name) throws Exception {
			String hql="from Client where name=?";
			List<Client>list=this.getHibernateTemplate().find(hql, name);
			if(!list.isEmpty()){
				return list.size();
				}
				return 0;
	}

}
