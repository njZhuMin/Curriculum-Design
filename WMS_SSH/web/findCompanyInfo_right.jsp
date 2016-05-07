<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户信息查询</title>

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
<script  type="text/javascript" src="js/jquery.js" ></script>
<script type="text/javascript">
	function f1(url){
	 document.myform.action=url;
    document.myform.submit();
	}
</script>
</head>

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
                <td width="94%" valign="bottom"><span class="STYLE1"> 客户信息查询  </span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
             <a style="cursor: pointer;color: yellow;" href="#" ><img  src="images/edit.gif" width="10" height="10" /> </a> </span><span class="STYLE1"> &nbsp;</span></div></td>
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
   			<td>当前位置：基础信息管理〉客户信息查询〉〉</td>
   		</tr>
   		</table>
  <%
  	 if(request.getAttribute("msg")!=null){%>
  	 	
  	 	<script type="text/javascript">
  	 	  alert('<%=request.getAttribute("msg")+""%>');
  	 	</script>
  	 <%}
   %>
   		<form action="findClientBy" method="post" name="myform">
   		<table border="0" width="100%" align="center" bgcolor="#99ccff" align="center">
   		<tr>
   					<td width="20%">&nbsp;</td>
   			<td>请选择查询条件:
   		
   				<select name="key" onchange="f1('findAllClientOption')">
   					<option value="name" ${key=="name"?"selected='selected'":""}>客户名称</option>
   					<option value="sname" ${key=="sname"?"selected='selected'":""}>简称</option>
   					<option value="pname" ${key=="pname"?"selected='selected'":""}>联系人</option>
   				</select>
   			
   			 <select name="value" >
						<s:iterator value="listByOpt" status="status">
							<%if(request.getAttribute("key").equals("name")){%>
								<option value="${Name}" >${Name}</option>
							<%}else if(request.getAttribute("key").equals("pname")){%>
								<option value="${PName}">${PName}</option>
							<%}else if(request.getAttribute("key").equals("sname")){%>
								<option value="${SName}">${SName}</option>
							<%} %> %>
						</s:iterator>
				</select> 	
   			<input type="submit" value="查询"/>
   			<input type="button" onclick="f1('findAllClient?type=op')" value="显示全部数据"/></td>
   		</tr>
   		<tr>
   			<td colspan="3">&nbsp;</td>
   		</tr>
   		</table>
   		</form>
   		
   		<table bgcolor="#ffeeff" width="100%" align="center">
   		<tr><td>
		<s:iterator value="list" status="status">
   		<table id="table" border="1" bgcolor="#ffff99" width="80%" align="center">
   			<tr>
   				<td width="25%">客户全称：${name }</td>
   				<td width="25% ">简称：${SName }</td>
   				<td width="50%">地址：${address }</td>
   			</tr>
   			<tr>
   				<td >邮政编码：${encoding }</td>
   				<td >电话：${tel }</td>
   				<td >传真：${fax }</td>
   			</tr>
   			<tr>
   				<td>联系人：${PName }</td>
   				<td>联系人电话：${PTel }</td>
   				<td>开户银行：${bank }</td>
   			</tr>
   			
   		</table>
   		<tr><td><br/></td></tr>
   		</s:iterator>
   		</td>
   		</tr>
   		
   		</table>
    </td>
  </tr>
</table>
</body>
</html>
