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
<link rel="stylesheet" href="./resources/css/main/mainStyle.css">
<script src="./resources/js/jquery/jquery-3.1.1.min.js"></script>
</head>
<body>
	
	<%@ include file="../include/header.jsp" %>
	
	<article>
		<div>
			<form action="">
				
				<fieldset>
					<legend class="blind">비밀번호 변경</legend>
					
					아이디 : <c:out value="${id }"></c:out>
					<div>
						<input type ="password" placeholder="새 비밀번호" id="pass" name = "pass">
						<input type ="password" placeholder="새 비밀번호 확인" id="passCheck">
					</div>
					
					<div>
						<img src="jcaptcha">
					</div>
					
				</fieldset>
				
			</form>
		
		</div>
		
	</article>
	
	<%@ include file="../include/footer.jsp"  %>
</body>
</html>