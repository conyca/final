<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1, maximum-scale=1, user-scalable=yes, target-densitydpi=medium-dpi">
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<title>행복하니? 행복학원!</title>
<link rel="stylesheet" href="./resources/css/join/joinStyle.css">
<script src="./resources/js/jquery/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	function toggleLabel(labelId, inputId, mode){
		var oLabel = document.getElementById(labelId);
		var oInput = document.getElementById(inputId);
		if (mode == "in") {
			oLabel.className = "lbl focus";
		} else {
			if (oInput.value != "") {
				oLabel.className = "lbl focus";
			} else {
				oLabel.className = "lbl";
			}
		}
	}
	
	function calcAge(birth) {
		var date = new Date();
		var year = date.getFullYear();
		var month = (date.getMonth() + 1);
		var day = date.getDate();
		if (month < 10)
			month = '0' + month;
		if (day < 10)
			day = '0' + day;
		var monthDay = month + '' + day;

		birth = birth.replace('-', '').replace('-', '');
		var birthdayy = birth.substr(0, 4);
		var birthdaymd = birth.substr(4, 4);

		var age = monthDay < birthdaymd ? year - birthdayy - 1 : year - birthdayy;
		return age;
	}
	
	function isValidDate(param) {
		try {
			param = param.replace(/-/g, '');

			// 자리수가 맞지않을때
			if (isNaN(param) || param.length != 8) {
				return false;
			}

			var year = Number(param.substring(0, 4));
			var month = Number(param.substring(4, 6));
			var day = Number(param.substring(6, 8));

			if (month < 1 || month > 12) {
				return false;
			}

			var maxDaysInMonth = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
			var maxDay = maxDaysInMonth[month - 1];

			// 윤년 체크
			if (month == 2 && (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)) {
				maxDay = 29;
			}

			if (day <= 0 || day > maxDay) {
				return false;
			}
			return true;

		} catch (err) {
			return false;
		}
		;
	}
	
	
	function checkSex(event) {
		var man = document.getElementById("man");
		var woman = document.getElementById("woman");
		var oMsg = document.getElementById("sexMsg");
		//var oDiv = document.getElementById("sexDiv");
		//oDiv.className = "join_row join_sex join_check";
		
		if (man.checked == false && woman.checked == false) {
			oMsg.style.display = "block";
			oMsg.innerHTML = "필수 정보입니다.";
			return false;
		}

		if (man.checked) {
			document.getElementById("manLb").className = "on";
			document.getElementById("womanLb").className = "";
		}
		if (woman.checked) {
			document.getElementById("manLb").className = "";
			document.getElementById("womanLb").className = "on";
		}

		if (true) {
			oMsg.style.display = "none";
			return true;
		}

		return true;
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
	
	function checkSpace(str) {
		if (str.search(/\s/) != -1) {
			return true;
		} else {
			return false;
		}
	}
	
	
	idFlag=false;
	function checkId(event){
		toggleLabel('idLb', 'id', 'out');

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
			oMsg.innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
			idFlag=false;
			return false;
		}
		$.ajax({
			url: "/final/joinIdCheck.json",
			data : {id:id},
			async: false,
			type : "POST",
			dataType : "json",
			error: function(xhr){
				alert("아이디 실패 ㅠㅠ" + xhr.statusText);
			},
			success:function(data){
				if(data.result=="Y"){
					if (event == "first") {
						oMsg.style.display = "block";
						oMsg.className = "error gm";
						oMsg.innerHTML = "멋진 아이디네요!";
					} else {
						oMsg.style.display = "none";
					}
					idFlag=true;
					return true;
				}else{
					oMsg.style.display = "block";
					oMsg.className = "error";
					oMsg.innerHTML = "이미 사용중이거나 탈퇴한 아이디입니다.";
					alert("아아디 사용중");
					idFlag=false;
					return false;
				}
			}
			
		});
	}
	
	function checkPswd1(event){
		checkPswd2("check");

		var id = document.getElementById("id").value;
		var pw = document.getElementById("pswd1").value;
		var oMsg = document.getElementById("pswd1Msg");
		
		if (pw == "") {
			oMsg.style.display = "block";
			oMsg.className = "error";
			oMsg.innerHTML = "필수 정보입니다.";
			return false;
		}
		if (isValidPasswd(pw) != true) {
			oMsg.style.display = "block";
			oMsg.className = "error e_info";
			oMsg.innerHTML = "6~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
			return false;
		}
		oMsg.style.display = "none";
		
		return true;
	}
	

	function checkPswd2(event) {
		var pswd1 = document.getElementById("pswd1").value;
		var pswd2 = document.getElementById("pswd2").value;
		var oMsg = document.getElementById("pswd2Msg");

		if (pswd2 == "") {
			oMsg.style.display = "block";
			oMsg.innerHTML = "필수 정보입니다.";
			return false;
		}
		if (pswd1 != pswd2) {
			oMsg.style.display = "block";
			oMsg.innerHTML = "비밀번호가 일치하지 않습니다.";
			document.getElementById("pswd2").value = "";
			return false;
		} else {
			oMsg.style.display = "none";
			return true;
		}

		return true;
	}
	
	function checkName(event) {
		toggleLabel('nameLb', 'name', 'out');

		var nm = document.getElementById("name").value;
		var oMsg = document.getElementById("nameMsg");

		if (nm == "") {
			oMsg.style.display = "block";
			oMsg.innerHTML = "필수 정보입니다.";
			return false;
		}

		var nonchar = /[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9]/gi;
		if (nonchar.test(nm)) {
			oMsg.style.display = "block";
			oMsg.innerHTML = "이름에는 한글, 영문 대소문자를 이용해 주세요.";
			return false;
		}

		if (true) {
			oMsg.style.display = "none";
			return true;
		}

		return true;
	}
	
	function checkBirthday(event) {
		toggleLabel('yyLb', 'yy', 'out');
		toggleLabel('ddLb', 'dd', 'out');

		var birthday = "";
		var yy = document.getElementById("yy").value;
		var s = document.getElementById('mm');
		var mm = s.options[s.selectedIndex].value;
		var dd = document.getElementById("dd").value;
		var oMsg = document.getElementById("birthdayMsg");

		if (yy == "" && mm == "" && dd == "") {
			oMsg.style.display = "block";
			oMsg.innerHTML = "태어난 년도 4자리를 정확하게 입력하세요.";
			return false;
		}
		
		if (mm.length == 1) {
			mm = "0" + mm;
		}
		if (dd.length == 1) {
			dd = "0" + dd;
		}
		
		if(yy == "") {
			oMsg.style.display = "block";
			oMsg.innerHTML = "태어난 년도 4자리를 정확하게 입력하세요.";
			return false;
		}
		if(yy.length != 4 || yy.indexOf('e') != -1 || yy.indexOf('E') != -1) {
			oMsg.style.display = "block";
			oMsg.innerHTML = "태어난 년도 4자리를 정확하게 입력하세요.";
			return false;
		}
		if(mm == "") {
			oMsg.style.display = "block";
			oMsg.innerHTML = "태어난 월을 선택하세요.";
			return false;
		}
		if(dd == "") {
			oMsg.style.display = "block";
			oMsg.innerHTML = "태어난 일(날짜) 2자리를 정확하게 입력하세요.";
			return false;
		}
		if(dd.length != 2 || dd.indexOf('e') != -1 || dd.indexOf('E') != -1) {
			oMsg.style.display = "block";
			oMsg.innerHTML = "태어난 일(날짜) 2자리를 정확하게 입력하세요.";
			return false;
		}
		
		birthday = yy + mm + dd;	

		if (!isValidDate(birthday)) {
			oMsg.style.display = "block";
			oMsg.innerHTML = "생년월일을 다시 확인해주세요.";
			return false;
		}
		document.getElementById("birthday").value = birthday;

		var age = calcAge(birthday);
		if (age < 0) {
			oMsg.style.display = "block";
			oMsg.innerHTML = "미래에서 오셨군요. ^^";
			return false;
		} else if (age >= 100) {
			oMsg.style.display = "block";
			oMsg.innerHTML = "정말이세요?";
			return false;
		} else {
			oMsg.style.display = "none";

			return true;
		}

		return true;
	}
	
	function checkEmail(event) {
		toggleLabel('emailLb', 'email', 'out');

		var email = document.getElementById("email").value;
		var oMsg = document.getElementById("emailMsg");

		if (email == "") {
			oMsg.style.display = "block";
			oMsg.innerHTML = "필수 정보입니다.";
			return false;
		}

		var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		var isHan = /[ㄱ-ㅎ가-힣]/g;
		if (!isEmail.test(email) || isHan.test(email)) {
			oMsg.style.display = "block";
			oMsg.innerHTML = "이메일 주소를 다시 확인해주세요.";
			return false;
		}

		$.ajax({
			url: "/final/joinEmailCheck.json",
			data : {email:email},
			type : "POST",
			async: false,
			async : true,
			dataType : "json",
			error: function(xhr){
				alert("이메일 실패 ㅠㅠ" + xhr.statusText);
			},
			success:function(data){
				if(data.result == "Y"){
					oMsg.style.display = "none";
					return true;
				}else{
					oMsg.style.display = "block";
					oMsg.className = "error";
					oMsg.innerHTML = "이미 사용중이거나 탈퇴한 회원의 이메일 입니다.";
					return false;
				}
			}
		});
		return true;
	}
	
	function keydownMobno(){
		if(!( (event.keyCode>=48 && event.keyCode<=57) || 
				( event.keyCode >= 96 && event.keyCode <=105) ||
				event.keyCode==8  )){
			event.returnValue=false;
		}
	}
	
	mobnoFalg=false;
	function checkMobno(event){
		var mobno = document.getElementById("mobno").value;
		var oMsg = document.getElementById("mobnoMsg");
		
		if (mobno == "") {
			oMsg.style.display = "block";
			oMsg.innerHTML = "필수 정보입니다.";
			return false;
		}
		
		$.ajax({
			url: "/final/joinMobnoCheck.json",
			data : {mobno:mobno},
			type : "POST",
			async: false,
			dataType : "json",
			error: function(xhr){
				alert("폰번호 실패 ㅠㅠ" + xhr.statusText);
			},
			success:function(data){
				if(data.result == "Y"){
					oMsg.style.display = "none";
					mobnoFalg=true;
					return true;
				}else{
					oMsg.style.display = "block";
					oMsg.className = "error";
					oMsg.innerHTML = "이미 사용중이거나 탈퇴한 회원의 휴대전하번호 입니다.";
					return false;
				}
			}
		});
		
		return true;
	}
	
	function joinSubmit(count){
		let res = true;
		var form = document.getElementById("fr");
		count++;
		if(count>10){
			return false;
		}
		
		if(count == 1){
			if(idFlag != true){
				alert("아이디");
				res = false;
			}
			if(checkPswd1("check") != true){
				res = false;
			}
			if(checkPswd2("check") != true){
				res = false;
			}
			if(checkName("check") != true){
				res = false;
			}
			if (checkSex("check") != true) {
				res = false;
			}
			if (checkBirthday("check") != true) {
				res = false;
			}		
			if (checkEmail("check") != true) {
				alert("이메일");
				res = false;
			}
			if(checkMobno("check")!= true){
				alert("모바일");
				res = false;
			}
		}
		alert(res);
		// 유효성 실패시
		var oMsg = document.getElementById("joinMsg");
		if (res == false) {
			oMsg.style.display = "block";
			oMsg.innerHTML = "입력하신 정보를 다시 확인해주세요.";
			return false;
		}
		// 성공시
		if(res == true){
			
			form.submit();
		}
		
		return false;		
	}
	
</script>
</head>
<body>
	
<%@ include file="../include/header.jsp" %>

<article>
	<div class="joinContent">
		<form method="post" action="/final/join.do" id = "fr">
			<input type="hidden" id="birthday" name="birthday">
			<fieldset>
				<legend class="blind">회원가입</legend>
				<div class="rowGroup">
					<div id="idDiv" class="joinRow">
					<!-- 아이디 name id -->
						<span class="psBox">
							<input type="text" id="id" name="id" class="int" onfocus="toggleLabel('idLb','id', 'in');" onblur="toggleLabel('idLb','id', 'out'); checkId('first');" placeholder="아이디">
							<label id ="idLb" for="id" class="lbl">아이디</label>
						</span>
						<div id="idMsg" class="error" style="display: none;">필수 정보입니다.</div>
					</div>
					<div id="pswd1Div" class="joinRow">
					<!-- 비밀번호 pass -->
						<span class="psBox">
							<input type="password" id="pswd1" name="pass" maxlength="16" onfocus="toggleLabel('pswd1Lb','pswd1','in');" onblur="toggleLabel('pswd1Lb','pswd1','out');checkPswd1('check');"   placeholder="비밀번호" class="int">
							<label id ="pswd1Lb"for="pswd1" class="lbl">비밀번호</label>
						</span>
						<div id="pswd1Msg" class="error" style="display: none;">필수 정보입니다.</div>
					</div>
					<div id="pswd2Div" class="joinRow">
					<!-- 비밀번호 확인 -->
						<span class="psBox">
							<input type="password" id="pswd2" name="pass2" maxlength="16" onfocus="toggleLabel('pswd1Lb','pswd1','in');" onblur="toggleLabel('pswd1Lb','pswd1','out');checkPswd2('check');"   placeholder="비밀번호 확인" class="int">
							<label id ="pswd2Lb"for="pswd2" class="lbl">비밀번호 확인</label>
						</span>
						<div id="pswd2Msg" class="error" style="display: none;">필수 정보입니다.</div>
					</div>
				</div>
				
				<div class="rowGroup">
					<div id="nameDiv" class="joinRow">
					<!-- 이름 name name -->
						<span class="psBox">
							<input type="text" id="name" name="name" class="int" onfocus="toggleLabel('idLb','id', 'in');" onblur="toggleLabel('idLb','id', 'out'); checkName('check')" placeholder="이름">
							<label id ="nameLb" for="name" class="lbl">이름</label>
						</span>
						<div id="nameMsg" class="error" style="display: none;">필수 정보입니다.</div>
					</div>
					
					<div id="sexDiv" class="joinRow joinSex">
					<!-- 성별 name sex -->
						<span class="sex">
							<span class="gender">
								<input type="radio" id="man" name="sex" value="0" onclick="checkSex()">
								<label id="manLb" for="man">남자</label>
							</span>
							<span class="gender">
								<input type="radio" id="woman" name="sex" value="1" onclick="checkSex()">
								<label id="womanLb" for="woman">여자</label>
							</span>
						</span>
						<span id="sexMsg" class="error" style="display: none;">필수 정보입니다.</span>
					</div>
					
					<div id="birthdayDiv" class="joinRow joinBirthday">
					<!-- 생년월일 name  -->
						<div class="joinBirth">
							<div class="birTitle">
								<span>생일</span>
							</div>
							<div class="birYear">
								<span class="psBox">
									<input type="text" id="yy" maxlength="4"  onfocus="toggleLabel('yyLb','yy','in');" onblur="toggleLabel('yyLb','yy','out');" placeholder="년(4자)" class="int">
									<label id="yyLb" for="yy" class="lbl">년(4자)</label>
								</span>
							</div>
							<span class="cell">|</span>
							<div class="birMonth">
								<span class="psBox">
									<select id="mm" title="월" class="sel" onchange="checkBirthday('check')">
										<option>월</option>
										<c:forEach begin="1" end="12" step="1" var="i">
											<option value="${i }">${i }</option>
										</c:forEach>
									</select>
								</span>
							</div>
							<span class="cell">|</span>
							<div class="birDate">
								<span class="psBox">
									<input type="text" id="dd" maxlength="2"  onfocus="toggleLabel('ddLb','dd','in');" onblur="toggleLabel('ddLb','dd','out');checkBirthday('check')" placeholder="일" class="int">
									<label id="ddLb" for="dd" class="lbl">일</label>
								</span>
							</div>
						</div>
						<span id="birthdayMsg" class="error" style="display: none;">필수 정보입니다.</span>
					</div>
					
					<div id="emailDiv" class="joinRow joinEmail">
						<span class="psBox">
							<input type="text" id="email" name="email" maxlength="100" onfocus="toggleLabel('emailLb','email','in');" onblur="toggleLabel('emailLb','email','out');checkEmail('check')" placeholder="이메일" class="int">
							<label id="emailLb" for="email" class="lbl">이메일</label>
						</span>
						<div id="emailMsg" class="error" style="display:none">필수 정보입니다.</div>
					</div>
					
					<div id="mobnoDiv" class="joinRow">
						<span class="psBox">
							<input type="text" id="mobno" name="mobno" maxlength="16" onfocus="toggleLabel('mobnoLb','mobno','in');" onblur="toggleLabel('mobnoLb','mobno','out');checkMobno('check')" onkeydown="keydownMobno();" placeholder="휴대전화번호" class="int">
							<label id="mobnoLb" for="mobno" class="lbl">휴대전화번호</label>
						</span>
					</div>
					<div id="mobnoMsg" class="error" style="display: none;">필수 정보입니다.</div>
				</div>
			
			</fieldset>
			<div class = "errorCh">
				<span id="joinMsg" class="error" style="display:none">가입정보를 확인해주세요.</span>
			</div>
			<span class="btnJoin">
				<input type="button" title="회원가입" alt="회원가입" value="가입하기" onclick="joinSubmit(0);" class="intJoin">
			</span>
		</form>
	</div>
	
</article>

<%@ include file="../include/footer.jsp"  %>
    
</body>
</html>