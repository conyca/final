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
<link rel="stylesheet" href="./resources/css/main/mainStyle.css">
<script src="./resources/js/jquery/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	autoStatus = 1;
	function autoSlide (){
		if(autoStatus == 1){
			$("#mainImgFade ul li:first-child").fadeOut(2000);
			autoStatus=0;
		}else{
			$("#mainImgFade ul li:first-child").fadeIn(2000);
			autoStatus=1;
		}
		setTimeout('autoSlide()',5000);
	}
	$(function(){
		autoSlide();
	})
</script>
</head>
<body>
	
<%@ include file="../include/header.jsp" %>

<article>
	<div id ="mainImg">
		<div id ="mainImgFade">
			<ul>
				<li><a><img src="./resources/img/main/main/main1.png"></a></li>
			</ul>
		</div>
	</div>
	
	<div id = "mainBoard">
		<div>
			<span>공지사항</span>
			<table>
				<tr>
					<th>내용</th>
					<th>날짜</th>
				</tr>
				<c:if test="${!empty noticeList }">
					<c:forEach items="${noticeList }" var="nList">
						<tr>
							<td><a href="/final/notice/content.do?pageNum=1&boardNum=${nList.boardNum }">${nList.title }</a></td>
							<td>${fn:substring(nList.writeDate,0,10) }</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty noticeList }">
					<tr>
						<td colspan="2">게시글이 없습니다.</td>
					</tr>
				</c:if>
				
			</table>
			<span><a href="/final/notice/list.do?pageNum=1">더보기...</a></span>
		</div>
		<div>
			<span>자유게시판</span>
			<table>
				<tr>
					<th>내용</th>
					<th>날짜</th>
				</tr>
				<c:if test="${!empty freeList }">
					<c:forEach items="${freeList }" var="fList">
						<tr>
							<th><a href="/final/freeBoard/content.do?pageNum=1&boardNum=${fList.boardNum }">${fList.title }</a></th>
							<td>${fn:substring(fList.writeDate,0,10) }</td>
						</tr>
					</c:forEach>
				</c:if>
				
				<c:if test="${empty freeList }">
					<tr>
						<td colspan="2" style="text-align: center;">게시글이 없습니다.</td>
					</tr> 
				</c:if>
			</table>
			<span><a href ="/final/freeBoard/list.do?pageNum=1">더보기...</a></span>
		</div>
		<div>
			<span>학원소식</span>
			<table>
				<tr>
					<th>내용</th>
					<th>날짜</th>
				</tr>
				<tr>
					<td>내용</td>
					<td>날짜</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>날짜</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>날짜</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>날짜</td>
				</tr>
			</table>
			<span><a>더보기...</a></span>
		</div>
		<div>
			<span>임시테이블</span>
			<table>
				<tr>
					<th>내용</th>
					<th>날짜</th>
				</tr>
				<tr>
					<td>내용</td>
					<td>날짜</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>날짜</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>날짜</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>날짜</td>
				</tr>
			</table>
			<span><a>더보기...</a></span>
		</div>
	</div>

	
</article>

<%@ include file="../include/footer.jsp"  %>
    
</body>
</html>