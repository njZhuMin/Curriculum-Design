package com.trade.action;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import jxl.Sheet;
import jxl.Workbook;

import com.trade.dao.ClientDao;
import com.trade.dao.ProductDao;
import com.trade.dao.SupplierDao;
import com.trade.pojo.Product;
import com.trade.pojo.Supplier;
import com.util.Page;

public class ProductAction {
	private Product pro;
	private String msg;
	private int id;
	private List list;
	private Page page = new Page();
	private boolean flag;
	private ProductDao proDao;
	private SupplierDao supDao;
	private ClientDao clientDao;
	private String key;
	private String value;
	private List listByOpt;
	private String type;
	private String name;
	private File proxml;

	public File getProxml() {
		return proxml;
	}

	public void setProxml(File proxml) {
		this.proxml = proxml;
	}

	public String addPro() throws Exception {
		if (pro.getPName() == null || pro.getPName().equals("")) {
			msg = "商品名为空";
			return "err";
		} else {
			proDao.insert(pro);
			msg = "添加成功";
		}
		return "suc";
	}

	public String isUsed() throws Exception {
		List<Product> list = proDao.findByProName(name);
		if (list.size() > 0) {
			flag = false;
		} else {
			flag = true;
		}
		return "json";
	}

	public String findAllPro() throws Exception {
		int count = proDao.findAllProCount();
		page.setRowCount(count);
		list = proDao.findall(page.getCurrentPage(), page.getPageSize());
		page.setList(list);
		page.execute();

		if (msg != null) {
			if (msg.equals("delete")) {
				msg = "删除成功";
			} else if (msg.equals("update")) {
				msg = "更新成功";
			} else if (msg.equals("err")) {
				msg = "数据错误，请刷新页面";
			}
		}
		if (type != null) {
			if (type.equals("op")) {
				findAllOption();
				list = proDao.findAll();
				key = "client";
				msg = "找到" + list.size() + "条记录";
				return "op";
			}
		}

		return "admin";
	}

	public String findProById() throws Exception {
		pro = proDao.findByid(id);
		list = supDao.findAllSupToPro();
		if (pro == null) {
			return "err";
		}
		return "suc";
	}

	public String findAllOption() throws Exception {
		if (key.equals("client")) {
			listByOpt = clientDao.findAll();
		} else if (key.equals("pname")) {
			listByOpt = proDao.findAll();
		}
		return "suc";
	}

	public String deletePro() throws Exception {
		pro = proDao.findByid(id);
		if (pro != null) {
			proDao.deleteById(id);
			return "suc";
		}
		return "err";
	}

	public String updatePro() throws Exception {
		if (pro != null) {
			proDao.update(pro);
			return "suc";
		}
		return "err";
	}

	public String findProBy() throws Exception {
		if (key.equals("client")) {
			int id = clientDao.selClientId(value);
			list = proDao.findBySup(id);
			msg = "找到" + list.size() + "条记录";
		} else if (key.equals("pname")) {
			list = proDao.findByProName(value);
			msg = "找到" + list.size() + "条记录";
		} else if (key.equals("address")) {
			list = proDao.findByAddress(value);
			msg = "找到" + list.size() + "条记录";
		}
		if (list.size() == 0) {
			msg = "未找到相关数据";
		}
		findAllOption();
		return "suc";
	}
	int i;
	boolean getXml=true;
	public String getProXml() {
		BufferedInputStream bis;
		try {
			bis = new BufferedInputStream(new FileInputStream(proxml));
			Workbook wb = Workbook.getWorkbook(bis);
			Sheet sheet = wb.getSheet(0);
			int rows = sheet.getRows();
			Product pro = null;
			for (i = 1; i < rows; i++) {
				getXml=true;
					pro = new Product();
					pro.setPName(sheet.getCell(0, i).getContents().trim());
					pro.setPSName(sheet.getCell(1, i).getContents().trim());
					pro.setPAddress(sheet.getCell(2, i).getContents().trim());
					pro.setPNum(sheet.getCell(3, i).getContents().trim());
					pro.setPNorms(sheet.getCell(4, i).getContents().trim());
					pro.setPPackage(sheet.getCell(5, i).getContents().trim());
					pro.setPUnit(sheet.getCell(6, i).getContents().trim());
					pro.setPPassNum(sheet.getCell(7, i).getContents().trim());
					int a;
					try {
						a=Integer.parseInt(sheet.getCell(8, i)
								.getContents().trim());
					} catch (NumberFormatException e) {
						a=0;
					}
					pro.setPSingleMoney(a);
					
					String supname = sheet.getCell(9, i).getContents().trim();
					Supplier sup = supDao.findsup_id(supname);
					pro.setSup(sup);
					pro.setRemark(sheet.getCell(10, i).getContents().trim());
					if (isNull(pro)) {
						proDao.insert(pro);
					} else {
						if(getXml){
							if(msg==null ){
								msg="第"+i+"条有空数据\\n" ; 
								getXml=false;;
							}else{
								msg="第"+i+"条有空数据\\n"+msg ; 
								getXml=false;
								
								
							}
							
						}
					}
			}
		} catch (Exception e) {
			msg = "未上传Excel文件";
		}
		if(msg==null){
			msg="添加成功";
		}
		System.out.println(msg);
		return "suc";
	}

	private boolean isNull(Product pro) {
		try {
			List<Product> list = null;
			boolean flag = false;
			try {
				list = proDao.findByProName(pro.getPName());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		if (pro.getPName().length() == 0 ||list.size() > 0) {
			
			if (list.size() > 0) {
				if(getXml){
				}
				if(msg==null){
					msg="第"+i+"条商品已存在\\n" ; 
					getXml=false;
				}else{
					getXml=false;
					msg="第"+i+"条商品已存在\\n"+msg ; 
				}
					
			} else {
				flag= true;
			}
			flag= false;
			return flag;
		}
		
		if (pro.getPSName().length()== 0) {
			return false;
		}
		if (pro.getPAddress().length() == 0) {
			return false;
		}
		if(pro.getPNum().length()==0){
			return false;
		}
		if(pro.getPNorms().length()==0){
			return false ;
		}
		if(pro.getPPackage().length()==0){
			return false ;
		}
		if(pro.getPUnit().length()==0){
			return false ;
		}
		if(pro.getPPassNum().length()==0){
			return false ;
		}
		if(pro.getPSingleMoney().equals("") ||
				pro.getPSingleMoney().toString().trim().length()==0 || pro.getPSingleMoney()<=0 ){
			return false ;
		}
		return true;
	} catch (NullPointerException e) {
		e.printStackTrace();
		return false;
	}
	
	}


	public ClientDao getClientDao() {
		return clientDao;
	}

	public void setClientDao(ClientDao clientDao) {
		this.clientDao = clientDao;
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

	public Product getPro() {
		return pro;
	}

	public void setPro(Product pro) {
		this.pro = pro;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public ProductDao getProDao() {
		return proDao;
	}

	public void setProDao(ProductDao proDao) {
		this.proDao = proDao;
	}

	public SupplierDao getSupDao() {
		return supDao;
	}

	public void setSupDao(SupplierDao supDao) {
		this.supDao = supDao;
	}

	public List getListByOpt() {
		return listByOpt;
	}

	public void setListByOpt(List listByOpt) {
		this.listByOpt = listByOpt;
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
