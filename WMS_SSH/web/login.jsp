<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="java.util.Date"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 

1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-

transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>危化品仓储物流信息管理系统</title>
	<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
	<link rel="stylesheet" type="text/css" href="<%=basePath %>css/style.css"/>
<script type="text/javascript" src="<%=basePath %>js/jquery.js"></script>
<script type="text/javascript">
	function to(url){
	document.myform.action=url;
    document.myform.submit();
	}
	function f1(){
		var user=$("#user").val();
		user = user.trim();
		var pwd = $("#pwd").val();
		pwd = pwd.trim();
		if(user.length>0){
			if(pwd.length>0){
				$("#ms").html("");
			}else{
				$("#ms").html("密码不能为空");
				return false;
			}
		}else{
			$("#ms").html("用户名不能为空");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div id="top"> </div>
	<form id="login" name="myform" action="login" method="post" onsubmit="return f1();">
  <div id="center">
    <div id="center_left"></div>
    <div id="center_middle">
    
  <div class="user">
        <label>用户名：
        <input type="text" name="adminer.AIdcard" id="user" />
        </label>
      </div>

       <div class="user">
        <label>密　码：
        <input type="password" name="adminer.APwd" id="pwd" />
        </label>
      </div>
      <font color="red" size="2"><span id="ms">${loginmsg==null?"":loginmsg}</span></font>
    </div>
    <div id="center_middle_right"></div>
    <div id="center_submit">
      <div class="button" id="login_button">
      <br/>
      <a onclick="to('login')"><img src="images/dl.gif"/></a>
       </div>
    </div>
    <div id="center_right"></div>
  </div>
</form>
<div id="footer"></div>
</body>
</html>
