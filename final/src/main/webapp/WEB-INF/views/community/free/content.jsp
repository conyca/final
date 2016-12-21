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
	
	function commSubmit(){
		var con = document.getElementById("con");
		if(con.value ==""){
			alert("댓글을 입력하세요");
			con.focus();
		}else{
			if(confirm("댓글을 입력합니다")==true){
				$("input[name=content]").val(con.value);
				document.cfr.submit();
			}
		}
	}
	
	
</script>
</head> 
<body>
	
	<%@ include file="../../include/childHeader.jsp" %>
	
	<article>
		<form action="/final/comment/commentWrite.do" method="post" name="cfr">
			<input type ="hidden" name="kind" value="${board.kind }">
			<input type ="hidden" name="boardNum" value="${board.boardNum }">
			<input type ="hidden" name="pageNum" value="${pageNum }">
			<input type ="hidden" name="content" value="" >
		</form>
		<form action="replyForm.do" method="post" name="fr">
			<input type="hidden" name ="pageNum" value="${pageNum }">
			<input type="hidden" name="boardNum" value="${board.boardNum }">
			<input type="hidden" name="depth" value="${board.depth }">
			<input type="hidden" name="groupId" value="${board.boardNum }">
			
			<div>
				<div>자유게시판</div>
				<div>제목 :  ${board.title }</div>
				<div>작성자 : ${board.writer }</div>
				<div>조회수 :  ${board.hit }</div>
				<div>작성일 :  ${fn:substring(board.writeDate,0,10) }</div>
				<div>${board.content }</div>
			</div>
		</form>
		<div>
			<!-- 댓글 목록 -->
			
		</div>
			
		<div>
			<!-- 댓글 -->
			<c:if test="${!empty sessionScope.id }">
				<textarea rows="" cols="" id="con"></textarea>
				<input type="button" value="등록" onclick="commSubmit();">
			</c:if>
		</div>
		<div>
			<c:if test="${sessionScope.id eq board.writer  or sessionScope.category >= 8 }">
				<input type ="button" value="수정" onclick="location.href='updateForm.do?pageNum=${pageNum}&boardNum=${board.boardNum }'">
				<input type ="button" value="삭제" onclick="onDelete();">
			</c:if>
			<input type="button" value = "답글" onclick="document.fr.submit();">
			<input type="button" value ="목록" onclick="location.href='list.do?pageNum=${pageNum}'">
		</div>
	</article>
	
	<%@ include file="../../include/childFooter.jsp"  %>
</body>
</html>