<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品入库信息</title>

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
	function f1(url){
	 document.myform.action=url;
    document.myform.submit();
	}
		function count(){
		var num = $("#num").val();
		num=num.trim();
		num=num*1;
		var money=$("#PSingleMoney").val();
		money=money*1;
		 $("#OAllMoney").val(money*num);
	}
		function cut(){
			var payMoney = $("#OPayMoney").val();
			var allMoney =$("#OAllMoney").val();
			payMoney=payMoney.trim();
			payMoney=payMoney*1;
			if(payMoney>allMoney){
			 $("#OPayMoney").val(allMoney);
			}else{
			 $("#nopay").val(allMoney-payMoney);
			}
		}
		function doSubmit(){
			var reg = /^([0-9]+)$/;
			var num = $("#num").val();
			var stoNum =$("#stoNum").val();
			num=num.trim();
			var payMoney = $("#OPayMoney").val();
			payMoney=payMoney.trim();
			if(num.length>0){
				if(!reg.test(num)){
					alert("请正确输入数量");
					return false;
				}
				num=num*1;
				stoNum=stoNum*1;
				
				if(num>stoNum){
					alert("商品数量不足，只有"+stoNum+",请重新输入");
					return false;
				}
				}else{
				alert("数量不能为空");
				return false;
				}
			if(payMoney.length>0){
				if(!reg.test(payMoney)){
				alert("请正确输入已付金额");
				}
				}else{
				alery("实付不能为空");
				return false;
				}
				count();
				cut();
				return true;
		}
	
</script>
  <%
  	 if(request.getAttribute("msg")!=null){%>
  	 	
  	 	<script type="text/javascript">
  	 	  alert('<%=request.getAttribute("msg")+""%>');
  	 	</script>
  	 <%}
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
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"> 商品退库信息  </span></td>
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
    <form action="addOrder?style=delete" name="myform" method="post" onsubmit="return doSubmit()">
    <input type="hidden" name="order.product.PId" value="${pro.PId}"/>
     <input type="hidden" name="order.OStyle" value="2"/>
     <input type="hidden" id="stoNum" value="${sto.SNum}"/>
   	<table border="0" width="80%" align="center" bgcolor="#ffeeff" cellspacing="4" >
		<tr>
			<td colspan="4">注：带<font color="red">*</font>号为必填项</td>
		</tr>
		<tr align="left">
			<td colspan="2">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<select  name="id" onchange="f1('selectProRetSto')" >
					<%if(request.getAttribute("type").equals("1")){
					 %>
					<option>请选择退库商品的商品名称</option>
					<s:iterator value="list" status="status">
						<option value="${product.PId}">${product.PName}</option>
					</s:iterator>
					<%}else if(!request.getAttribute("type").equals("1")){ %>
					<option value="${pro.PId}"><a>${pro.PName}(你当前的选择)</a></option>
					<s:iterator value="list" status="status">
						<option value="${PId}">${PName}</option>
					</s:iterator>
					<%} %>
				</select>	
			</td>
			<td>入库编号：	</td>
			<td><input type="text" value="${num}" disabled="disabled"/>
			<input type="hidden" name="order.ONumId" value="${num}"/>
			</td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品名称：&nbsp;	</td>
			<td>${pro.PName }</td>
			<td>简称：	</td>
			<td>${pro.PSName }</td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;规格：	</td>
			<td>${pro.PNorms }	</td>
			<td>包装：	</td>
			<td>${pro.PPackage }</td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;供应商全称：</td>
			<td>${pro.sup.supName }</td>
			<td>产地：	</td>
			<td>${pro.PAddress }</td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量：	</td>
			<td><input type="text" id="num" onblur="count()" name="order.ONum"/><font color="red">${sto.SNum!=null?"*商品最多":"*"}${sto.SNum}</font></td>
			<td>单价：	</td>
			<td><input type="hidden" id="PSingleMoney" value="${pro.PSingleMoney}"/>
			 ${pro.PSingleMoney}</td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;总价：	</td>
			<td><input type="text" id="OAllMoney"  name="order.OAllMoney" />（元）<font color="red">*</font></td>
			<td>实付：	</td>
			<td><input type="text" onblur="cut()" id="OPayMoney" name="order.OPayMoney"/></td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;未付：	</td>
			<td><input type="text" id="nopay" onblur="cut()"/>（元）<font color="red">*</font></td>
			<td>操作员：	</td>
			<td><input type="text" value="${username}" disabled="disabled" />
				<input type="hidden"   name="order.OAdminerId" value="${username}" />
				</td>
		</tr>
		<tr align="left">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;入库日期：	</td>
			<td><input type="text"  value="${date}" disabled="disabled"/>
				<input type="hidden" name="order.ODate" value="${date}" />
			</td>
			<td>结算方式：</td>
			<td>
				<select name="order.OPayStyle">
					<option value="1" >现金</option>
					<option value="2">信用卡</option>
				</select>
			
			</td>
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
