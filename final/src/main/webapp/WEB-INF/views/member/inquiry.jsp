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
				문의 내역 및 답변
				
				<table>
					<tr>
						<td>번호</td>
						<td>답변</td>
						<td>내용</td>
						<td>문의날짜</td>
					</tr>
					<c:if test="${!empty inquList }">
						<c:forEach items="${inquList }" var="list">
							<tr>
								<td>${list.inquNum }</td>
								<td>
									<c:if test="${list.status eq 0 }">
										대기중
									</c:if>
									<c:if test="${list.status eq 1 }">
										답변완료
									</c:if>
								</td>
								<td>
									${list.content }
								</td>
								<td>${fn:substring(list.regDate,0,10 )}</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty inquList }">
						<tr>
							<td colspan="3">문의 내역이 없습니다.</td>
						</tr>
					</c:if>
					<tr>
						<td>${pageCode }</td>
					</tr>
				</table>
			</aside>
		</div>
		
	</article>
	
	<%@ include file="../include/footer.jsp"  %>
</body>
</html>