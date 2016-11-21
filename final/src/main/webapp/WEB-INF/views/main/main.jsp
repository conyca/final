<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<!-- <meta name="viewport" content="width=device-width,initial-scale=1.0"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/main/mainStyle.css">
<script src="./resources/js/jquery/jquery-3.1.1.min.js"></script>
<script type="text/javascript"></script>
</head>
<body>
	
<%@ include file="../include/header.jsp" %>

<article>
	<div id ="mainImg">
		<div id ="mainImgFade">
			<ul>
				<li><a><img src="./resources/img/main/main/main1.png"></a></li>
				<li><a><img src=""></a></li>
			</ul>
		</div>
	</div>
	
	<div id = "mainBoard">
		<div>
			<table>
				<tr>
					<td></td>
					<td></td>
				</tr>
				<tr></tr>
			</table>
			<span>더보기</span>
		</div>
	</div>

	
</article>

<%@ include file="../include/footer.jsp"  %>
    
</body>
</html>