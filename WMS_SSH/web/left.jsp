<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/chili-1.7.pack.js"></script>
<script type="text/javascript" src="js/jquery.easing.js"></script>
<script type="text/javascript" src="js/jquery.dimensions.js"></script>
<script type="text/javascript" src="js/jquery.accordion.js"></script>
<style type="text/css">
<!--
body {
	margin:0px;
	padding:0px;
	font-size: 12px;
}
#text{
	font-size:16px;
	font-weight:bold;

}
#navigation {
	margin:0px;
	padding:0px;
	width:147px;
}
#navigation a.head {
	cursor:pointer;
	background:url(images/main_34.gif) no-repeat scroll;
	display:block;
	font-weight:bold;
	margin:0px;
	padding:5px 0 5px;
	text-align:center;
	font-size:12px;
	text-decoration:none;
}
#navigation ul {
	border-width:0px;
	margin:0px;
	padding:0px;
	text-indent:0px;
}
#navigation li {
	list-style:none; display:inline;
}
#navigation li li a {
	display:block;
	font-size:12px;
	text-decoration: none;
	text-align:center;
	padding:3px;
}
#navigation li li a:hover {
	background:url(images/tab_bg.gif) repeat-x;
		border:solid 1px #adb9c2;
}
-->
</style>
</head>
<body>
<div  style="height:100%;">
   <div id="text">基本信息管理</div> 
  <ul id="navigation">
    <li> <a class="head">客户信息管理</a>
      <ul>
        <li><a href="${style==1?'companyInfo_right.jsp':'javascript:void(0)'}" onclick="${style==1?'':'tishi()'}" target="rightFrame">添加</a></li>
        <li><a href="${style==1?'findAllClient?type=admin':'javascript:void(0)'}" onclick="${style==1?'':'tishi()'}" target="rightFrame">查看</a></li>
      </ul>
    </li>
    <li> <a class="head">商品信息管理</a>
      <ul>
        <li><a href="${style==1?'findAllSupToPro':'javascript:void(0)'}" onclick="${style==1?'':'tishi()'}" target="rightFrame">添加</a></li>
        <li><a href="${style==1?'findAllPro?type=admin':'javascript:void(0)'}" onclick="${style==1?'':'tishi()'}" target="rightFrame">查看</a></li>
      </ul>
    </li>
    
    <li> <a class="head">供应商信息管理</a>
      <ul>
        <li><a href="${style==1?'supplierInfo_right.jsp':'javascript:void(0)'}" onclick="${style==1?'':'tishi()'}" target="rightFrame">
        添加</a></li>
        <li><a href="${style==1?'findAllSup':'javascript:void(0)'}" onclick="${style==1?'':'tishi()'}" target="rightFrame">
       查看</a></li>
      </ul>
    </li>
     <li> <a class="head">订单信息查询</a>
      <ul>
        <li><a href="${style==1?'findAllOrderIn':'javascript:void(0)'}" onclick="${style==1?'':'tishi()'}" target="rightFrame">入库订单</a></li>
        <li><a href="${style==1?'findAllOrderRe':'javascript:void(0)'}" onclick="${style==1?'':'tishi()'}" target="rightFrame">退库订单</a></li>
      </ul>
    </li>
    <li> <a class="head">商品信息查询</a>
      <ul>
        <li><a href="findAllOption?key=client" target="rightFrame">查看</a></li>
      </ul>
    </li>
    <li> <a class="head">客户信息查询</a>
      <ul>
        <li><a href="findAllClientOption?key=name" target="rightFrame">查看</a></li>
      </ul>
    </li>
    <li> <a class="head">供应商信息查询</a>
      <ul>
        <li><a href="findAllSupOption?key=name" target="rightFrame">查看</a></li>
      </ul>
    </li>

    <div id="text"> 库存管理</div> 
    <li> <a class="head">商品入库</a>
      <ul>
        <li><a href="findAllProTuSt?type=find" target="rightFrame">查看</a></li>
      </ul>
    </li>
    <li> <a class="head">商品退货</a>
      <ul>
        <li><a href="findStoProTuSt?type=find" target="rightFrame">查看</a></li>
      </ul>
    </li>
    <li> <a class="head">库存查询</a>
      <ul>
        <li><a href="findProInSto" target="rightFrame">查看</a></li>
      </ul>
    </li>

     <div id="text">系统设置</div> 
    <li> <a class="head">操作员管理</a>
      <ul>
        <li><a href="${style==1?'addAdminer.jsp':'javascript:void(0)'}" onclick="${style==1?'':'tishi()'}" target="rightFrame">添加操作员</a></li>
      </ul>
    </li>
    <li> <a class="head">个人密码修改</a>
      <ul>
        <li><a href="changePassword_right.jsp" target="rightFrame">修改</a></li>
      </ul>
    </li>
     <li> <a class="head">退出系统</a>
      <ul>
       <li><a href="login.jsp" target="_top">退出</a></li>
      </ul>
    </li>
  </ul>
</div>


</body>
</html>
