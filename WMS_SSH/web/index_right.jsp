<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.text.*" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/right.css"/>
<title>无标题文档</title>
</head>
	<SCRIPT type="text/javascript">
		function tishi(){
			alert("你的权限不足");
		}
	</SCRIPT>
<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="font-size:12px;">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="<%=basePath %>images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1">${style==1?"<a>管理员首页</a>":"<a>操作员首页</a>"}</span></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr><td height="25px"></td></tr>
  <tr>
  	<td>
  		<table cellspacing=0 cellpadding=0 width="90%" align=center border=0>
  <tr height=100>

    <td width=60>&nbsp;</td>
    <td>
      <table height=100 cellSpacing=0 cellPadding=0 width="100%" border=0>

          <td style="FONT-WEIGHT: bold; FONT-SIZE: 16px"></td></tr>
        <tr>
          <td style="font-size:20pt;"><marquee onmouseover="this.stop()" onmouseout="this.start()" scrollamount="10" scrolldelay="100" behavior="slide" loop="1">欢迎使用危化品仓储物流信息管理系统！</marquee></td></tr></TABLE></td></tr>
  <tr>
    <td colSpan=3 height=10></td></tr></TABLE>
<table cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
  <tr height=20>
    <td></td></tr>
  <tr height=22>
    </tr>
  <tr bgColor=#ecf4fc height=12>
    <td></td></tr>
  <tr height=20>
    <td></td></tr></table>
  	</td>
  </tr>
  <tr>
    <td align="left">
    <table cellspacing=0 cellpadding=2 width="100%" align=center border=0 align="left">
  <tr>
    <td align=right width="20%">登陆帐号：</td>
    <td style="COLOR: #880000">${adminerId }</td></tr>
  <tr>
    <td align=right>真实姓名：</td>
    <td style="COLOR: #880000">${username }</td></tr>

    </table>
    
    </td>
  </tr>
</table>
</body>
</html>
