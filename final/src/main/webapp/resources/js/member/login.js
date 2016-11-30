function checkSpace(str) {
	if (str.search(/\s/) != -1) {
		return true;
	} else {
		return false;
	}
}

	
function isValidPasswd(str) {
	var cnt = 0;
	if (str == "") {
		return false;
	}

	/* check whether input value is included space or not */
	var retVal = checkSpace(str);
	if (retVal) {
		return false;
	}
	if (str.length < 6) {
		return false;
	}
	for (var i = 0; i < str.length; ++i) {
		if (str.charAt(0) == str.substring(i, i + 1))
			++cnt;
	}
	if (cnt == str.length) {
		return false;
	}

	var isPW = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{6,16}$/;
	if (!isPW.test(str)) {
		return false;
	}

	return true;
}

	idFlag=false;
	function checkId(){
		var id = document.getElementById("id").value;
		var oMsg = document.getElementById("idMsg");
		if (id == "") {
			oMsg.style.display = "block";
			oMsg.className = "error";
			oMsg.innerHTML = "필수 정보입니다.";
			idFlag=false;
			return false;
		}
		var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
		if (!isID.test(id)) {
			oMsg.style.display = "block";
			oMsg.className = "error";
			oMsg.innerHTML = "잘못된 입력입니다.";
			idFlag=false;
			return false;
		}
		oMsg.style.display = "none";
		idFlag=true;
		return true;
		
	}
	
	function passCheck(){
		var pw = document.getElementById("pw").value;
		var oMsg = document.getElementById("passMsg");
		if (pw == "") {
			oMsg.style.display = "block";
			oMsg.className = "error";
			oMsg.innerHTML = "필수 정보입니다.";
			pswdFlag=false;
			return false;
		}
		if (isValidPasswd(pw) != true) {
			oMsg.style.display = "block";
			oMsg.className = "error e_info";
			oMsg.innerHTML = "6~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
			pswdFlag=false;
			return false;
		}
		oMsg.style.display = "none";
		pswdFlag=true;
		return true;
		
	}
	
	function onSubmit(){
		var res = true;
		var oMsg = document.getElementById("loginMsg");
		if(idFlag!= true){
			res = false;
			alert("아이디를 입력하세요");
			oMsg.style.display = "block";
			oMsg.className = "error e_info";
			oMsg.innerHTML = "아아디를 정확히 입력해주세요";
			return false;
		}
		if(passFlag!=true){
			res = false;
			alert("비밀번호를 입력하세요");
			oMsg.style.display = "block";
			oMsg.className = "error e_info";
			oMsg.innerHTML = "비밀번호를 정확히 입력해주세요";
			return false;
			
			
		}
		
		if(res == false){
			return false;
		}else{
			return true;
		}
		
		
	}
	