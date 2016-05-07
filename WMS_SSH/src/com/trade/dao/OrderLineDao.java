package com.trade.dao;

import java.util.List;

import com.trade.pojo.Orderline;

public interface OrderLineDao {
	public void addOrder(Orderline order)throws Exception; 
	public List<Orderline> findAllIn(int cp,int ls)throws Exception;
	public List<Orderline> findAllReturn(int cp,int ls)throws Exception;
	public int findAllIn()throws Exception;
	public int findAllOut()throws Exception;
	public Orderline findById(int id) throws Exception;
	public void update(Orderline order) throws Exception; 
	public List<Orderline> findAllInForXml()throws Exception;
	public List<Orderline> findAllReForXml()throws Exception;
	public List<Orderline> findPayListByIn(int cp, int ls)throws Exception;
	public List<Orderline> findNoPayListByIn(int cp, int ls)throws Exception;
	public int findAllInPay()throws Exception;
	public int findAllInNoPay()throws Exception;
	public int findAllRePay()throws Exception;
	public int findAllReNoPay()throws Exception;
	public List<Orderline> findPayListByRe(int cp, int ls)throws Exception;
	public List<Orderline> findNoPayListByRe(int cp, int ls)throws Exception;

}
