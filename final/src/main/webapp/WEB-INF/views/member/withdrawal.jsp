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
<link rel="stylesheet" href="./resources/css/member/myPage/myPageStyle.css">
<script src="./resources/js/jquery/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	function onSubmit(){
		var pass = document.getElementById("pass");
		if(pass.value==""){
			alert("비밀번호를 입력하세요");
			pass.focus();
			return false;
		}
		if(confirm("정말 탈퇴하시겠습니까?")==true){
			document.fr.submit();
		}
		
	}
</script>
</head>
<body>
	
	<%@ include file="../include/header.jsp" %>
	
	<article>
		<div class="articleWrap">
			<%@include file="../include/myInfoAside.jsp" %>
			<aside class= "">
				탈퇴<br>
				
				탈퇴 처리를 위해 비밀번호를 입력해주세요
				<form action="withdrawal.do" method="post" name = "fr" onsubmit="return onSubmit();">
					<input type="password" id="pass" name = "pass">
					<input type="button" onclick="onSubmit();" value="탈퇴하기">
				</form>
			</aside>
		</div>
		
	</article>
	
	<%@ include file="../include/footer.jsp"  %>
</body>
</html>