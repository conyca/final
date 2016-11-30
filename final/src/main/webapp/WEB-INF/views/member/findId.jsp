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
<link rel="stylesheet" href="./resources/css/member/find/findStyle.css">
<script src="./resources/js/jquery/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	
	value="";
	
	function sendMail(){
		var nm = document.getElementById("name");
		var em = document.getElementById("email");
		var num = document.getElementById("num");
		
		if(nm.value == ""){
			alert("이름을 입력해주세요");
			nm.focus();
			return false;
		}
		if(em.value == ""){
			alert("이메일을 입력해주세요");
			em.focus();
			return false;
		}
		$.ajax({
			url : "/final/findIdMail.json",
			data : {name : nm.value, email: em.value},
			type : "POST",
			dataType : "json",
			error: function(xhr){
				alert("실패 ㅠㅠ" + xhr.statusText);
			},
			success : function(data){
				if(data.data.result == "Y"){
					num.value = "";
					num.disabled = false;
					value = data.data.num;
				}
					num.disabled = false;
			}
		});
		
	}
	
	function check(){
		var num = document.getElementById("num")
		
		if(num.value == ""|| num.value.length != 6){
			alert("인증번호를 정확히 입력하세요");
			num.focus();
			return false;
		}
		alert(value);
		
		$.ajax({
			url : "/final/numberCheck.json",
			data : {postNum:value,inputNum:num},
			type : "POST",
			
			dataType : "json",
			error: function(xhr){
				alert("실패 ㅠㅠ" + xhr.statusText);
			},
			success:function(data){
				if(data.result=="true"){
					alert("된다?");
				}else{
					alert("안된다?");
				}
			}
		});
		return false;
	}
	
	
	
</script> 
</head>
<body>
	
	<%@ include file="../include/header.jsp" %>
	
	<article>
		<div>
			<form action=""  method ="post" >
				<fieldset>
					<legend class="blind">아이디 찾기</legend>
					<div>이름 : 
						<input type="text" name ="name" id ="name"><br>
						이메일 :
						<input type="email" name ="email" id = "email">
						<input type="button" value="인증번호 받기" onclick="sendMail();"><br>
						<input type="text" value="인증번호 6자 입력" id ="num" disabled="disabled">
					</div>
				</fieldset>
				
				<input type="button" value ="확인" onclick="check();">
			</form>
		</div>
		
	</article>
	
	<%@ include file="../include/footer.jsp"  %>
</body>
</html>