package com.util;

import java.util.List;

public class Page {
	private int pageSize=5;//ÿҳ��ʾ������
	private int totalPage;//һ������ҳ
	private int rowCount;//������
	private int currentPage=1;//��ǰ�ڼ�ҳ
	private int prePage;//��һҳ
	private int nextPage;//��һҳ
	private boolean hasNextPage;    // �Ƿ�����һҳ
	private boolean hasPreviousPage;    // �Ƿ���ǰһҳ
	private List list;
	public void execute(){
		totalPage = (rowCount-1)/pageSize+1;
		if(currentPage>1){
			this.setPrePage(currentPage-1);
			this.setHasPreviousPage(true);
		}else{
			this.setPrePage(1);
			this.setHasPreviousPage(false);
		}
		if(currentPage>=totalPage){
			this.setNextPage(totalPage);
			this.setHasNextPage(false);
		}else{
			this.setNextPage(currentPage+1);
			this.setHasNextPage(true);
		}
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getRowCount() {
		return rowCount;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPrePage() {
		return prePage;
	}
	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public boolean isHasNextPage() {
		return hasNextPage;
	}
	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}
	public boolean isHasPreviousPage() {
		return hasPreviousPage;
	}
	public void setHasPreviousPage(boolean hasPreviousPage) {
		this.hasPreviousPage = hasPreviousPage;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	
}
