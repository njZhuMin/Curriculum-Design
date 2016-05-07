$(function(){
	var flag=false;
	
	$("#user").blur(function(){
		$("#errInfo").html("<img src='images/window_loading.gif'></img>正在检测......！'></img>");
		var name=$("#user").val();
		if(name==""){
			$("#errInfo").html("<img src='images/wrong.gif'></img>用户帐号不能为空！");
			flag=false;
			return false;
		}
		flag=true;
		$("#errInfo").html("<img src='images/right.gif'></img>用户帐号格式可用");
	});
	$("#pwd").blur(function(){
		$("#errInfo").html("<img src='images/window_loading.gif'></img>正在检测......");
		var pwd=$("#pwd").val();
		if(pwd==""){
			$("#errInfo").html("<img src='images/wrong.gif'></img>密码不能为空！");
			flag=false;
			return false;
		}
		flag=true;
		$("#errInfo").html("<img src='images/right.gif'></img>密码格式可用");
	});
	
	
	$("#chknumber").blur(function(){ 
			$("#errInfo").html("<img src='images/window_loading.gif'></img>正在检测......！");
			var txt = $("#chknumber").val();
			if(txt==""){
				$("#errInfo").html("<img src='images/wrong.gif'></img>验证码不能为空");
				flag=false;
				return false;
			}else{
				$.post(
					"valid.action?dt="+new Date().getTime(),
					{"code":txt},
					function(data){
						if(data.ok){
							$("#errInfo").html("<img src='images/right.gif'></img>验证码正确！");
								flag=true;
						}else{
							$("#errInfo").html("<img src='images/wrong.gif'></img>验证码错误!");
								flag=false;
						}
					},
					"json"
				);
			}
	});
	
	
	
	$("#login").submit(function(){
		
		var a=$("#pwd").blur();
		var b=$("#user").blur();
		var c=$("#chknumber").blur();
		alert(flag);
		if(!flag){
			return false;
		}
	});
	$("#login_button").click(function(){
		$("#login").submit();
	});
	$("#reset").click(function(){
		$("#login").reset();
	});
	
});