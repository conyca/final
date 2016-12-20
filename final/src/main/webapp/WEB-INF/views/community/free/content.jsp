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
<script type="text/javascript" src="/final/resources/se2/js/HuskyEZCreator.js" charset="utf8"></script> 
<script type="text/javascript">
	function onDelete(){
		if(confirm("삭제하시겠습니까?")==true){
			location.href = 'delete.do?pageNum=${pageNum}&boardNum=${board.boardNum}';
		}
	}
</script>
</head> 
<body>
	
	<%@ include file="../../include/childHeader.jsp" %>
	
	<article>
		<form action="reply.do" method="post" name="fr">
			<input type="hidden" name ="pageNum" value="${pageNum }">
			<input type="hidden" name="boardNum" value="${board.boardNum }">
			<input type="hidden" name="depth" value="${board.depth }">
			<input type="hidden" name="groupId" value="${board.groupId }">
			
			<div>
				<div>자유게시판</div>
				<div>제목 :  ${board.title }</div>
				<div>작성자 : ${board.writer }</div>
				<div>조회수 :  ${board.hit }</div>
				<div>작성일 :  ${fn:substring(board.writeDate,0,10) }</div>
				<div>${board.content }</div>
			</div>
			<div>
				<c:if test="${sessionScope.id eq board.writer  or sessionScope.category >= 8 }">
					<input type ="button" value="수정" onclick="location.href='updateForm.do?pageNum=${pageNum}&boardNum=${board.boardNum }'">
					<input type ="button" value="삭제" onclick="onDelete();">
				</c:if>
				<input type="submit" value = "답글" >
				<input type="button" value ="목록" onclick="location.href='list.do?pageNum=${pageNum}'">
			</div>
		</form>
	</article>
	
	<%@ include file="../../include/childFooter.jsp"  %>
</body>
</html>