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
		return true;
	}
</script>
</head> 
<body>
	
	<%@ include file="../../include/childHeader.jsp" %>
	
	<article> 
		<div>
			<div>공지사항</div>
			<form action="write.do" method="post" name ="fr" onsubmit="return onSubmit();">
				<input type="hidden" name ="pageNum" value="${pageNum }">
				<div>
					제목 <input type="text" name ="title" id = "title">
				</div>
				<div>
					<textarea name="ir1" id="ir1" rows="10" cols="100" style="width:100%; height:412px; display:none;"></textarea>
					<script type="text/javascript">
						var oEditors = [];
						nhn.husky.EZCreator.createInIFrame({
							oAppRef : oEditors,
							elPlaceHolder : "ir1",
							sSkinURI : "../resources/se2/SmartEditor2Skin.html",
							fCreator : "createSEditor2"
						});
					</script>
					<input type="submit" value="글쓰기">
					<input type="button" value="취소" onclick="location.href='notice/list.do?pageNum=${pageNum}'">
				</div>
				
			</form>
		</div>
	</article>
	
	<%@ include file="../../include/childFooter.jsp"  %>
</body>
</html>