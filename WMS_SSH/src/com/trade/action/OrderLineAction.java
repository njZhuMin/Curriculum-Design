package com.trade.action;

import java.io.File;
import java.io.FileNotFoundException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jxl.Workbook;
import jxl.format.Colour;
import jxl.format.UnderlineStyle;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

import com.trade.dao.OrderLineDao;
import com.trade.dao.ProductDao;
import com.trade.dao.StorageDao;
import com.trade.pojo.Orderline;
import com.trade.pojo.Product;
import com.trade.pojo.Storage;
import com.util.IPTimeStamp;
import com.util.Page;

public class OrderLineAction {
	private OrderLineDao orderDao;
	private Orderline order;
	private String msg;
	private ProductDao proDao;	
	private List list;
	private String num;
	private Product pro;
	private int id;
	private String type;
	private String date;
	private String flag;
	private List listByOpt;
	private List listByPay;
	private int count;
	private Page page = new Page();
	private StorageDao storageDao;
	private String style;
	private Storage sto;
	private String value;
	
	public String findAllProTuSt()throws Exception{
		{
			type="1";
		}
		
		list=proDao.findAll();
		if(flag!=null){
			if(flag.equals("addOrder")){
				msg="入库成功";
			}else if(flag.equals("returnOrder")){
				msg="退库成功";
			}
			}
		return "suc";
	}
	
	public String selectProToSto()throws Exception{
		pro=proDao.findByid(id);
		IPTimeStamp ip=new IPTimeStamp("127");
		num=ip.getIPTimeStame();
		findAllProTuSt();
		type=pro.getPName();
		SimpleDateFormat dateformat1=new SimpleDateFormat("yyyy-MM-dd");
		date=dateformat1.format(new Date());
		return "suc";
	}
	
	public String selectProRetSto()throws Exception{
		pro=proDao.findByid(id);
		IPTimeStamp ip=new IPTimeStamp("127");
		num=ip.getIPTimeStame();
		findAllProTuSt();
		type=pro.getPName();
		SimpleDateFormat dateformat1=new SimpleDateFormat("yyyy-MM-dd");
		date=dateformat1.format(new Date());
		sto=storageDao.findByPName(pro.getPName());
		return "suc";
	}
	
	
	public String findStoProTuSt()throws Exception{
		{
			type="1";
		}
		list= storageDao.findAll();
		return "suc";
	}
	
	public String addOrder() throws Exception {
		orderDao.addOrder(order);
		if (style != null) {
			if (storageDao.findStoByPName(proDao.findByid(id).getPName())) {
				sto.setSNum(order.getONum());
				storageDao.addToStorage(sto);
				msg="商品入库成功";
			} else {
				Storage storage = storageDao.findByPName(proDao.findByid(id).getPName());
				if (style.equals("add")) {
					int nowNum = storage.getSNum();
					int newNum = nowNum + order.getONum();
					storage.setSNum(newNum);
					storageDao.updateStorage(storage);
					msg="商品入库成功";
					return "in";
				} else {
					int nowNum = storage.getSNum();
					int newNum = nowNum - order.getONum();
					if(newNum<0){
						msg="该商品数量只有"+storage.getSNum()+"!退货失败";
						return "err";
					}else{
						storage.setSNum(newNum);
						storageDao.updateStorage(storage);
						msg="商品退库成功";	
						return"out";
					}
				}
			}
		}
		return "in";
	}
	
	public String findProInSto()throws Exception{
		listByOpt=storageDao.findAll();
		return "suc";
	}
	@SuppressWarnings("unchecked")
	public String findOneProInSto()throws Exception{
		listByOpt=storageDao.findAll();
		sto = storageDao.findByPName(value);
		list=new ArrayList<Storage>();
		list.add(sto);
		count = sto.getSNum()*sto.getProduct().getPSingleMoney();
		return "suc";
	}
	
	public String findAllProInSto()throws Exception{
		listByOpt=storageDao.findAll();
		list=storageDao.findAll();
		
		return "suc";
	}
	public String findAllOrderIn()throws Exception{
		int count = orderDao.findAllIn();
		page.setRowCount(count);
		list = orderDao.findAllIn(page.getCurrentPage(), page
				.getPageSize());
		page.setList(list);
		page.execute();
		if(style!=null){
			if(style.equals("downinsuc")){
				msg="已下载至桌面";
			}else if(style.equals("downinerr")){
				msg="系统出错，请重新下载";
			}else if(style.equals("in")){
				msg="已完成付账";
			}
		}
		return "suc";
		
	}
	public String findAllOrderRe()throws Exception{
		int count = orderDao.findAllOut();
		page.setRowCount(count);
		list = orderDao.findAllReturn(page.getCurrentPage(), page
				.getPageSize());
		page.setList(list);
		page.execute();
		if(style!=null){
			if(style.equals("down")){
				msg="已下载至桌面";
			}else if (style.equals("in")){
				msg="已完成付账";
			}
		}
		return "suc";
		
	}
	public String xmlForOrderLineIn()throws Exception{
		List<Orderline> listIn = orderDao.findAllInForXml();
		List<Orderline> listOut = orderDao.findAllReForXml();
		File file = null;
		try{
		file = new File("C:\\Users\\Administrator\\Desktop\\仓库信息.xls");
		}catch (Exception e) {
			file = new File("/home/soft01/Desktop/仓库信息.xls");
		}
		if(file.exists()){
			file.delete();
		}
		try {
			WritableWorkbook wwb = Workbook.createWorkbook(file);
			//3、创建一个可写工作表
			WritableSheet wsIn = wwb.createSheet("仓库入库信息查询", 0);
			WritableSheet wsOut = wwb.createSheet("仓库 退库信息查询", 1);
			OrderToXml(listIn,wsIn);
			OrderToXml(listOut,wsOut);
			wwb.write();
			// 将工作表对象的操作关闭
			wwb.close();
		} catch (Exception e) {
			e.printStackTrace();
			return "err";
		}
			return "in";
	}
	
	public void OrderToXml(List<Orderline> listIn,	WritableSheet wsIn){
		try {
			Label label = new Label(0, 1, "帐单编号");
			wsIn.addCell(label);
			wsIn.mergeCells(0, 1, 2, 1);
		

		label = new Label(3, 1, "商品名称");
		wsIn.addCell(label);
		label = new Label(4, 1, "商品数量");
		wsIn.addCell(label);
		label = new Label(5, 1, "总价");
		wsIn.addCell(label);
		label = new Label(6, 1, "实付");
		wsIn.addCell(label);
		label = new Label(7, 1, "未付");
		wsIn.addCell(label);
		label = new Label(8, 1, "日期");
		wsIn.addCell(label);
		wsIn.mergeCells(8, 1, 9, 1);
		label = new Label(10, 1, "操作员");
		wsIn.addCell(label);

		for (int i = 2; i < listIn.size() + 2; i++) {
			int j = i - 2;
			label = new Label(0, i, listIn.get(j).getONumId());
			wsIn.mergeCells(0, i, 2, i);
			wsIn.addCell(label);

			label = new Label(3, i, listIn.get(j).getProduct().getPName());
			wsIn.addCell(label);

			label = new Label(4, i, listIn.get(j).getONum() + "");
			wsIn.addCell(label);

			label = new Label(5, i, listIn.get(j).getOAllMoney() + "");
			wsIn.addCell(label);

			label = new Label(6, i, listIn.get(j).getOPayMoney() + "");
			wsIn.addCell(label);
			int a;
			try {
				a = listIn.get(j).getOAllMoney()
						- listIn.get(j).getOPayMoney();

			} catch (Exception e) {
				a = listIn.get(j).getOAllMoney();
			}
			if (a > 0) {
				WritableFont wf3 = new WritableFont(WritableFont.ARIAL, 10,
						WritableFont.NO_BOLD, false, UnderlineStyle.DOUBLE,
						Colour.RED);
				WritableCellFormat wcf3 = new WritableCellFormat(wf3);
				label = new Label(7, i, a + "", wcf3);
			} else {
				label = new Label(7, i, a + "");
			}
			wsIn.addCell(label);

			label = new Label(8, i, listIn.get(j).getODate() + "");
			wsIn.addCell(label);
			wsIn.mergeCells(8, i, 9, i);


			label = new Label(10, i, listIn.get(j).getOAdminerId() + "");
			wsIn.addCell(label);
		}
		} catch (RowsExceededException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (WriteException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	
	public String PayAllMoney()throws Exception{
		if(style!=null){
			if(style.equals("in")){
				Orderline o = orderDao.findById(id);
				o.setOPayMoney(o.getOAllMoney());
				orderDao.update(o);
				o = orderDao.findById(id);
				return "in";
			}else if(style.equals("out")){
				Orderline o = orderDao.findById(id);
				o.setOPayMoney(o.getOAllMoney());
				orderDao.update(o);
				return "out";
			}
		}
		return "in";
	}
	
	public String findPayedOrderIn()throws Exception{
/*		listByPay = orderDao.findAllInForXml();
		Orderline o = new Orderline();
		int i ;
		for (i = 0; i<listByPay.size(); i++) {
			o = (Orderline)listByPay.get(i);
			int a = o.getOAllMoney()-o.getOPayMoney();
			if(value.equals("pay")){
				if(a!=0){
					listByPay.remove(i);
					i--;
				}
			}else{
				if(value.equals("nopay")){
					if(a==0){
						listByPay.remove(i);
						i--;
					}
				}
			}
		}*/
		int count;
		if(value.equals("pay")){
			listByPay = orderDao.findPayListByIn(page.getCurrentPage(), page
				.getPageSize());
			count=orderDao.findAllInPay();
		}else{
			listByPay = orderDao.findNoPayListByIn(page.getCurrentPage(), page
					.getPageSize());
			count=orderDao.findAllInNoPay();

		}
		page.setRowCount(count);
		page.setList(listByPay);
		page.execute();
		return "suc";
	}
	
	public String findPayedOrderRe()throws Exception{

				int count;
				if(value.equals("pay")){
					listByPay = orderDao.findPayListByRe(page.getCurrentPage(), page
						.getPageSize());
					count=orderDao.findAllRePay();
				}else{
					listByPay = orderDao.findNoPayListByRe(page.getCurrentPage(), page
							.getPageSize());
					count=orderDao.findAllReNoPay();

				}
				page.setRowCount(count);
				page.setList(listByPay);
				page.execute();
				return "suc";
			}
	
	
	
	public OrderLineDao getOrderDao() {
		return orderDao;
	}
	public void setOrderDao(OrderLineDao orderDao) {
		this.orderDao = orderDao;
	}
	public Orderline getOrder() {
		return order;
	}
	public void setOrder(Orderline order) {
		this.order = order;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public ProductDao getProDao() {
		return proDao;
	}
	public void setProDao(ProductDao proDao) {
		this.proDao = proDao;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}

	public Product getPro() {
		return pro;
	}

	public void setPro(Product pro) {
		this.pro = pro;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getStyle() {
		return style;
	}
	
	public List getListByOpt() {
		return listByOpt;
	}

	public void setListByOpt(List listByOpt) {
		this.listByOpt = listByOpt;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public StorageDao getStorageDao() {
		return storageDao;
	}

	public void setStorageDao(StorageDao storageDao) {
		this.storageDao = storageDao;
	}

	public Storage getSto() {
		return sto;
	}

	public void setSto(Storage sto) {
		this.sto = sto;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public List getListByPay() {
		return listByPay;
	}

	public void setListByPay(List listByPay) {
		this.listByPay = listByPay;
	}
	
	
	
	
	
}
