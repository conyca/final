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
<link rel="stylesheet" href="./resources/css/login/loginStyle.css">
<script src="./resources/js/jquery/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body onload="test();">
	
	<%@ include file="../include/header.jsp" %>
	
	<article>
		<div class="content">
			<form action="login.do" method="post">
				<input type="hidden" name="returnUrl" value="${returnUrl }">
				<div id = "test">
					<input type="text" name="id">
					<input type="password" name="pass">
				</div>
				<div>
					<ul>
						<li><a href="">아이디 찾기</a></li>
						<li><a href="">비밀번호 찾기</a></li>
						<li><a href="joinForm.do">회원가입</a></li>
					</ul>
				</div>
				<input type="submit" value="로그인">
			</form>
		</div>
	</article>
	
	<%@ include file="../include/footer.jsp"  %>
</body>
</html>