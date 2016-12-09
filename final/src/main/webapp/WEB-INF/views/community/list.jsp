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
<!-- <link rel="stylesheet" href="./resources/css/main/mainStyle.css"> -->
<script src="./resources/js/jquery/jquery-3.1.1.min.js"></script>
</head>
<body>
	
	<%@ include file="../include/header.jsp" %>
	
	<article>
		<div>
			<div>게시판이름</div>
			<div>
				<!-- 한 row -->
				<div>
					<span>번호</span>
					<span>제목</span>
					<span>글쓴이</span>
					<span>등록일</span>
					<span>조회수</span>
				</div>
				<c:forEach items="${list }" var="item">
					<div>
						<span>번호</span>
						<span>제목</span>
						<span>글쓴이</span>
						<span>등록일</span>
						<span>조회수</span>
					</div>
				</c:forEach>
				
			</div>
			<div></div>		
		</div>
	</article>
	
	<%@ include file="../include/footer.jsp"  %>
</body>
</html>