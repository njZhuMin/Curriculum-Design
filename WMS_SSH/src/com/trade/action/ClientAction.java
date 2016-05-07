package com.trade.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.trade.dao.ClientDao;
import com.trade.pojo.Client;
import com.util.Page;

public class ClientAction {
	private Client client;
	private ClientDao clientDao;
	private String msg ;
	private boolean flag;
	private List list;
	private Page page=new Page();
	private int id;
	private List listByOpt;
	private String key;
	private String value;
	private String type;
	private String name;
	
	private HttpSession session = ServletActionContext.getRequest().getSession();
	
	public String addClient() throws Exception{
		if(client.getName().equals("")){
			msg="名字为空";
			return "suc";
		}
		clientDao.addClient(client);
		msg="添加成功";
		return "suc";
	}
	
	public String updateClient()throws Exception{
		if(client!=null){
			clientDao.updateClient(client);
			return "suc";
		}
		return "err";
	}
	
	public String findAllClient()throws Exception{
		int count = clientDao.selAllClient();
		page.setRowCount(count);
		list = clientDao.findAllClient(page.getCurrentPage(), page
				.getPageSize());
		page.setList(list);
		page.execute();
		if(msg!=null){
			if(msg.equals("delete")){
				msg="删除成功";
			}else if(msg.equals("update")){
				msg="更新成功";
			}
		}
		if(type!=null){
			if(type.equals("op")){
				findAllClientOption();
				list = clientDao.findAll();
				key="name";
				msg="找到"+list.size()+"条记录";
				return "op";
			}
		}
		
		return "admin";
	}
	public String findClientById()throws Exception{
		client=clientDao.findById(id);
		if(client!=null){
			return "suc";
		}
		return "err";
		
	}
	public String findClientBy() throws Exception{
		if(key.equals("name")){
			list=clientDao.selClientByName(value);
			msg="找到"+list.size()+"条记录";
		}else if(key.equals("pname")){
			list=clientDao.selClientByPName(value);
			msg="找到"+list.size()+"条记录";
		}else if(key.equals("sname")){
			list=clientDao.selClientBySName(value);
			msg="找到"+list.size()+"条记录";
		}
		if(list.size()==0){
			msg="未找到相关数据";
		}
		findAllClientOption();
		return "suc";
	}
	
	public String deleteClient() throws Exception{
		client=clientDao.findById(id);
		if(client==null){
			msg="该公司不存在，请刷新页面";
			return "err";
		}
		clientDao.deleteClient(id);
		return "suc";
	}
	
	public String findAllClientOption()throws Exception{

		listByOpt = clientDao.findAll();
		if(key.equals("name")){
			key="name";
		}
		return "suc";
	}
	public String findIs() throws Exception{
		int count = clientDao.findIs(name);
		if(count==0){
			flag = true;
		}else{
			flag = false;
		}
		return "suc";
	}
	
	
	
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public ClientDao getClientDao() {
		return clientDao;
	}
	public void setClientDao(ClientDao clientDao) {
		this.clientDao = clientDao;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public List getListByOpt() {
		return listByOpt;
	}

	public void setListByOpt(List listByOpt) {
		this.listByOpt = listByOpt;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
