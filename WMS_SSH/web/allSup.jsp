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
					当前位置：基础信息管理〉供应商信息查询〉〉
				</td>
			</tr>
		</table>
		<form action="" name="myForm">
			<input type="hidden" value="${msg}" id="msg" />
			<input type="hidden" id="cp" name="page.currentPage"
				value="${page.currentPage}">
			<input type="hidden" id="ls" name="page.pageSize"
				value="${page.pageSize}">
			<table width="70%" align="center">
				<tr>
					<td>

					</td>
				</tr>
				<s:iterator value="page.list" status="status">
					   		<table id="table" border="1" bgcolor="#ffff99" width="80%" align="center">
   			<tr>
   				<td width="30%">供应商全称：<a href="findSupById?id=${supId}">${supName}</a></td>
   				<td width="30%">简称：${supSName}</td>
   				<td width="40%">地址：${supAddress}</td>
   			</tr>
   			<tr>
   				<td>邮政编码：${supEncoding}</td>
   				<td>电话：${supTel}</td>
   				<td>传真：${supFax}</td>
   			</tr>
   			<tr>
   				<td>联系人：${supPeople}</td>
   				<td>联系人电话：${supPTel}</td>
   				<td>开户银行：${supBank}</td>
   			</tr>
   			<tr>
   				<td colspan="3">E-Mail：${supEmail}</td>
   				
   			</tr>
   		</table>
   		<tr><td><br/></td></tr>
				</s:iterator>
			</table>
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
			<input type="hidden" name="type" value="admin" />
		</form>
	</body>
</html>
