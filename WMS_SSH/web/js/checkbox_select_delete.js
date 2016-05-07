function checkAllChange(){
	if($("#checkbox11").attr("checked")){
		$(".AA").attr("checked",true);
	}else{
		$(".AA").attr("checked",false);
	}
	function deleteAll(){
		if($(".AA").attr("checked")){
			
		}
	}
}
function checkdeleteAll(){
	var dc=document.getElementsByName("checkbox2");
	var str="";
	alert(dc.length);
	for(var i=0;i<dc.length;i++){
		if($(dc[i].checked==true)){
			str=dc[i].value;
			if(str!=""){
				window.location="applydelete.action?id="+str;
			}
		}
	}
}