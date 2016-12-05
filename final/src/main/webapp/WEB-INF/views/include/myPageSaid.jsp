<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<aside id="mobile">
	<div>
		<ul>
			<li>
				<div>${sessionScope.id }</div>
				<div id = "myPageClose"></div>
			</li>
			
			
			<c:if test="${sessionScope.category >= 1 &&  sessionScope.category < 5}">
			<!-- 대기 -->
				<li>
					<div>
						<c:choose>
							<c:when test="${sessionScope.category eq 1 }">
								학생 신청 대기중...
							</c:when>
							<c:when test="${sessionScope.category eq 2 }">
								학부모 신청 대기중...
							</c:when>
							<c:when test="${sessionScope.category eq 3 }">
								선생님 신청 대기중...
							</c:when>
							<c:when test="${sessionScope.category eq 4 }">
								직원 신청 대기중...
							</c:when>
						</c:choose>
					</div>
					<div><a href = "">대기 취소</a></div>
				</li>
			</c:if>
			
			<c:if test="${sessionScope.category >= 5 }">
			<!-- 회원 -->
				<li>
					<div>
						<c:choose>
							<c:when test="${sessionScope.category eq 5 }">
								학생
							</c:when>
							<c:when test="${sessionScope.category eq 6 }">
								학부모
							</c:when>
							<c:when test="${sessionScope.category eq 7 }">
								선생님
							</c:when>
							<c:when test="${sessionScope.category eq 8 }">
								직원
							</c:when>
							<c:when test="${sessionScope.category eq 10 }">
								관리자
							</c:when>
						</c:choose>
					</div>
				</li>
			</c:if>
			
			
			
			<li>
				<div>
					<a href="myPage.do?returnUrl=${returnUrl }">회원 정보</a>
				</div>
			</li>
			
			<li>
				<div>
					<a href="">회원 정보 수정</a>
				</div>
			</li>
			
			<li>
				<div>
					<a href="">문의 내역 및 답변</a>
				</div>
			</li>
			
			<li>
				<div>
					<a href="">탈퇴</a>
				</div>
			</li>
			
		</ul>
	</div>





</aside>