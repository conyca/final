<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<header>
	<div id = "logo" >
		<a href ="main.do">
			<img src="./resources/img/main/header/logo.png">
		</a>
	</div>
	<div id = "tnb" >
		<ul>
			<c:choose>
				<c:when test="${!empty id }">
					<li><a>아이디</a></li>
					<li><a>마이페이지</a></li>
					<li><a>고객센터</a></li>
					<li><a href="logout.do">로그아웃</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="loginForm.do">로그인</a></li>
					<li><a href="joinForm.do">회원가입</a></li>
					<li><a>고객센터</a></li>
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
</header>