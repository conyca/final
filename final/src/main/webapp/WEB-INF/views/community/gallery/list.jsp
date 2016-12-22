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
<link rel="stylesheet" href="/final/resources/css/board/notice/notice.css"> 
<script src="/final/resources/js/jquery/jquery-3.1.1.min.js"></script>
</head> 
<body>
	
	<%@ include file="../../include/header.jsp" %>
	
	<article>
		<div>
			<div>겔러리</div>
			<div>
				<c:if test="${sessionScope.category >=0 }">
					<a href ="writeForm.do?pageNum=${pageNum }">글쓰기</a>
				</c:if>
			</div>
			<div>
				<!-- 한 row -->
				<div>
					<span>번호</span>
					<span>제목</span>
					<span>글쓴이</span>
					<span>등록일</span>
					<span>조회수</span>
				</div>
				<div>
					<c:if test="${!empty list }">
						<ul>
							<c:forEach items="${list }" var="item">
								<li>
									<span>${item.boardNo }</span>
									<a href ="content.do?pageNum=${pageNum }&boardNum=${item.boardNum}">
										<img>
									</a>
									
									<span>
										<a href ="content.do?pageNum=${pageNum }&boardNum=${item.boardNum}">
											${item.title }
											<c:if test="${item.commentCount > 0 }">
												(${item.commentCount })
											</c:if>
										</a>
									</span>
									<span>${item.writer }</span>
									<span>${fn:substring(item.writeDate,0,10)}</span>
									<span>${item.hit }</span>
								</li>
							</c:forEach>
						</ul>
					</c:if>
				</div>
				<c:if test="${empty list }">
					<div>
						<span>게시글이 없습니다.</span>
					</div>
				</c:if>
				
			</div>
			<div>
				<c:if test="${!empty list }">
					${pageCode }
				</c:if>
			</div>		
		</div>
	</article>
	
	<%@ include file="../../include/footer.jsp"  %>
</body>
</html>