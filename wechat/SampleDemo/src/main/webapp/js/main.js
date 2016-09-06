$(document).ready(function() {
	/*鼠标点击和键盘点击事件监听,如果密码过期跳转到重设密码页面*/
	document.onmousedown=function(event){ 
		PasswordStatus();
	 };
	document.onmousemove=function(event){
		PasswordStatus();
	};
	document.onkeydown=function(event){ 
		PasswordStatus();
	 };
	 /*移动端监听*/
	 try{
		 document.addEventListener('touchstart', touchSatrt, false);  
	     document.addEventListener('touchmove', touchMove, false);  
	     document.addEventListener('touchend', touchEnd, false); 
	 }catch(e){
		 //alert("can not suport touch screen");
	 }
	  
});
function touchSatrt(evt){
	PasswordStatus();
}
function touchMove(evt){
	PasswordStatus();
}
function touchEnd(evt){
	PasswordStatus();
}
function PasswordStatus(){
	if($('.alert-block').length>0){
		toResetPassword();
	}
}

function trim(str){ //删除左右两端的空格
	return str.replace(/(^s*)|(s*$)/g, "");
}
function TurnToRegisterPage() {
    var openId=$("#openId").val();
   
    
	window.location.href = "../user/registerPage?openId="+openId;
};
var flagEmail = false;
function EmailCheck(email) {
	var pattern = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
	if (!pattern.test(email)) {
		$("#checkEmail").show();
		flagEmail = true;
	} else {
		$("#checkEmail").hide();
		flagEmail = false;
	}
};
	
var flagEmpId = false;
function EmpIdCheck(empId) {
	if (trim(empId) === "") {
		$("#checkEmpId").show();
		flagEmpId = true;
	} else {
		$("#checkEmpId").hide();
		flagEmpId = false;
	}
};


var flagPassword = false;
function PasswordCheck() {
	var pattern =  /^[0-9A-Za-z]{6,}$/;
	if(trim(pattern.test($("#password").val()))) {
		$("#checkPassword").hide();
		flagPassword = false;
	}else{
		$("#checkPassword").show();
		flagPassword = true;		
	}
};

var flagSubmit = false;
function Submit() {	
	if (trim($("#password").val()) !==  trim($("#repassword").val()) ) {
		$("#checkInfo").show();
		flagSubmit = true;
	} else {
		$("#checkInfo").hide();
		flagSubmit = false;
	}
	
};







