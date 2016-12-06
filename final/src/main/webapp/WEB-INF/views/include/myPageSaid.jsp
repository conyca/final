<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<aside id="mobileAside">
	<div>
		<ul>
			<li>
				<div>
					<c:if test="${!empty sessionScope.id }">
						${sessionScope.id }
					</c:if>
					<c:if test="${empty sessionScope.id}">
						<c:if test="${fn:length(param.returnUrl)>0 }">
							<a href="loginForm.do?returnUrl="${param.returnUrl }>로그인</a>
						</c:if>
						<c:if test="${(empty param.returnUrl) or (fn:length(param.returnUrl)==0) }">
							<a href="loginForm.do?returnUrl="${returnUrl }>로그인</a>
						</c:if>
					</c:if>
					<c:if test="${sessionScope.category == 0}">
						(일반 회원)
					</c:if>
					<c:if test="${sessionScope.category >= 1 &&  sessionScope.category < 5}">
					<!-- 대기 -->
						<c:choose>
							<c:when test="${sessionScope.category eq 1 }">
								(학생 신청 대기중...)
							</c:when>
							<c:when test="${sessionScope.category eq 2 }">
								(학부모 신청 대기중...)
							</c:when>
							<c:when test="${sessionScope.category eq 3 }">
								(선생님 신청 대기중...)
							</c:when>
							<c:when test="${sessionScope.category eq 4 }">
								(직원 신청 대기중...)
							</c:when>
						</c:choose>
						
						<div><a href = "">대기 취소</a></div>
					</c:if>
					
					
					
					<c:if test="${sessionScope.category >= 5 }">
					<!-- 회원 -->
						<c:choose>
							<c:when test="${sessionScope.category eq 5 }">
								(학생)
							</c:when>
							<c:when test="${sessionScope.category eq 6 }">
								(학부모)
							</c:when>
							<c:when test="${sessionScope.category eq 7 }">
								(선생님)
							</c:when>
							<c:when test="${sessionScope.category eq 8 }">
								(직원)
							</c:when>
							<c:when test="${sessionScope.category eq 10 }">
								(관리자)
							</c:when>
						</c:choose>
					</c:if>
					
					</div>
					<c:if test="${sessionScope.category eq 0 }">
						<div>
							<a href = "">정회원 신청하기</a>
						</div>
					</c:if>
					
				<div id = "myPageClose"></div>
			</li>
			
			<li class="gnbList" >
				<c:if test="${empty sessionScope.category}">
					<div style="width:100%; text-align: center;  line-height : 400%; vertical-align: middle;">로그인이 필요합니다.</div>
				</c:if>
				<c:if test="${sessionScope.category < 5 }">
					<div style="width:100%; text-align: center;  line-height : 400%; vertical-align: middle;">정회원이 아닙니다.</div>
				</c:if>
				<c:if test="${(sessionScope.category eq 5 )or(sessionScope.category eq 6) }">
					<div class="timeTableIcon">시간표</div>			
					<div class="telIcon">연락처</div>			
					<div class="subIcon">보충/보강</div>			
					<div class="adviceIcon">상담</div>			
					<div class="attendanceIcon">출석</div>			
					<div class="scheduleIcon">일정</div>		
					<c:if test="${sessionScope.category eq 5}">
						<div class="boardIcon">Class 게시판</div>	
					</c:if>
				</c:if>
				<c:if test="${sessionScope.category >= 7 }">
					<div class="timeTableIcon">시간표</div>			
					<div class="telIcon">연락처</div>			
					<div class="subIcon">보충/보강</div>			
					<div class="adviceIcon">상담</div>			
					<div class="attendanceIcon">출석</div>			
					<div class="scheduleIcon">일정</div>			
					<div class="smsIcon">SMS</div>
					<div class="boardIcon">Class 게시판</div>
				</c:if>
				
			</li>
			
			<li>
				공지사항
			</li>
			
			<li class= "memberItem">
				<div>
					<a href="myPage.do?returnUrl=${returnUrl }">회원 정보</a>
				</div>
				
				<div>
					<a href="">회원 정보 수정</a>
				</div>
				
				<div>
					<a href="">문의 내역 및 답변</a>
				</div>
				<div>
					<a href="">탈퇴</a>
				</div>
			</li>
			
			
			<li id = "lastLi">
				<c:if test="${!empty sessionScope.id  }">
					<div>
						<a href="">커뮤니티</a>
					</div>
					<div>
						<a href="">문의</a>
					</div>
					<div>
						<a href="logout.do">로그아웃</a>
					</div>
				</c:if>
				<c:if test="${empty sessionScope.id  }">
					<c:if test="${fn:length(param.returnUrl)>0 }">
						<div>
							<a href="joinForm.do?returnUrl=${param.returnUrl }">회원가입</a>
						</div>
						<div>
							<a href="findIdForm.do?returnUrl=${param.returnUrl }">아이디 찾기</a>
						</div>
						<div>
							<a href="findPassForm.do?returnUrl=${param.returnUrl }">비밀번호 찾기</a>
						</div>
					</c:if>
					<c:if test="${(empty param.returnUrl) or (fn:length(param.returnUrl)==0) }">
						<div>
							<a href="joinForm.do?returnUrl=${returnUrl }">회원가입</a>
						</div>
						<div>
							<a href="findIdForm.do?returnUrl=${returnUrl }">아이디 찾기</a>
						</div>
						<div>
							<a href="findPassForm.do?returnUrl=${returnUrl }">비밀번호 찾기</a>
						</div>
					</c:if>
				</c:if>
				
			</li>
			
		</ul>
	</div>





</aside>