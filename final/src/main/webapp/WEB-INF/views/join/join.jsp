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
	
	
	function checkSex(event) {
		var man = document.getElementById("man");
		var woman = document.getElementById("woman");
		var oMsg = document.getElementById("sexMsg");
		//var oDiv = document.getElementById("sexDiv");
		//oDiv.className = "join_row join_sex join_check";
		
		if (man.checked == false && woman.checked == false) {
			oMsg.style.display = "block";
			oMsg.innerHTML = "필수 정보입니다.";
			lua_do('join_kr'+document.getElementById("platform").value,'',ERROR_NO_VALUE_SEX, document.getElementById("token_sjoin").value, true,'');
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
	
	function checkId(event){
		toggleLabel('idLb', 'id', 'out');

		var id = document.getElementById("id").value;
		var oMsg = document.getElementById("idMsg");
		if (id == "") {
			oMsg.style.display = "block";
			oMsg.className = "error";
			oMsg.innerHTML = "필수 정보입니다.";
			lua_do('join_kr'+document.getElementById("platform").value,'',ERROR_ID_REQUIRED, document.getElementById("token_sjoin").value, true,'');
			lua_do2('join_kr'+document.getElementById("platform").value,'',ERROR_ID_REQUIRED+";keyboard^"+log2.sb(), document.getElementById("token_sjoin").value, true, document.getElementById("id").value);
			return false;
		}
		
	    var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
		if (!isID.test(id)) {
			oMsg.style.display = "block";
			oMsg.className = "error";
			oMsg.innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
			lua_do('join_kr'+document.getElementById("platform").value,'',ERROR_FORMAT_ID, document.getElementById("token_sjoin").value, true,'');
			return false;
		}
		idFlag = false;
		alert(id);
		$.ajax({
			url: "/final/joinIdCheck.do",
			data : {id:id},
			type : "POST",
			async : true,
			dataType : "json",
			error: function(xhr){
				alert("실패 ㅠㅠ" + xhr.statusText);
			},
			success:function(data){
				if(data=="Y"){
					if (event == "first") {
						oMsg.style.display = "block";
						oMsg.className = "error gm";
						oMsg.innerHTML = "멋진 아이디네요!";
					} else {
						oMsg.style.display = "none";
					}
					idFlag = true;
					return true;
				}else{
					oMsg.style.display = "block";
					oMsg.className = "error";
					oMsg.innerHTML = "이미 사용중이거나 탈퇴한 아이디입니다.";
					return false;
				}
			}
			
			
		});
		return true;
		
	}
	
</script>
</head>
<body>
	
<%@ include file="../include/header.jsp" %>

<article>
	<div class="joinContent">
		<form>
			<fieldset>
				<legend class="blind">회원가입</legend>
				<div class="rowGroup">
					<div id="idDiv" class="joinRow">
					<!-- 아이디 name id -->
						<span class="psBox">
							<input type="text" id="id" name="id" class="int" onfocus="toggleLabel('idLb','id', 'in');" onblur="toggleLabel('idLb','id', 'out'); checkId();" placeholder="아이디">
							<label id ="idLb" for="id" class="lbl">아이디</label>
						</span>
						<div id="idMsg" class="error" style="display: none;">필수 정보입니다.</div>
					</div>
					<div id="pswd1Div" class="joinRow">
					<!-- 비밀번호 pswd1 -->
						<span class="psBox">
							<input type="password" id="pswd1" name="pass" maxlength="16" onfocus="toggleLabel('pswd1Lb','pswd1','in');" onblur="toggleLabel('pswd1Lb','pswd1','out');"   placeholder="비밀번호" class="int">
							<label id ="pswd1Lb"for="pswd1" class="lbl">비밀번호</label>
						</span>
						<div id="pswd1Msg" class="error" style="display: none;">필수 정보입니다.</div>
					</div>
					<div id="pswd2Div" class="joinRow">
					<!-- 비밀번호 확인 -->
						<span class="psBox">
							<input type="password" id="pswd2" name="pass2" maxlength="16" onfocus="toggleLabel('pswd1Lb','pswd1','in');" onblur="toggleLabel('pswd1Lb','pswd1','out');"   placeholder="비밀번호 확인" class="int">
							<label id ="pswd2Lb"for="pswd2" class="lbl">비밀번호 확인</label>
						</span>
						<div id="pswd2Msg" class="error" style="display: none;">필수 정보입니다.</div>
					</div>
				</div>
				
				<div class="rowGroup">
					<div id="nameDiv" class="joinRow">
					<!-- 이름 name name -->
						<span class="psBox">
							<input type="text" id="name" name="name" class="int" onfocus="toggleLabel('idLb','id', 'in');" onfocus="toggleLabel('idLb','id', 'out')" placeholder="이름">
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
							<input type="text" id="mobno" name="mobno" maxlength="16" onfocus="toggleLabel('mobnoLb','mobno','in');" onblur="toggleLabel('mobnoLb','mobno','out');checkMobno('check')" placeholder="휴대전화번호" class="int">
							<label id="mobnoLb" for="mobno" class="lbl">휴대전화번호</label>
						</span>
					</div>
					<div id="mobnoMsg" class="error" style="display: none;">필수 정보입니다.</div>
				</div>
			
			</fieldset>
			<span class="btnJoin">
				<input type="submit" onclick="clickcr(this, 'sup.signup', '', '', event);" title="회원가입" alt="회원가입" value="가입하기" class="intJoin">
			</span>
		</form>
	</div>
	
</article>

<%@ include file="../include/footer.jsp"  %>
    
</body>
</html>