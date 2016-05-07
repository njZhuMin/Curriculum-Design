<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>供应商信息管理</title>

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
-->
</style>
<script  type="text/javascript" src="js/jquery.js" ></script>
<script type="text/javascript">
		var hasNamed = "no";
		function hasif(supName){
		supName=supName.trim();
	$("#supName").val(supName);
	if(supName.length>0){
			$.ajax({
				"url":"findIs1",
				"type":"post",
				"data":{"supName":supName},
				"dataType":"json",
				"success":function(data){
					if(data){
						$("#msg1").html("<font color = green size='2'>可以使用</font>");
						hasNamed = "yes" ;	
					}else{
						$("#msg1").html("<font color = red size = '2'>不能使用！</font>");
						hasNamed = "no" ;
					}
				},
				"error":function(){
					alert("出错了");
					hasNamed = "no" ;
				},
			});
			}else{
				$("#msg1").html("<font color = red size='2'>不能为空</font>");
				hasNamed = "no" ;
			}
		}
		
		function f1(){
			var supSName = $("#supSName").val();
			supSName = supSName.trim();
			$("#supSName").val(supSName);
			
			var supAddress = $("#supAddress").val();
			supAddress = supAddress.trim();
			$("#supAddress").val(supAddress);
			
			var supEncoding = $("#supEncoding").val();
			supEncoding = supEncoding.trim();
			$("#supEncoding").val(supEncoding);
			
			var supTel = $("#supTel").val();
			supTel = supTel.trim();
			$("#supTel").val(supTel);
			
			var supFax = $("#supFax").val();
			supFax = supFax.trim();
			$("#supFax").val(supFax);
			
			var supPeople = $("#supPeople").val();
			supPeople = supPeople.trim();
			$("#supPeople").val(supPeople);
			
			var supPTel = $("#supPTel").val();
			supPTel = supPTel.trim();
			$("#supPTel").val(supPTel);
			
			var supEmail = $("#supEmail").val();
			supEmail = supEmail.trim();
			$("#supEmail").val(supEmail);
			
			var supBank = $("#supBank").val();
			supBank = supBank.trim();
			$("#supBank").val(supBank);
			
			if(hasNamed == "no" ){
				return false;
			}
			if(supSName.length>0){
				$("#msg2").html("");
			}else{
				$("#msg2").html("<font color = red size = '2'>不能为空！</font>");
				return false;
			}
			if(supAddress.length>0){
				$("#msg3").html("");
			}else{
				$("#msg3").html("<font color = red size = '2'>不能为空！</font>");
				return false;
			}
			if(supEncoding.length>0){
				var re= /^[1-9][0-9]{5}$/
				if(re.test(supEncoding)){
					$("#msg4").html("");
				}else{
					$("#msg4").html("<font color = red size = '2'>请输入6位邮编</font>");
					return false;
				}
			}else{
				$("#msg4").html("<font color = red size = '2'>不能为空！</font>");
				return false;
			}
			if(supTel.length>0){
				var phoneRegWithArea = /^[0][1-9]{2,3}-[0-9]{5,11}$/; 
			var phoneRegNoArea = /^[1-9]{1}[0-9]{5,8}$/; 
				if(phoneRegWithArea.test(supTel)||phoneRegNoArea.test(supTel)){
			 		$("#msg5").html("");
			   }else{
					$("#msg5").html("<font color = red size = '2'>请正确输入格式</font>");
					return false ;
			 	}
			}else{
				$("#msg5").html("<font color = red size = '2'>不能为空！</font>");
				return false;
			}
			if(supFax.length>0){
				var phoneRegWithArea = /^[0][1-9]{2,3}-[0-9]{5,10}$/; 
			var phoneRegNoArea = /^[1-9]{1}[0-9]{5,8}$/; 
				var pattern =/^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
				if(pattern.test(supFax)){
					$("#msg6").html("");
				}else{
					$("#msg6").html("<font color = red size = '2'>请正确输入格式</font>");
					return false;
				}
			}else{
				$("#msg6").html("<font color = red size = '2'>不能为空！</font>");
				return false;
			}
			if(supPeople.length>0){
				$("#msg7").html("");
			}else{
				$("#msg7").html("<font color = red size = '2'>不能为空！</font>");
				return false;
			}
			if(supPTel.length>0){
				var pattern =/^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
				var regu =/^[1][3][0-9]{9}$/; 
				var re = new RegExp(regu); 
				if(pattern.test(supPTel)||re.test(supPTel)){
					$("#msg8").html("");
				}else{
					$("#msg8").html("<font color = red size = '2'>请正确输入格式</font>");
					return false;
				}
			}else{
				$("#msg8").html("<font color = red size = '2'>不能为空！</font>");
				return false;
			}
			if(supEmail.length>0){
				var emailReg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
				if(emailReg.test(supEmail)) {
					$("#msg9").html("");
				}else{
					$("#msg9").html("<font color = red size = '2'>请正确输入格式</font>");
					return false;
				}
			}else{
				$("#msg9").html("<font color = red size = '2'>不能为空！</font>");
				return false;
			}
			if(supBank.length>0){
				$("#msg10").html("");
			}else{
				$("#msg10").html("<font color = red size = '2'>不能为空！</font>");
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
        <td height="24" bgcolor="#353c44">
         <form action="getSupXml" method="post" enctype="multipart/form-data">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"> 供应商信息登记  </span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
             
				<input type="file" name="supXml"/>
				<input type="submit"/>
			 </span><span class="STYLE1"> &nbsp;</span></div></td>
          </tr>
        </table>
        </form>
        </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>
    <form action="addSup" method="post" onsubmit="return f1();">
   	<table border="0" width="80%" align="center" bgcolor="#ffeeff" cellspacing="4">
		<tr>
			<td colspan="4">注：带<font color="red">*</font>号为必填项</td>
		</tr>
		<tr align="left">
			<td width="15%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;供应商全称：	</td>
			<td width="35%"><input type="text" name="sup.supName" id="supName" onblur="hasif(this.value)"/><font color="red">*</font><span id="msg1"></span></td>
			<td width="15%">简称：	</td>
			<td width="35%"><input type="text" name="sup.supSName" id="supSName"/><span id="msg2"></span></td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地址：	</td>
			<td><input type="text" name="sup.supAddress" id="supAddress"/><font color="red">*</font><span id="msg3"></span></td>
			<td>邮政编码：	</td>
			<td><input type="text" name="sup.supEncoding" id="supEncoding"/><span id="msg4"></span></td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：	</td>
			<td><input type="text" name="sup.supTel" id="supTel"/><font color="red">*</font><span id="msg5"></span></td>
			<td>传真：	</td>
			<td><input type="text" name="sup.supFax" id="supFax"/><span id="msg6"></span></td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系人：	</td>
			<td><input type="text" name="sup.supPeople" id="supPeople"/><font color="red">*</font><span id="msg7"></span></td>
			<td>联系人电话：	</td>
			<td><input type="text" name="sup.supPTel" id="supPTel"/><span id="msg8"></span></td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;E-Mail：	</td>
			<td><input type="text" name="sup.supEmail" id="supEmail"/><span id="msg9"></span></td>
			<td>开户银行：	</td>
			<td><input type="text" name="sup.supBank" id="supBank"/><span id="msg10"></span></td>
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
