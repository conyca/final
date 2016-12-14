<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- pc mypage aside  -->
<aside id="pcAside">
	<div>
		<ul>
			<c:if test="${sessionScope.category eq 0 }">
				<li>
					<a href="askForm.do">정회원 신청</a>
				</li>
			</c:if>	
			<c:if test="${sessionScope.category >= 1 && sessionScope.category <= 4 }">
				<li>
					<a href="cancel.do">정회원 신청 취소</a>
				</li>
			</c:if>	
			<li>
				<a href ="myPage.do">회원 정보</a>
			</li>
			<li>
				<a href="infoChangeForm.do">회원 정보 변경</a>
			</li>
			<li>
				<a href="inquiry.do">문의 내역 및 답변</a>
			</li>
			<li>
				<a href ="withdrawalForm.do">탈퇴</a>
			</li>
		</ul>
	</div>
</aside>
    