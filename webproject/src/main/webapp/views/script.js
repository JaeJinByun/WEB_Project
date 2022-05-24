//메인페이지
var idstr = "아이디를 입력하세요.";
var passwdstr = "비밀번호를 입력하세요.";
var repasswdstr = "비밀번호가 다릅니다."
var emailstr = "이메일을 입력하세요.";
var telstr   = "전화번호를 입력하세요.";
var confirmstr = "아이디중복 확인을 해주세요";
var inputerror = "회원가입에 실패했습니다.\n 잠시 후 다시 시도하세요.";
var list = null;
var iderror = "입력하신 아이디가 없습니다.\n 다시확인하세요.";
var passwderror = "입력하신 비밀번호가 다릅니다.\n 다시 확인하세요.";
var deleteerror = "회원탈퇴에 실패했습니다.\n 잠시후 다시 시도하세요.";
var modifyerror = "회원정보 수정에 실패했습니다.\n 잠시후 다시 시도해주세요.";

function erroralert(msg) {
	alert(msg);
	history.back();
}

//아이디중복확인 
function confirmid(){	
	if(! id.value ){
		alert(idstr);
		id.focus();
	}else{
		url = "confirmid.do?id="+inputform.id.value;
		open(url,"confirm", "scrollbar=no, memubar=no, status=no, width=400, height=200" );	
	}
}
//아이디 중복확인창 확인버튼
function setid(id){
	opener.document.inputform.id.value = id;
	window.close();
	opener.document.inputform.confirm.value = "1";
}

//회원가입  - 가입 버튼 
function inputcheck(){
	if( !inputform.sign_up_id.value ){
		alert(idstr);
		inputform.sign_up_id.focus();
		return false;
	}else if( !inputform.email.value ){
		alert(emailstr);
		inputform.email.focus();
		return false;
	}else if( !inputform.sign_up_passwd.value ){
		alert(passwdstr);
		inputform.sign_up_passwd.focus();
		return false;
	}else if( inputform.sign_up_passwd.value != inputform.sign_up_repasswd.value ){
		alert( repasswdstr );
		inputform.sign_up_repasswd.focus();
		return false;
	}else if( !inputform.tel.value ){
		alert(telstr);
		inputform.tel.focus();
		return false;
	}
}


function modifycheck(){
	if( ! modifyform.passwd.value ){
		alert(passwdstr);
		modifyform.passwd.focus();
		return false;
	}else if(modifyform.passwd.value != modifyform.repasswd.value ){
		alert(repasswdstr);
		modifyform.passwd.focus();
		return false;	
	}
	
}


function logincheck(){
	if( !loginform.sign_in_id.value ){
		alert(idstr);
		loginform.sign_in_id.focus();
		return false;
	}else if( !loginform.sign_in_passwd.value){
		alert( passwdstr );
		loginform.sign_in_passwd.focus();
		return false;
	}
}


function confirmcheck(){
	if( !confirmform.id.value ){
		alert(idstr);
		confirmform.focus();
		return false;
	}
	
}

//로그인 할때 아이디 비밀번호 유효성 검사 
function maincheck() {
	if( !loginform.sign_in_id.value ){
		alert(idstr);
		loginform.sign_in_id.focus();
		return false;
	}else if( !loginform.sign_in_passwd.value ) {
		alert( passwdstr );
		loginform.sign_in_passwd.focus();
		return false;
	}
}

//이메일 직접입력 부분
function changeSelect(){
	list = document.getElementById("select").options[document.getElementById("select").selectedIndex].value;
	email2.value = list;
	if(list == "0"){
		email2.focus();
	}
	
}


