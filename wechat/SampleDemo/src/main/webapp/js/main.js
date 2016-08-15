$(document).ready(function() {

});
function trim(str){ //删除左右两端的空格
	return str.replace(/(^s*)|(s*$)/g, "");
}
function TurnToRegisterPage() {
    var openId=$("#openId").val();
    //alert(openId);
    
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



//function Register(){
//	if(flagEmail||flagEmpId||flagPassword||flagSubmit){
//		alert("Please enter right information");
//		
//	}else{
//		if(trim($("#email")).val()===""){
//			$("#checkEmail").show();
//		}else if(trim($("#empId").val())===""){
//			$("#checkEmpId").show();
//		}else if(trim($("#password").val())===""){
//			$("#checkPassword").show();
//		}else if(trim($("#repassword").val())===""){
//			$("#checkInfo").show();
//		}else{			
//			$("#myform").submit();			
//		}
//	}
//}





