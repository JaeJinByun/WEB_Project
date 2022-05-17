//메인페이지
var idstr = "아이디를 입력하세요.";
var passwdstr = "비밀번호를 입력하세요.";
var repasswdstr = "비밀번호가 다릅니다."
var namestr = "이름을 입력하세요.";
var juminstr = "주민등록번호를 입력하세요";
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
	if( !loginform.id.value ){
		alert(idstr);
		loginform.id.focus();
		return false;
	}else if( !loginform.passwd.value){
		alert( passwdstr );
		loginform.passwd.focus();
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
//중복확인이 끝나는 단계..
function setid(id){
	opener.document.inputform.id.value = id;
	window.close();
	opener.document.inputform.confirm.value = "1";
}




//회원가입  - 가입 버튼 
function inputcheck(){
	if( !inputform.id.value ){
		alert(idstr);
		inputform.id.focus();
		return false;
	}else if( !inputform.passwd.value ){
		alert(passwdstr);
		inputform.passwd.focus();
		return false;
	}else if( inputform.passwd.value != inputform.repasswd.value ){
		alert( repasswdstr );
		inputform.repasswd.focus();
		return false;
	}else if(! inputform.name.value){
		alert(namestr);
		inputform.name.focus();
		return false;
	}else if( inputform.jumin1.value.length < 6 ||  inputform.jumin2.value.length < 7){
		alert(juminstr);
		inputform.jumin1.focus();
		return false;
	}
	//아이디 중복확인 했냐?
	if(inputform.confirm.value =="0"){
		alert(confirmstr);
		inputform.id.focus();
		return false;
	}
}

function nextjumin1(){
	if(inputform.jumin1.value.length > 5){
		inputform.jumin2.focus();
	}
	
}
function nextjumin2(){
	if(inputform.jumin2.value.length > 6){
		inputform.tel1.focus();
	}
}

function nexttel1(){
	if( inputform.tel1.value.length > 2){
		inputform.tel2.focus();
	}
}
function nexttel2(){
	if( inputform.tel2.value.length > 3){
		inputform.tel3.focus();
	}
}

function nexttel3(){
	if( inputform.tel3.value.length > 3){
		inputform.email1.focus();
	}
	
}




//아이디 비밀번호 유효성 검사 
function maincheck() {
	if( !mainform.id.value ){
		alert(idstr);
		mainform.id.focus();
		return false;
	} else if( ! mainform.passwd.value ) {
		alert( passwdstr );
		mainform.passwd.focus();
		return false;
	}
	
}

//이메일 직접입력 부분
function changeSelect(){
	list = document.getElementById("select").options[document.getElementById("select").selectedIndex].value;
	inputform.email2.value = list;
	if(list == "0"){
		inputform.email2.focus();
	}
	
}


