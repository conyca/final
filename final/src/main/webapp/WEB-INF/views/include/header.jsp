<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="./resources/js/jquery/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function(){
	winsdowSize();
	$("#mobileAside").hide();
	$("#myPageClose").on("click",function(){
		$("#mobileAside").hide("slide");
	});
});  
function winsdowSize(){
	var index = 0;
	$("#mobileAside div ul li").each(function(){
		index += 1;
	});
	$("#mobileAside div ul li").css("height", (document.body.clientHeight)/index );
	
	if(document.body.clientWidth <= 736){
		$("#myPageBtn").on("click",function(){
			$("#mobileAside").show("slide", { direction: "left"  }, 500 );
		});  
	}else{
		$("#mobileAside").hide();
	}
// 	$("#logo").css()
	
}
window.onresize = winsdowSize;

</script>
	
<header>
	<div id = "myPageBtn" class="hiddenBtn"></div>
	
	<div id = "logo" >
		<a href ="main.do">
			<img src="resources/img/main/header/logo.png">
		</a>
	</div>
	
	<div id = "tnb" >
		<ul>
			<c:choose>
				<c:when test="${!empty sessionScope.id }">
					<li><a>${sessionScope.name }</a></li>
					<li><a href="myPage.do">마이페이지</a></li>
					<li><a>고객센터</a></li>
					<li><a href="logout.do">로그아웃</a></li>
				</c:when>
				<c:otherwise>
					<c:if test="${fn:length(param.returnUrl)>0 }">
						<li><a href="loginForm.do?returnUrl=${param.returnUrl }">로그인</a></li>
						<li><a href="joinForm.do?returnUrl=${param.returnUrl }">회원가입</a></li>
						<li><a>고객센터</a></li>
					</c:if>
					<c:if test="${(empty param.returnUrl) or (fn:length(param.returnUrl)==0) }">
						<li><a href="loginForm.do?returnUrl=${returnUrl }">로그인</a></li>
						<li><a href="joinForm.do?returnUrl=${returnUrl }">회원가입</a></li>
						<li><a>고객센터</a></li>
					</c:if>
						
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	<div id = "gnb" >
		<ul>
			<li><a>학원소개</a></li>
			<li><a>선생님</a></li>
			<li><a>학부형</a></li>
			<li><a>학생</a></li>
			<li><a>커뮤니티</a></li>
		</ul>
	</div>
	
	<%@include file = "myPageSaid.jsp" %>
	
</header>