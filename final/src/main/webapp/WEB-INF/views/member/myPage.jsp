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
</head>
<body>
	
	<%@ include file="../include/header.jsp" %>
	
	<article>
	
		<div class="articleWrap">
			<%@include file="../include/myInfoAside.jsp" %>
			<aside class= "">
				회원정보
				<table>
					<tr>
						<td>아이디</td>
						<td>아이디</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>이름</td>
					</tr>
					<tr>
						<td>성별</td>
						<td>성별</td>
					</tr>
					<tr>
						<td>생일</td>
						<td>생일</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>이메일</td>
					</tr>
					<tr>
						<td>휴대전화번호</td>
						<td>휴대전화번호</td>
					</tr>
				</table>
				
				<c:if test="${sessionScope.category eq 5 }">
					학생정보
					class : class
					grade : grade
					address : address
					
				</c:if>
			</aside>
		</div>
		
	</article>
	
	<%@ include file="../include/footer.jsp"  %>
</body>
</html>