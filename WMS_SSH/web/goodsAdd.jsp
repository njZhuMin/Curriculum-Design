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
<title>商品信息管理</title>

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
	function ifused(PName){
			var PName=PName.trim();
			if(PName.length>0){
			$.ajax({
				"url":"<%=basePath%>isUsed",
				"type":"post",
				"data":{"name":PName},
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
	
	
	function f2(url){
	 document.myform1.action=url;
    document.myform1.submit();
	}
	
	function f3(){
			
			var PSName=$("#PSName").val().trim();
			PSName=PSName.trim();
			var PAddress=$("#PAddress").val();
			PAddress=PAddress.trim();
			var PNum=$("#PNum").val();
			PNum=PNum.trim();
			var PNorms=$("#PNorms").val();
			PNorms=PNorms.trim();
			var PUnit=$("#PUnit").val();
			PUnit=PUnit.trim();
			var PPassNum=$("#PPassNum").val();
			PPassNum=PPassNum.trim();
			var PSingleMoney=$("#PSingleMoney").val();
			PSingleMoney=PSingleMoney.trim();
			var remark=$("#remark").val();
			remark=remark.trim();
			
			if(IsNameExist=="no"){
				return false;
			}
			if(PSName.length>0){
				$("#msg2").html("");
				}else{
				$("#msg2").html("不能为空");
				return false;
			}
			if(PAddress.length>0){
				$("#msg3").html("");
				}else{
				$("#msg3").html("不能为空");
				return false;
			}
			if(PNum.length>0){
				$("#msg4").html("");
				}else{
				$("#msg4").html("不能为空");
				return false;
			}
			if(PNorms.length>0){
				$("#msg5").html("");
				}else{
				$("#msg5").html("不能为空");
				return false;
			}
			if(PUnit.length>0){
				$("#msg6").html("");
				}else{
				$("#msg6").html("不能为空");
				return false;
			}
			if(PPassNum.length>0){
				$("#msg7").html("");
				}else{
				$("#msg7").html("不能为空");
				return false;
			}
				if(PSingleMoney.length>0){
				var num = /^([0-9]+)$/;
				if(!num.test(PSingleMoney)){
				$("#msg8").html("请正确输入");
				return false ;
			   }else{
			 $("#msg8").html("");
			 }
			 }else{
			 $("#msg8").html("不能为空");
			 return false;
			 }
			if(remark.length>0){
				$("#msg9").html("");
				}else{
				$("#msg9").html("不能为空");
				return false;
			}
			
			
			if(confirm("确认操作吗？")!=true){
			return false;}
	 		
 			return true; 
			
		}
		
</script>
</head>

<body>
   <%
  	 if(request.getAttribute("msg")!=null){
  	 %>
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
        <form action="getProXml" method="post" enctype="multipart/form-data">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
            <td><table width="100%"border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"> 商品信息登记  </span></td>
              </tr>
             </table><td>	<div align="right"><span class="STYLE1">
				<input type="file" name="proxml"/>
				<input type="submit"/>
			</span><span class="STYLE1"> &nbsp;</span></div>
              	</td>
              
              </tr>
            </table>
            </form>
            </td>
            <td>
            
            </td>
          </tr>
        </table>
        	</td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td>
    <form action="addPro" name="myform" method="post" onsubmit="return f3();">
   <table border="0" width="80%" align="center" bgcolor="#ffeeff" cellspacing="4">
		<tr>
			<td colspan="4">注：带<font color="red">*</font>号为必填项</td>
		</tr>
		<tr align="left">
			<td width="15%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品名称：	</td>
			<td width="35%"><input type="text" name="pro.PName" id="PName" onblur="ifused(this.value);"/><font color="red">*</font><span id="msg1"></span></td>
			<td width="15%">简称：	</td>
			<td width="35%"><input type="text" name="pro.PSName" id="PSName" /><span id="msg2"></span></td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产地：	</td>
			<td><input type="text"  name="pro.PAddress" id="PAddress"/><font color="red">*</font><span id="msg3"></span></td>
			<td>批号：	</td>
			<td><input type="text"  name="pro.PNum" id="PNum"/><span id="msg4"></span></td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;规格：	</td>
			<td><input type="text"  name="pro.PNorms" id="PNorms"/><font color="red">*</font><span id="msg5"></span></td>
			<td>包装：	</td>
			<td><select name="pro.PPackage">
				<option value="no">无包装</option>
				<option value="yes">有包装</option>
			</select></td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;计量单位：	</td>
			<td><input type="text"  name="pro.PUnit" id="PUnit"/><font color="red">*</font><span id="msg6"></span></td>
			<td>批准文号：	</td>
			<td><input type="text"  name="pro.PPassNum" id="PPassNum"/><span id="msg7"></span></td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;供应商全称：	</td>
			<td>
					<select  name="pro.sup.supId">
						<s:iterator value="list">
							<option value="${supId }">
								${supName }
								</option>
							</s:iterator> 

								</select>
				<font color="red">*</font></td>
			<td>单价：	</td>
			<td><input type="text"  name="pro.PSingleMoney" id="PSingleMoney"/><span id="msg8"></span></td>
		</tr>
		<tr align="left"><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;备注：</td><td> <input type="text" name="pro.remark" id="remark"/><span id="msg9"></span></td></tr>
		
		<tr align="center">
			<td></td>
			<td><input type="submit" value="保存信息" /></td>
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
