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
	function onSubmit(){
		if(checks()){
			if(confirm("글을 게시합니다")){
				oEditors[0].exec("UPDATE_CONTENTS_FIELD",[]);
				document.fr.submit();
			}
		}
		return false;
	}
	
	function checks(){
		if($("#title").val() ==''){
			alert('제목을 입력해주세요');
			$("#title").focus();
			return false;
		}
		if($("select").val()==""){
			alert("카테고리를 지정해주세요");
			$("select").focus();
			return false;
		}
		
		
		
		return true;
	}
</script>
</head> 
<body>
	
	<%@ include file="../../include/childHeader.jsp" %>
	
	<article> 
		<div>
			<div>자유게시판</div>
			<form action="update.do" method="post" name ="fr" onsubmit="return onSubmit();">
				<input type="hidden" name ="pageNum" value="${pageNum }">
				<input type="hidden" name = "boardNum" value ="${boardNum }">
				<div>
					카테고리
					<select name="category">
						<option value="">선택</option>
						<c:choose>
							<c:when test="${board.category eq 0 }">
								<c:if test="${sessionScope.category >= 8 }">
									<option value= "0" selected="selected">[공지]</option>
								</c:if>
								<option value="1">[자유]</option>
								<option value="2">[냉무]</option>
							</c:when>
							<c:when test="${board.category eq 1 }">
								<c:if test="${sessionScope.category >= 8 }">
									<option value= "0">[공지]</option>
								</c:if>
								<option value="1"  selected="selected">[자유]</option>
								<option value="2">[냉무]</option>
							</c:when>
							<c:when test="${board.category eq 2 }">
								<c:if test="${sessionScope.category >= 8 }">
									<option value= "0" >[공지]</option>
								</c:if>
								<option value="1">[자유]</option>
								<option value="2"  selected="selected">[냉무]</option>
							</c:when>
						
						</c:choose>
							
					</select>
				</div>
				
				<div>
					제목 <input type="text" name ="title" id = "title" value="${board.title }">
				</div>
				<div>파일 <input type="button" value="파일업로드"></div>
				<div>
					<textarea name="ir1" id="ir1" rows="10" cols="100" style="width:100%; height:412px; display:none;">${board.content }</textarea>
					<script type="text/javascript">
						var oEditors = [];
						nhn.husky.EZCreator.createInIFrame({
							oAppRef : oEditors,
							elPlaceHolder : "ir1",
							sSkinURI : "../resources/se2/SmartEditor2Skin.html",
							fCreator : "createSEditor2"
						});
					</script>
					<input type="submit" value="수정">
					<input type="button" value="취소" onclick="history.back();">
				</div>
				
			</form>
		</div>
	</article>
	
	<%@ include file="../../include/childFooter.jsp"  %>
</body>
</html>