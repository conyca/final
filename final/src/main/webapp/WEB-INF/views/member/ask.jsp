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
		var select = document.getElementById("select");
		if(select.value==""){
			alert("신청 분류를 선택해주세요");
			select.focus();
			return false;
		}
		var c = $("option:selected").text();
		if(confirm(c+"(으)로 정회원을 신청하시겠습니까?")==true){
			return true;
		}
		return false;
	}
</script>
</head>
<body>
	
	<%@ include file="../include/header.jsp" %>
	
	<article>
		<div class="articleWrap">
			<%@include file="../include/myInfoAside.jsp" %>
			<aside class= "">
				정회원 신청
				<form action="ask.do" method="post" onsubmit="return onSubmit();" name = "fr">
					신청 분류
					<select name="category" id="select">
						<option value="">선택</option>
						<option value="1">학생</option>
						<option value="2">학부모</option>
						<option value="3">선생님</option>
						<option value="4">직원</option>
					</select>
					<input type="submit" value="신청">
				</form>
			</aside>
		</div>
		
	</article>
	
	<%@ include file="../include/footer.jsp"  %>
</body>
</html>