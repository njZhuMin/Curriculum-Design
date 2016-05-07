<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户信息管理</title>

<style type="text/css">
<!--
body {
	font-size : 12px;
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
-->
</style>
<script  type="text/javascript" src="js/jquery.js" ></script>
<script type="text/javascript">

function hasif(name){
	name=name.trim();
	$("#name").val(name);
	if(name.length>0){
	$.ajax({
	"url":"findIs",
	"type":"post",
	"data":{"name":name},
	"dataType":"json",
	"success":function(flag){
				if (flag) {
					$("#msg1").html("<font color = green size = '2'>可以使用！</font>");
				} else{
					$("#msg1").html("<font color = red size = '2'>不能使用！</font>");
				}
									},
	"error":function(){
		
			alert("错误");
						}
		});
		}else{
		$("#msg1").html("<font color = red size = '2'>不能为空</font>");
		}
	}
	
function f2(){
			var name=$("#name").val();
			name=name.trim();
			

			
			var tel=$("#tel").val();
			tel=tel.trim();
			$("#tel").val(tel);
			
			var address=$("#address").val();
			address=address.trim();
			$("#address").val(address);
			
			var clientemail =$("#clientemail").val();
			clientemail = clientemail.trim();
			$("clientemail").val(clientemail);
			
			var encoding =$("#encoding").val();
			encoding = encoding.trim();
			$("encoding").val(encoding);
			
			var fax =$("#fax").val();
			fax = fax.trim();
			$("fax").val(fax);
			
			var PTel =$("#PTel").val();
			PTel = PTel.trim();
			$("PTel").val(PTel);
			
			var bankNum =$("#bankNum").val();
			bankNum = bankNum.trim();
			$("bankNum").val(bankNum);
			
			if(hasNamed == "no" ){
				return false;
			}
			if(name.length>0){
				$("#msg1").html("");
				}else{
				$("#msg1").html("<font color = red size = '2'>不能为空！</font>");
				return false;
			}
			if(address.length>0){
				$("#msg2").html("");
				}else{
				$("#msg2").html("<font color = red size = '2'>不能为空！</font>");
				return false;
			}
			
			if(tel.length>0){
			var phoneRegWithArea = /^[0][1-9]{2,3}-[0-9]{5,10}$/; 
			var phoneRegNoArea = /^[1-9]{1}[0-9]{5,8}$/; 
				if(phoneRegWithArea.test(tel)||phoneRegNoArea.test(tel)){
			 		$("#msg3").html("");
			   }else{
					$("#msg3").html("<font color = red size = '2'>请正确输入格式</font>");
					return false ;
			 	}
			 }else{
			 	$("#msg3").html("<font color = red size = '2'>不能为空！</font>");
			 	return false;
			 }

			if(clientemail.length>0){
				var emailReg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
				if(emailReg.test(clientemail)) {
					$("#msg5").html("");
				}else{
					$("#msg5").html("<font color = red size = '2'>请正确输入格式</font>");
					return false;
				}
			}else{
				$("#msg5").html("<font color = red size = '2'>不能为空！</font>");
				return false;
			}
			if(encoding.length>0){
				var re= /^[1-9][0-9]{5}$/
				if(re.test(encoding)){
					$("#msg6").html("");
				}else{
					$("#msg6").html("<font color = red size = '2'>请输入6位邮编</font>");
					return false;
				}
			}else{
				$("#msg6").html("<font color = red size = '2'>不能为空！</font>");
				return false;
			}
			if(fax.length>0){
				var pattern =/^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
				if(pattern.test(fax)){
					$("#msg7").html("");
				}else{
					$("#msg7").html("<font color = red size = '2'>请正确输入格式</font>");
					return false;
				}
			}else{
				$("#msg7").html("<font color = red size = '2'>不能为空！</font>");
				return false;
			}
			if(PTel.length>0){
				var pattern =/^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
				var regu =/^[1][3][0-9]{9}$/; 
				var re = new RegExp(regu); 
				if(pattern.test(PTel)||re.test(PTel)){
					$("#msg8").html("");
				}else{
					$("#msg8").html("<font color = red size = '2'>请正确输入格式</font>");
					return false;
				}
			}else{
				$("#msg8").html("<font color = red size = '2'>不能为空！</font>");
				return false;
			}
			if(bankNum.length>0){
					$("#msg9").html("");
			}else{
				$("#msg9").html("<font color = red size = '2'>不能为空！</font>");
				return false;
			}
			return true;
			
			
			
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
                <td width="94%" valign="bottom"><span class="STYLE1"> 客户信息登记  </span></td>
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
    <form action="addClient" method="post" onsubmit="return f2()">
   <table border="0" width="80%" align="center" bgcolor="#ffeeff" cellspacing="4">
		<tr>
			<td colspan="4">注：带<font color="red">*</font>号为必填项</td>
		</tr>
		<tr align="left">
			<td width="15%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客户全称：	</td>
			<td width="35%"><input type="text" name="client.name" id="name" onblur="hasif(this.value)"/><font color="red">*</font><span id="msg1"></span></td>
			<td width="15%">客户简称：	</td>
			<td width="35%"><input type="text" name="client.SName"/></td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地址：	</td>
			<td><input type="text" name="client.address" id="address"/><font color="red">*</font><span id="msg2"></span></td>
			<td>邮政编码：	</td>
			<td><input type="text" name="client.encoding" id="encoding"/><span id="msg6"></span></td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：	</td>
			<td><input type="text" name="client.tel" id="tel"/><font color="red">*</font><span id="msg3"></span></td>
			<td>传真：	</td>
			<td><input type="text" name="client.fax" id="fax"/><span id="msg7"></span></td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系人：	</td>
			<td><input type="text" name="client.PName" id="pname"/><font color="red">*</font><span id="msg4"></span></td>
			<td>联系人电话：	</td>
			<td><input type="text" name="client.PTel" id="PTel"/><span id="msg8"></span></td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;E-Mail：	</td>
			<td><input type="text" name="clientemail" id="clientemail"/><span id="msg5"></span></td>
			<td>开户银行：	</td>
			<td><input type="text" name="client.bank"/></td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;银行账号：	</td>
			<td><input type="text" name="client.bankNum" id="bankNum"/><span id="msg9"></span></td>
			<td></td>
			<td></td>
		</tr>
		<tr align="center">
			<td></td>
			<td><input type="submit" value="保存信息"/></td>
			<td><input type="reset" value="清除重置"/></td>
			<td></td>
		</tr>
   </table>
   </form>
    </td>
  </tr>
</table>
</body>
</html>
