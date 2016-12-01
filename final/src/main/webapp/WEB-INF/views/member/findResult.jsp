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
</head>

<body>
	
	<%@ include file="../include/header.jsp" %>
	
	<article>
		<div>
				<div>아이디 찾기</div>
				<div>고객님의 정보와 일치하는 아이디 입니다.</div>	
		</div>
		
		<div>
			<div>
				${member.id }
			</div>
			<div>
				${member.regDate }
			</div>	
		</div>
		<div>
			<input type="button" value = "로그인" onclick="location.href='login.do?returnUrl=${returnUrl}'">
			<input type="button" value = "비밀번호 찾기" onclick="location.href='findPassForm.do?returnUrl=${returnUrl}'">
		</div>
	</article>
	
	<%@ include file="../include/footer.jsp"  %>
</body>
</html>