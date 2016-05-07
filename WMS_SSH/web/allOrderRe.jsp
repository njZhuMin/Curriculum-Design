<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'AllClient.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script type="text/javascript">
function changeCp(val) {
	document.getElementById("cp").value = val;
	document.myForm.submit();
}
function doSubmit() {
	changeCp(1);
	document.myForm.submit();
}
</script>
	</head>

	<body>
		<%
			if (request.getAttribute("msg") != null) {
		%>

		<script type="text/javascript">
alert('<%=request.getAttribute("msg") + ""%>');
</script>
		<%
			}
		%>
		<table border="0" width="100%" align="center">
			<tr bgcolor="#ff9966">
				<td>
					当前位置：基础信息管理〉退库订单管理〉〉
				</td>
				<td><a href ="findPayedOrderRe?value=pay">已付款订单</a></td>
				<td><a href ="findPayedOrderRe?value=nopay">未付款订单</a></td>
			</tr>
		</table>
		<form action="" name="myForm">
		
			<input type="hidden" id="cp" name="page.currentPage"
				value="${page.currentPage}">
			<input type="hidden" id="ls" name="page.pageSize"
				value="${page.pageSize}">
			<table width="70%" align="center">
				<tr>
					<td>

					</td>
				</tr>
				<%if(request.getAttribute("listByPay")==null){ %>
				<s:iterator value="page.list" status="st">
					   		<table id="table" border="1" bgcolor="#ffff99" width="80%" align="center">
   			<tr>
   				<td width="30%">序列号：<s:property value="#st.index+1" /></td>
   				<td width="70%" colspan="2">订单号：${ONumId}</td>
   			</tr>
   			<tr>
   				<td><input type="hidden" name="style" value="in"/>
   				商品：${product.PName}</td>
   				<td>商品数量：${ONum}</td>
   				<td>总价：${OAllMoney}</td>
   			</tr>
   			<tr>
   				<td>实付：${OPayMoney}</td>
   				<td>日期：${ODate}</td>
   				<td>操作员：${OAdminerId}</td>
   			</tr>
   			<tr>
   				<td colspan="3"><a href="PayAllMoney?id=${OId} &style=out">已完成付款</a></td>
   			</tr>
   		</table>
   		<tr><td><br/></td></tr>
				</s:iterator>
				<%}else{
				 %>
				 <s:iterator value="listByPay" status="st">
					   		<table id="table" border="1" bgcolor="#ffff99" width="80%" align="center">
   			<tr>
   				
   				<td  colspan="3">订单号：${ONumId}</td>
   			</tr>
   			<tr>
   				<td><input type="hidden" name="style" value="in"/>
   				商品：${product.PName}</td>
   				<td>商品数量：${ONum}</td>
   				<td>总价：${OAllMoney}</td>
   			</tr>
   			<tr>
   				<td>实付：${OPayMoney}</td>
   				<td>日期：${ODate}</td>
   				<td>操作员：${OAdminerId}</td>
   			</tr>
   			<tr>
   				<td colspan="3"><a href="PayAllMoney?id=${OId} &style=in">已完成付款</a></td>
   			</tr>
   		</table>
   		<tr><td><br/></td></tr>
				</s:iterator>
				 <%} %>
			</table>
			<%if(request.getAttribute("value")!=null){
				if(request.getAttribute("value").equals("pay")){
				  %>
				  <input type="hidden" name="value" value="pay"/>
				  <%} else{
				  %>
				  <input type="hidden" name="value" value="nopay"/>
				  <%}} %>
			<table width="50%" align="center">
				<tr>
					<td>

						当前第
						<s:property value="page.currentPage" />
						页
					</td>
					<td>
						共
						<s:property value="page.totalPage" />
						页
					</td>
					<s:if test="page.hasPreviousPage==true">
						<td>
							<a href="javascript:void(0)" onclick="changeCp(1)">首页</a>
						</td>
						<td>
							<a href="javascript:void(0)"
								onclick="changeCp(<s:property value='page.prePage'/>)">上一页</a>
						</td>
					</s:if>
					<s:else>
						<td>
							首页
						</td>
						<td>
							上一页
						</td>
					</s:else>
					<s:if test="page.hasNextPage==true">
						<td>
							<a href="javascript:void(0)"
								onclick="changeCp(<s:property value='page.nextPage'/>)"> 下一页</a>
						</td>
						<td>
							<a href="javascript:void(0)"
								onclick="changeCp(<s:property value='page.totalPage'/>)">尾页</a>
						</td>
					</s:if>
					<s:else>
						<td>
							下一页
						</td>
						<td>
							尾页
						</td>
					</s:else>
				</tr>
			</table>
		</form>
	</body>
</html>
