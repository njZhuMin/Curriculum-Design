package com.trade.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.trade.dao.AdminerDao;
import com.trade.pojo.Adminer;
import com.util.MD5Code;

public class AdminAction {
	private AdminerDao adminerDao;
	private Adminer adminer;
	private String msg;
	private boolean flag;
	private String idCard;
	private String password;
	private String loginmsg;
	
	private HttpSession session = ServletActionContext.getRequest().getSession();
	
	public String login() throws Exception{
		String name=adminer.getAIdcard().trim();
		String pwd =adminer.getAPwd().trim();
		boolean flag = adminerDao.login(name, new MD5Code().getMD5ofStr(pwd));
		if(flag){
			adminer = adminerDao.findByname(name);
			session.setAttribute("userId", adminer.getAdminerId());
			session.setAttribute("adminerId", adminer.getAIdcard());
			session.setAttribute("style", adminer.getAStyle());
			session.setAttribute("username", adminer.getAName());
			return "suc";
		}
		loginmsg = "用户名或密码错误！";
		return "err";
	}
	
	public String addOperator() throws Exception{
		System.out.println(!adminerDao.findName(adminer.getAName()));
		if(!adminerDao.findName(adminer.getAName())){
			msg="有重复姓名，请重新注册";
			return "err";
		}
		String pwd = adminer.getAPwd();
		adminer.setAPwd(new MD5Code().getMD5ofStr(pwd));
		adminer.setAStyle(2);
		adminerDao.insertAdminer(adminer);
		msg="添加成功";
		session.setAttribute("msg", msg);
		return "suc";
	}
	
	public String isHasAdminer()throws Exception{
		flag=adminerDao.findIs(idCard);
		return "json";
	}
	public String changePwd()throws Exception{
		Adminer ad = adminerDao.findByid(adminer.getAdminerId());
		if(ad.getAPwd().equals(new MD5Code().getMD5ofStr(password))){
			ad.setAPwd(new MD5Code().getMD5ofStr(adminer.getAPwd()));
			adminerDao.update(ad);
			msg="修改成功";
		}else{
			msg="原密码错误";
			return "err";
		}
		return "suc";
	}
	
	
	public AdminerDao getAdminerDao() {
		return adminerDao;
	}
	
	public void setAdminerDao(AdminerDao adminerDao) {
		this.adminerDao = adminerDao;
	}
	
	public Adminer getAdminer() {
		return adminer;
	}
	
	public void setAdminer(Adminer adminer) {
		this.adminer = adminer;
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

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLoginmsg() {
		return loginmsg;
	}

	public void setLoginmsg(String loginmsg) {
		this.loginmsg = loginmsg;
	}
	
	
}
