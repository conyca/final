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
<link rel="stylesheet" href="./resources/css/member/find/findStyle.css">
<script src="./resources/js/jquery/jquery-3.1.1.min.js"></script>
<script src="./resources/js/member/find.js"></script> 
</head>
<body>
	
	<%@ include file="../include/header.jsp" %>
	
	<article>
		<div>
			<form action="findPass.do" method="post" name ="fr">
				<input type="hidden" name = "returnUrl" value="${returnUrl}">
				<input type="hidden" name = "sbText" >
				<input type="hidden" name = "sbEmail" >
				<fieldset>
					<legend class="blind">회원가입</legend>
					id : 
					<input type="text" name ="id" id ="id"><br>
					email : 
					<input type="email" name ="email" id = "email">
					<input type="button" value="인증번호 받기" onclick="sendMail('pass');"><br>
					<input type="text" value="인증번호 6자 입력" maxlength="6" id ="num" disabled="disabled">
				</fieldset>	
				<input type="button" value ="확인" onclick="check();">
			</form>
		</div>
		
	</article>
	
	<%@ include file="../include/footer.jsp"  %>
</body>
</html>