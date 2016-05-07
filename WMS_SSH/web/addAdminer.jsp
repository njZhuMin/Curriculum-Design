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
<title>用户基本设置</title>

	<script type="text/javascript" src="<%=basePath%>js/jquery-1.4.3.js"></script>
	<script type="text/javascript"></script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
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
function hasif(idCard){
			var idCard=idCard.trim();
			$("#idCard").val(idCard);
			if(idCard.length>0){
			$.ajax({
				"url":"<%=basePath%>isHasAdminer",
				"type":"post",
				"data":{"idCard":idCard},
				"dataType":"json",
				"success":function(data){
							if (data ==true) {
								$("#msg1").html("<font color = green size = '2'>可以使用！</font>");
								IsNameExist = "yes" ;
							} else{
								$("#msg1").html("<font color = red size = '2'>不能使用！</font>");
								IsNameExist = "no" ;
							}
												},
					"error":function(){
						alert("错误");
									}
					});
					}else{
					$("#msg1").html("不能为空");
					IsNameExist = "no" ;
					}
			}
	function point(){
				
				var name=$("#name").val();
      			var pwd=$("#pwd").val();
				var ifpwd=$("#ifpwd").val();
				name=name.trim();
				pwd=pwd.trim();
				ifpwd=ifpwd.trim();
				var idCard=$("#idCard").val();
				 if(idCard.length>0){
			     }else{
			     $("#msg1").html("不能为空");
			     return false;
			     }
			     
				if(IsNameExist=="no"){
				return false;
				}
				if(name.length>0){
				$("#msg3").html("");
				}else{
				$("#msg3").html("不能为空");
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
		<%
			if (request.getAttribute("msg") != null) {
		%>

		<script type="text/javascript">
alert('<%=request.getAttribute("msg") + ""%>');
</script>
		<%
			}
		%>
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
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="<%=basePath%>images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"> 用户基本设置  </span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
             <a style="cursor: pointer;color: yellow;" href="#" ><img  src="<%=basePath%>images/edit.gif" width="10" height="10" /> 退出系统;</a> </span><span class="STYLE1"> &nbsp;</span></div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>
    <form action="addOperator" method="post" onsubmit="return point()">
   	<table border="0" width="40%" align="center" bgcolor="#ffeeff" cellspacing="4">
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;帐号：	</td>
			<td><input type="text" name="adminer.AIdcard" id="idCard" onblur="hasif(this.value)"/></td>
			<td><span id="msg1"></span></td>
		</tr>
		<tr><td colspan="2"><span id="msg1"></span></td></tr>
		<tr align="left">
			<td width="30%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作员姓名：	</td>
			<td width="50%"><input type="text" name="adminer.AName" id="name"/>	</td>
			<td width="20%"><span id="msg3"></span></td>
		
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码：	</td>
			<td><input type="text" name="adminer.APwd" id="pwd"/></td><td>
			<span id="msg22"></span></td>
			
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;确认新密码：	</td>
			<td><input type="text" name="" id="ifpwd"/> </td><td>
			<font color="red"><span id="msg2"></span></font></td>
			
		</tr>
		
		<tr align="center">
			<td><input type="submit" value="确认注册"/></td>
			<td><input type="reset" value="重新填写"/></td>
  
		</tr>
   </table>
   </form>
    </td>
  </tr>
</table>
</body>
</html>
