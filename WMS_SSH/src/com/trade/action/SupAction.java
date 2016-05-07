package com.trade.action;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.List;

import jxl.Sheet;
import jxl.Workbook;

import com.trade.dao.ProductDao;
import com.trade.dao.SupplierDao;
import com.trade.pojo.Supplier;
import com.util.Page;

public class SupAction {
	private Supplier sup;
	private String msg;
	private int id;
	private List list;
	private Page page = new Page();
	private boolean flag;
	private String key;
	private String value;
	private SupplierDao supDao;
	private List listByOpt;
	private ProductDao proDao;
	private String type;
	private String supName;
	private File supXml;

	public String findIs() throws Exception {
		List<Supplier> list = supDao.findSupByName(supName);
		if (list.size() > 0) {
			flag = false;
		} else {
			flag = true;
		}
		return "suc";
	}

	public String addSup() throws Exception {
		supDao.addSup(sup);
		msg = "添加成功";
		return "suc";
	}

	public String findAllSup() throws Exception {
		int count = supDao.allSupCount();
		page.setRowCount(count);
		list = supDao.findAllSup(page.getCurrentPage(), page.getPageSize());
		page.setList(list);
		page.execute();
		if (msg != null) {
			if (msg.equals("delete")) {
				msg = "删除成功";
			} else if (msg.equals("update")) {
				msg = "更新成功";
			} else if (msg.equals("err")) {
				msg = "数据不存在，请刷新页面";
			}
		}
		if (type != null) {
			if (type.equals("op")) {
				list = supDao.findAll();
				findAllSupOption();
				key = "name";
				msg = "找到" + list.size() + "条记录";
				return "op";
			}
		}
		return "suc";
	}

	public String findSupById() throws Exception {
		sup = supDao.findById(id);
		if (sup == null) {
			return "err";
		}
		return "suc";
	}

	public String updateSup() throws Exception {
		if (sup == null) {
			return "err";
		}
		supDao.update(sup);
		return "suc";
	}

	public String deleteSupById() throws Exception {
		sup = supDao.findById(id);
		if (sup == null) {
			return "err";
		}
		supDao.deleteSup(id);
		return "suc";
	}

	public String findAllSupToPro() throws Exception {
		list = supDao.findAllSupToPro();
		if (msg != null) {
			if (msg.equals("suc")) {
				msg = "添加成功";
			}
			if (msg.equals("err")) {
				msg = "商品名不能为空";
			}
		}
		return "suc";
	}

	public String findAllSupOption() throws Exception {
		listByOpt = supDao.findAll();
		return "suc";
	}

	public String findSupBy() throws Exception {
		if (key.equals("name")) {
			list = supDao.findSupByName(value);
			msg = "找到" + list.size() + "条记录";
		} else if (key.equals("sname")) {
			list = supDao.findSupBySName(value);
			msg = "找到" + list.size() + "条记录";
		}
		if (list.size() == 0) {
			msg = "未找到相关数据";
		}
		findAllSupOption();
		return "suc";
	}

	boolean getXml = true;

	public String getSupXML() {
		BufferedInputStream bis;
		try {
			bis = new BufferedInputStream(new FileInputStream(supXml));
			Workbook wb = Workbook.getWorkbook(bis);
			Sheet sheet = wb.getSheet(0);
			int rows = sheet.getRows();
			Supplier sup = null;
			for (int i = 1; i < rows; i++) {
				sup = new Supplier();
				sup.setSupName(sheet.getCell(0, i).getContents().trim());
				sup.setSupSName(sheet.getCell(1, i).getContents().trim());
				sup.setSupAddress(sheet.getCell(2, i).getContents().trim());
				sup.setSupEncoding(sheet.getCell(3, i).getContents().trim());
				sup.setSupTel(sheet.getCell(4, i).getContents().trim());
				sup.setSupFax(sheet.getCell(5, i).getContents().trim());
				sup.setSupPeople(sheet.getCell(6, i).getContents().trim());
				sup.setSupPTel(sheet.getCell(7, i).getContents().trim());
				sup.setSupEmail(sheet.getCell(8, i).getContents().trim());
				sup.setSupBank(sheet.getCell(9, i).getContents().trim());
				if (isTrue(sup)) {
					supDao.addSup(sup);
				} else {
					if (getXml) {
						if (msg == null) {
							msg = "第" + i + "条有空数据或格式不符合\\n";
						} else {
							msg = "第" + i + "条有空数据或格式不符合\\n" + msg;
						}
					}
				}
			}
		} catch (Exception e) {
			msg = "文件没上传";
		}
		if (msg == null) {
			msg = "操作成功";
		}
		return "suc";
	}
//全部不null，正则
	private boolean isTrue(Supplier sup) {
		String Endreg = "/^[1-9][0-9]{5}$/";
		String Faxreg = "/^(([0\\+]\\d{2,3}-)?(0\\d{2,3})-)(\\d{7,8})(-(\\d{3,}))?$/";
		String Emailreg = "/^([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+\\.[a-zA-Z]{2,3}$/";

		if (sup.getSupName().length() == 0) {
			return false;
		}
		if (sup.getSupSName().length() == 0) {
			return false;
		}
		if (sup.getSupAddress().length() == 0) {
			return false;
		}
		if (sup.getSupEncoding().length() == 0) {
			return false;
		} else if (!sup.getSupEncoding().matches(Endreg)) {
			return false;
		}

		if (sup.getSupTel().length() == 0) {
			return false;
		} 

		if (sup.getSupFax().length() == 0) {
			return false;
		} else if (!sup.getSupFax().matches(Faxreg)) {
			return false;
		}
		if (sup.getSupEmail().length() != 0) {
			if (!sup.getSupEmail().matches(Emailreg)) {
				return false;
			}
		}
		if (sup.getSupPeople().length() == 0) {
			return false;
		}
		if (sup.getSupPTel().length() == 0) {
			return false;
		}
		if (sup.getSupBank().length() == 0) {
			return false;
		}
		return true;
	}

	public Supplier getSup() {
		return sup;
	}

	public void setSup(Supplier sup) {
		this.sup = sup;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public SupplierDao getSupDao() {
		return supDao;
	}

	public void setSupDao(SupplierDao supDao) {
		this.supDao = supDao;
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

	public List getListByOpt() {
		return listByOpt;
	}

	public void setListByOpt(List listByOpt) {
		this.listByOpt = listByOpt;
	}

	public ProductDao getProDao() {
		return proDao;
	}

	public void setProDao(ProductDao prosupNameDao) {
		this.proDao = proDao;
	}

	public String getSupName() {
		return supName;
	}

	public void setSupName(String supName) {
		this.supName = supName;
	}

	public File getSupXml() {
		return supXml;
	}

	public void setSupXml(File supXml) {
		this.supXml = supXml;
	}

}
