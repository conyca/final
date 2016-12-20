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
<link rel="stylesheet" href="../resources/css/board/notice/notice.css">  
<script src="../resources/js/jquery/jquery-3.1.1.min.js"></script> 
<script type="text/javascript" src="../resources/se2/js/HuskyEZCreator.js" charset="utf8"></script> 
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
		<div>
			<div>공지사항</div>
			<div>제목 : <c:if test="${board.category eq 0 }">[공지]</c:if> ${board.title }</div>
			<div>조회수 :  ${board.hit }</div>
			<div>작성일 :  ${fn:substring(board.writeDate,0,10) }</div>
			<div>${board.content }</div>
		</div>
		<div>
			<c:if test="${sessionScope.category >= 8 }">
				<input type ="button" value="수정" onclick="location.href='updateForm.do?pageNum=${pageNum}&boardNum=${board.boardNum }'">
				<input type ="button" value="삭제" onclick="onDelete();">
			</c:if>
			<input type="button" value ="목록" onclick="location.href='list.do?pageNum=${pageNum}'">
		</div>
	</article>
	
	<%@ include file="../../include/childFooter.jsp"  %>
</body>
</html>