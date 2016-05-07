<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="/struts-tags"  prefix="s"%>
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
	
	function f1(url){
		if(confirm("确认操作吗？")==true){
	 		document.myform.action=url;
    		document.myform.submit();
   	 }
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
			
			var remark=$("#remark").val();
			remark=remark.trim();

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

			if(remark.length>0){
				$("#msg9").html("");
				}else{
				$("#msg9").html("不能为空");
				return false;
			}
			
			if(confirm("确认操作吗？")!=true){
			return false;}
	 		document.myform.action='updatePro';
    		document.myform.submit();
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
                <td width="94%" valign="bottom"><span class="STYLE1"> 商品信息登记  </span></td>
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
    <form action="" name="myform" method="post">
    <input type="hidden" name="pro.PId" value="${pro.PId }"/>
   <table border="0" width="80%" align="center" bgcolor="#ffeeff" cellspacing="4">
		<tr>
			<td colspan="4">注：带<font color="red">*</font>号为必填项</td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品名称：	</td>
			<td><input type="text"  value="${pro.PName}"  disabled="disabled"/>
			<input type="hidden" name="pro.PName" value="${pro.PName}"/>
			<font color="red">*</font><span id="msg1"></span></td>
			<td>简称：	</td>
			<td><input type="text" name="pro.PSName" value="${pro.PSName}" id="PSName"/><span id="msg2"></span></td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产地：	</td>
			<td><input type="text"  name="pro.PAddress" value="${pro.PAddress}" id="PAddress"/><font color="red">*</font><span id="msg3"></span></td>
			<td>批号：	</td>
			<td><input type="text"  name="pro.PNum" value="${pro.PNum}" id="PNum"/><span id="msg4"></span></td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;规格：	</td>
			<td><input type="text"  name="pro.PNorms" value="${pro.PNorms}" id="PNorms"/><font color="red">*</font><span id="msg5"></span></td>
			<td>包装：	</td>
			<td><select name="pro.PPackage">
				<option ${pro.PPackage=="no"?"selected='selected'":"" } value="no">无包装</option>
				<option ${pro.PPackage=="yes"?"selected='selected'":"" } value="yes">有包装</option>
			</select></td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;计量单位：	</td>
			<td><input type="text"  name="pro.PUnit"  value="${pro.PUnit}" id="PUnit"/><font color="red">*</font><span id="msg6"></span></td>
			<td>批准文号：	</td>
			<td><input type="text"  name="pro.PPassNum"  value="${pro.PPassNum}" id="PPassNum"/><span id="msg7"></span></td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;供应商全称：	</td>
			<td>
					<select  name="pro.sup.supId">
						 <s:iterator value="list">
							<option ${pro.sup.supId== supId ?"selected='selected'":""} value="${supId}">${supName}</option>
							</s:iterator> 

								</select>
				<font color="red">*</font></td>
				<td>单价：	</td>
				<td><input type="text"  name="pro.PSingleMoney" value="${pro.PSingleMoney}" id="PSingleMoney"/></td>
				</tr><tr>
			<td>备注：	</td>
			<td><input type="text"  name="pro.remark" value="${pro.remark}" id="remark"/><span id="msg9"></span></td>
		</tr>
		
		<tr align="center">
			<td></td>
			<td><input type="button" value="修改" onclick="return f3(); "/></td>
			<td><input type="button" value="删除" onclick="f1('deletePro?id=${pro.PId}')"/></td>
			<td><input type="button" value="返回" onclick="f1('findAllPro')"/></td>
			<td></td>
		</tr>
   </table>
   </form>
    </td>
  </tr>
</table>
</body>
</html>
