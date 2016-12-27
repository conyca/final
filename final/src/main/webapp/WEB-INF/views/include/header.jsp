<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/final/resources/js/jquery/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function(){
	winsdowSize();
	$("#mobileAside").hide();
	$("#myPageClose").on("click",function(){
		$("#mobileAside").hide("slide");
	});
	var wi = $(window).width();
	if(wi>=736){
		wi = 736;
	}else{
		wi =0;
	}
	

	
	$(window).resize(function(){
		if($(this).width()<736 && wi!=0){
			window.location.reload(false);
			wi=0;
		}
		if($(this).width()>=736 && wi != 736){
			window.location.reload(false);
			wi=736;
		}
	});
	  
});  

function upAndDown(c){
// 	console.log("width : " + document.body.clientWidth);
	var body = c;
	if($(window).width() <=736){
		$("#myPageBtn").on("click",function(){
			$("#mobileAside").show("slide", { direction: "left"  }, 500 );
		});  
		$(".gnbMenu").hide();
		$(".gnbMenu div").hide();
		
		// 모바일
		$("#teacher").on("click",function(){
			$(".gnbMenu").show();
			$("#gnbTeacher").show();
		});
		$("#parent").on("click",function(){
			$(".gnbMenu").show();
			$("#gnbParent").css("left", $(this).width());
			$("#gnbParent").show();
		});
		$("#student").on("click",function(){
			$(".gnbMenu").show();
			$("#gnbStudent").show();
		});
		$("#community").on("click",function(){
			$(".gnbMenu").show();
			$("#gnbCommunity").css("left", $(this).width());
			$("#gnbCommunity").show();
		});
		
		$(".gnbMenu").on("click",function(){
			$(".gnbMenu div").hide();
			$(".gnbMenu").hide();
		});
		
	}
	if($(window).width() >736){
		// pc
		$("#mobileAside").hide();
				
		$("#gnb").hover(function(){
			$(".gnbMenu").stop().show();
		},function(){
			$(".gnbMenu").stop().hide();
		});
		
		$(".gnbMenu").hover(function(){
			$(this).stop().show();
		},function(){
			$(this).stop().hide();
		});
	}
}



function winsdowSize(){
	var index = 0;
	$("#mobileAside div ul li").each(function(){
		index += 1;
	});
	$("#mobileAside div ul li").css("height", (document.body.clientHeight)/index );
	
	upAndDown(document.body.clientWidth);
	
	
	if(document.body.clientWidth <= 736){
// 		alert(document.body.clientWidth); 
		
	}else{
$("#mobileAside").hide();
		
// 		$("#gnb").hover(function(){
// 			$(".gnbMenu").stop().show();
// 		},function(){
// 			$(".gnbMenu").stop().hide();
// 		});
		
// 		$(".gnbMenu").hover(function(){
// 			$(this).stop().show();
// 		},function(){
// 			$(this).stop().hide();
// 		});
	}
// 	console.log("width : " + document.body.clientWidth);
// 	console.log("height : " + document.body.clientHeight);
// 	$("#logo").css()
	
}
window.onresize = winsdowSize;

</script>
	
<header>
	<div id = "myPageBtn" class="hiddenBtn"></div>
	
	<div id = "logo" >
		<a href ="/final/main.do"> 
			<img src="/final/resources/img/main/header/logo.png">
		</a>
	</div>
	
	<div id = "tnb" >
		<ul>
			<c:choose>
				<c:when test="${!empty sessionScope.id }">
					<li><a>${sessionScope.name }</a></li>
					<li><a href="/final/myPage.do">마이페이지</a></li>
					<li><a>고객센터</a></li>
					<li><a href="/final/logout.do">로그아웃</a></li>
				</c:when>
				<c:otherwise>
					<c:if test="${fn:length(param.returnUrl)>0 }">
						<li><a href="/final/loginForm.do?returnUrl=${param.returnUrl }">로그인</a></li>
						<li><a href="/final/joinForm.do?returnUrl=${param.returnUrl }">회원가입</a></li>
						<li><a>고객센터</a></li>
					</c:if>
					<c:if test="${(empty param.returnUrl) or (fn:length(param.returnUrl)==0) }">
						<li><a href="/final/loginForm.do?returnUrl=${returnUrl }">로그인</a></li>
						<li><a href="/final/joinForm.do?returnUrl=${returnUrl }">회원가입</a></li>
						<li><a>고객센터</a></li>
					</c:if>
						
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	<div id = "gnb" >
		<ul>
			<li><a>학원소개</a></li>
			<li id="teacher"><a>선생님</a></li>
			<li id="parent"><a>학부형</a></li>
			<li id="student"><a>학생</a></li>
			<li id="community"><a>커뮤니티</a></li>
		</ul>
	</div>
	
	
	
	<%@include file = "myPageSaid.jsp" %>
	<div class="gnbMenu" style="display: none;">
		<div>
		<!-- 학원소개 -->
			<ul>
				<li><a href="">학원소개</a></li>
				<li><a href="">모집안내</a></li>
				<li><a href="">교육안내</a></li>
				<li><a href="">선생님소개</a></li>
			</ul>
		</div>
		<div id="gnbTeacher">
		<!-- 선생님 -->
			<ul>
				<li><a href="">시간표</a></li>
				<li><a href="">연락처</a></li>
				<li><a href="">보충/보강</a></li>
				<li><a href="">상담</a></li>
				<li><a href="">출석</a></li>
				<li><a href="">일정</a></li>
				<li><a href="">SMS</a></li>
				<li><a href="">게시판</a></li>
			</ul>
		</div>
		<div id="gnbParent">
		<!-- 학부형 -->
			<ul>
				<li><a href="">시간표</a></li>
				<li><a href="">연락처</a></li>
				<li><a href="">보충/보강</a></li>
				<li><a href="">상담</a></li>
				<li><a href="">출석</a></li>
				<li><a href="">일정</a></li>
			</ul>
		</div>
		<div id="gnbStudent">
		<!-- 학생 -->
			<ul>
				<li><a href="">시간표</a></li>
				<li><a href="">연락처</a></li>
				<li><a href="">보충/보강</a></li>
				<li><a href="">상담</a></li>
				<li><a href="">출석</a></li>
				<li><a href="">일정</a></li>
				<li><a href="">게시판</a></li>
			</ul> 
		</div>
		<div id="gnbCommunity">
		<!-- 커뮤니티 -->
			<ul>
				<li><a href="/final/notice/list.do">공지사항</a></li>
				<li><a href="/final/freeBoard/list.do">자유게시판</a></li>
				<li><a href="/final/gallery/list.do">겔러리</a></li>
				<li><a href="">자료실</a></li>
			</ul>
		</div>
	</div>
</header>
