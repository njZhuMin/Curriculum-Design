<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品信息查询</title>

<style type="text/css">
<!--
body {
	font-size:12px;
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}
.STYLE22 {
	font-size: 12px;
	color: #295568;
}
#table{
	margin-top:1px;
	height: 100px;
	padding: 0,0,0,0;
}
#tr{
	height:24px;
}
#fenye{
	
}
-->
</style>
   <%
  	 if(request.getAttribute("msg")!=null){%>
  	 	
  	 	<script type="text/javascript">
  	 	  alert('<%=request.getAttribute("msg")+""%>');
  	 	</script>
  	 <%}
   %>
<script  type="text/javascript" src="js/jquery.js" ></script>
<script type="text/javascript">
  	function changeCp(val){
			document.getElementById("cp").value=val;
			document.myForm.submit();
		}
		function doSubmit(){
			changeCp(1);
			document.myForm.submit();
		}
	function f1(url){
	 document.myform.action=url;
    document.myform.submit();
	}
  </script></head>

<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"> 商品信息查询  </span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
             <a style="cursor: pointer;color: yellow;" href="#" ><img  src="images/edit.gif" width="10" height="10" /> 返回到#######&nbsp;</a> </span><span class="STYLE1"> &nbsp;</span></div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>
    	<div>
   		<table border="0" width="100%" align="center">
   		<tr bgcolor="#ff9966">
   			<td>当前位置：基础信息管理〉商品信息查询〉〉</td>
   		</tr>
   		</table>
   		<form action="findProBy" name="myform" method="post">
   		<table border="0" width="100%" align="center" bgcolor="#99ccff" align="center">
   		<tr>
   					<td width="20%">&nbsp;</td>
   			<td>请选择查询条件:
   		
   				<select name="key" onchange="f1('findAllOption')">
   					<option value="client" ${key=="client"?"selected='selected'":""}>供应商</option>
   					<option value="pname"  ${key=="pname"?"selected='selected'":""}>商品名称</option>
   				</select>
   	 
					
				 <select name="value" >
						<s:iterator value="listByOpt" status="status">
							<%if(request.getAttribute("key").equals("client")){%>
								<option value="${Name}">${Name}</option>
							<%}else if(request.getAttribute("key").equals("pname")){%>
								<option value="${PName}">${PName}</option>
							<%} %>
						</s:iterator>
				</select> 	
					
				
			 	
   			<input type="submit" value="查询"/>
   			<input type="button" value="显示全部数据" onclick="f1('findAllPro?type=op')"/></td>
   		</tr>
   		<tr>
   			<td colspan="3">&nbsp;</td>
   		</tr>
   		</table>
   		</form>
   		<form action="" name="myForm" method="post">
   		<table id="table" width="80%" align="center">
   		
   			<s:iterator value="list" status="status">
   				<tr>
   					<td>
   						<table  border="1" bgcolor="#ccddFF" width="80%" align="left">
				   			<tr>
				   				<td colspan="2" width="70%">商品全称：${PName}</td>
				   				<td width="30%">简称：${PSName}</td>
				   			</tr>
				   			<tr>
				   				<td width="50%">地址：${PAddress}</td>
				   				<td width="20%">规格：${PNorms}</td>
				   				<td width="30%">商品批号：${PNum}</td>
				   			</tr>
				   			<tr>
				   				<td width="50%">批准文号：${PPassNum}</td>
				   				<td width="20%">包装：${PPackage}</td>
				   				<td width="30%">供应商: ${sup.supName}</td>
				
				   			</tr>
				   		</table>
   					</td>
   				</tr>
   				<tr><td><br/></td></tr>
   			</s:iterator>
   		</table>
		</form>
</body>
</html>
