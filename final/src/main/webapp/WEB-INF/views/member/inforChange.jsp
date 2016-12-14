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
			<c:set var="year">${fn:substring(member.birthday,0,4)  }</c:set>
			<c:set var="month">${fn:substring(member.birthday,4,6)  }</c:set>
			<c:set var="day">${fn:substring(member.birthday,6,8)  }</c:set>
			<aside class= "">
				회원정보
				<form action="">
					<input type="hidden" name = "birthday" id="birthday">
					<table>
						<tr>
							<td>아이디</td>
							<td>${member.id }</td>
						</tr>
						
						<tr>
							<td>비밀번호</td>
							<td>
								<input type ="password" name = "pass">
							</td>
						</tr>
						
						<tr>
							<td>이름</td>
							<td><input type="text" value="${member.name }" name ="name"></td>
						</tr>
						<tr>
							<td>성별</td>
							<td>
								
								<c:if test="${member.sex eq 0 }">
									<input type="radio" name ="sex" value="0" checked="checked" >남자 <br>
									<input type="radio" name ="sex" value="1" >여자
								</c:if>
								<c:if test="${member.sex eq 1 }">
									<input type="radio" name ="sex" value="0" >남자 <br>
									<input type="radio" name ="sex" value="1" checked="checked" >여자
								</c:if>
							
							</td>
						</tr>
						<tr>
							<td>생일</td>
							<td>
								<input type="text" value="${year }" id ="year" >년 
								<input type="text" value="${month }" id ="month" >월 
								<input type="text" value="${day }" id ="day" >일 
							</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td>
								<input type="text" value="${member.email }" name="email">
							</td>
						</tr>
						<tr>
							<td>휴대전화번호</td>
							<td>
								<input type="text" value="${member.mobno }" name="mobno">
							</td>
						</tr>
						<tr>
							<td colspan="1">
								<input type="submit" value="회원 정보 변경">
							</td>
						</tr>
					</table>
				</form>
			
			</aside>
		</div>
	</article>
	
	<%@ include file="../include/footer.jsp"  %>
</body>
</html>