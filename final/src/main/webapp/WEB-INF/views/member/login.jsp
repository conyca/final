<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<meta name="viewport" content="width=device-width,initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=yes">
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<title>행복하니? 행복학원!</title>
<link rel="stylesheet" href="./resources/css/member/login/loginStyle.css">
<script src="./resources/js/jquery/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<!-- <body onload="test();"> -->
<body>
	
	<%@ include file="../include/header.jsp" %>
	
	<article>
		<div class="content">
			<form action="login.do" method="post">
				<input type="hidden" name="returnUrl" value="${returnUrl }">
				<fieldset>
					<legend class="blind">로그인</legend>
					<div class="rowGroup">
						<div class="loginRow">
							<span class="inputBox">
								<input type="text" id="id" name="id" tabindex="7" accesskey="L" placeholder="아이디" class="int" maxlength="41" >
							</span> 
							<div id="idMsg" class="error" style="display: none;">아이디를 입력해 주세요</div>
						</div>
				
						<div class="loginRow">
							<span> 
								<input type="password" id="pw" name="pass" tabindex="8" placeholder="비밀번호" class="int" maxlength="16" onkeypress="capslockevt(event);getKeysv2();" onkeyup="checkShiftUp(event);" onkeydown="checkShiftDown(event);">
							</span>
							<div id="passMsg" class="error" style="display: none;">비밀번호를 입력해주세요</div>
						</div>
					</div>
					
					<input type="submit" title="로그인" alt="로그인" tabindex="12" value="로그인" class="btn_global" onclick="nclks('log.login',this,event)">
					<div id = "loginBtnDiv">
						<a href="">아이디 찾기</a>
						<span class= "bar">|</span>
						<a href="">비밀번호 찾기</a>
						<span class= "bar">|</span>
						<a href="joinForm.do">회원가입</a>
					</div>
				</fieldset>
			</form>
		</div>
	</article>
	
	<%@ include file="../include/footer.jsp"  %>
</body>
</html>