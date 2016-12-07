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
		<div class="content">
			<form action="findId.do"  method ="post" name = "fr">
				<input type="hidden" name = "returnUrl" value="${returnUrl}">
				<input type="hidden" name = "sbText" >
				<input type="hidden" name = "sbEmail" >
				<fieldset>
					<legend class="blind">아이디 찾기</legend> 
					<div>
						<input type="text" class ="int" placeholder="이름을 입력하세요" name ="name" id ="name"><br><br>
						<input type="email" class ="int" placeholder="이메일을 입력하세요" name ="email" id = "email"><br>
						<input type="button" class="btn_global"   value="인증번호 받기" onclick="sendMail('id');"><br>
						<input type="text" class ="int" value="인증번호 6자 입력" maxlength="6" id ="num" disabled="disabled">
					</div>
				</fieldset>
				
				<input type="button" class="btn_global" value ="확인" onclick="check();">
			</form>
		</div>
		
	</article>
	
	<%@ include file="../include/footer.jsp"  %>
</body>
</html>