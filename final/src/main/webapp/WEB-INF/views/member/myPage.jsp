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
				<table>
					<tr>
						<td>아이디</td>
						<td>${member.id }</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>${member.name }</td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<c:if test="${member.sex eq 0 }">
								남자
							</c:if>
							<c:if test="${member.sex eq 1 }">
								여자
							</c:if>
						
						</td>
					</tr>
					<tr>
						<td>생일</td>
						<td>${year }년 ${month }월 ${day }일</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>${member.email }</td>
					</tr>
					<tr>
						<td>휴대전화번호</td>
						<td>${member.mobno }</td>
					</tr>
				</table>
				
				<c:if test="${sessionScope.category >= 5 }">
					기타정보
<!-- 					class : class -->
<!-- 					grade : grade -->
<!-- 					address : address -->
					
					<table>
						<tr>
							<td>class</td>
							<td>${data.className }</td>
						</tr>
						<tr>
							<td>학년</td>
							<td>${data.grade }</td>
						</tr>
						<tr>
							<td>주소</td>
							<td>${data.address }</td>
						</tr>
					</table>
				</c:if>
			</aside>
		</div>
		
	</article>
	
	<%@ include file="../include/footer.jsp"  %>
</body>
</html>