<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="/struts-tags"  prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改密码</title>

<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
	font-size:12px;
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
-->
</style>
<script  type="text/javascript" src="js/jquery.js" ></script>
<script type="text/javascript">
	function point(){
				
				var order=$("#orderPwd").val();
      			var pwd=$("#pwd").val();
				var ifpwd=$("#ifpwd").val();
				order=order.trim();
				pwd=pwd.trim();
				ifpwd=ifpwd.trim();
				if(order.length>0){
				$("#msg1").html("");
				}else{
				$("#msg1").html("不能为空");
				return false;
				}
				if(pwd.length>0){
				$("#msg22").html("");
				}else{
				$("#msg22").html("不能为空");
				return false;
				}
				if(ifpwd.length>0){
				$("#msg2").html("");
				}else{
				$("#msg2").html("不能为空");
				return false;
				}
				if(pwd==ifpwd){
				$("#msg2").html("");
				}else{
				$("#msg2").html("两次密码不一致");
				return false;
				}
				
				return true;
	}
	
	function f1(url){
		document.myform1.action=url;
    	document.myform1.submit();	
	}
</script>
</head>
<body>
   <%
  	 if(request.getAttribute("msg")!=null){%>
  	 	
  	 	<script type="text/javascript">
  	 	  alert('<%=request.getAttribute("msg")+""%>');
  	 	</script>
  	 <%}
   %>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"> 用户基本设置  </span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
             <a style="cursor: pointer;color: yellow;" href="#" ><img  src="images/edit.gif" width="10" height="10" /> 退出系统</a> </span><span class="STYLE1"> &nbsp;</span></div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>
    <form action="changePwd" method="post" onsubmit="return point()">
   	<table border="0" width="40%" align="center" bgcolor="#ffeeff" cellspacing="4">
		
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作员帐号：    	</td>
			<td><input type="text" value="${adminerId }" disabled="disabled"/>
				<input type="hidden" value="${adminerId }" name="adminer.AIdcard" />
				<input type="hidden" name="adminer.adminerId"	value="${userId }" />
				
			</td>
		
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;原密码：	</td>
			<td><input type="text" name="password" id="orderPwd" />
			<font color="red">
			<span id="msg1"></span></font></td>
			
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新密码：	</td>
			<td><input type="password" name="adminer.APwd" id="pwd"/>
			<font color="red">
			<span id="msg22"></span></font></td>
			
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;确认新密码：	</td>
			<td><input type="password" id="ifpwd"/>
			<font color="red">
			<span id="msg2"></span></font></td>
			
		</tr>
		
		<tr align="center">
			<td><input type="submit" value="确认修改"/></td>
			<td><input type="reset" value="取消修改"/></td>
		</tr>
   </table>
   </form>
    </td>
  </tr>
</table>
</body>
</html>
