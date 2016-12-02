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
	function changeCaptcha(){
		$('#captcha').html('<img src="captcha.do?rand='+Math.random()+'"/>');
	}
	function winPlayer(objUrl){
		$('#audiocaptcha').html('<bgsound src="'+objUrl+'">');
	}
	
	function audioCaptcha(type){
		// type - 0 : 영문
		// type - 1 : 한글
		// 영문은 삭제함
		var kor = (type > 0) ? "lan=kor&":"";
		var kor2 = "lan=kor";
		alert(kor);
		var uAgent = navigator.userAgent;
		var soundUrl = 'audioCaptCha.do';
		if(uAgent.indexOf('Trident') > -1 || uAgent.indexOf('MSIE')>-1){
			winPlayer(soundUrl+'?'+kor+'agent=msie&rand='+Math.random());
		}else if(!!document.createElement('audio').canPlayType){
			try{
				if(type > 0){
					new Audio(soundUrl+'?'+kor2).play();
				}else{
					new Audio(soundUrl).play();
				}
			}catch(e){
				if(type > 0){
				winPlayer(soundUrl+'?'+kor2);
				}else{
				winPlayer(soundUrl);
					
				}
			}
		}else{
			window.open(soundUrl, '', 'width=1,height=1');
		}
	}
	
	$(function(){
		changeCaptcha();
		
		$('#reLoad').on("click",function(){changeCaptcha();});
		$('#soundOn').on("click",function(){audioCaptcha(0);});
		$('#soundOnKor').on("click",function(){audioCaptcha(1);});
		$('#frmSubmit').on("click",function(){
			if(!$('#pass').val()){
				alert("비밀번호를 입력해주세요");
				$('#pass').focus();
				return false;
			}
			if(!$('#passCheck').val()){
				alert("비밀번호 확인을 입력해주세요");
				$('#passCheck').focus();
				return false;
			}
			if($('#pass').val()!=$('#passCheck').val()){
				alert("비밀번호 확인이 일치하지 않습니다.");
				$('#pass').val("");
				$('#passCheck').val("");
				$('#pass').focus();
				return false;
			}
			
			if(!$('#answer').val()){
				alert('이미지에 보이는 숫자 또는 음성을 통해 들리는 숫자를 입력해주세요.');
			}else{
				$.ajax({
					url:'captchaCheck.json',
					type:'POST',
					data:'answer='+$('#answer').val(),
					dataType : "json",
					async:false,
					success:function(data){
						if(data.result == "Y"){
							if(confirm("비밀번호를 변경합니다.")==true){
								document.fr.submit();
							}
						}else{
							alert("잘못된 자동입력 방지문자입니다. 확인한 후 다시 입력해 주세요.");
						}
					}
				});
			}
		});
	});


</script>
</head>
<body>
	
	<%@ include file="../include/header.jsp" %>
	
	<article>
		<div>
			<form action="changPass.do" name = "fr">
				<input type ="hidden" name="returnUrl" value="${returnUrl }">
				<input type ="hidden" name="id" value ="${id }">
				<fieldset>
					<legend class="blind">비밀번호 변경</legend>
					
					아이디 : <c:out value="${id }"></c:out>
					<div>
						<input type ="password" placeholder="새 비밀번호" id="pass" name = "pass">
						<input type ="password" placeholder="새 비밀번호 확인" id="passCheck">
					</div>
					
					
				</fieldset>
				
			</form>
			<div>
				<div id="captcha">Wait...</div>
				<div id="audiocaptcha" style="display: none;"></div>
				<input type = "button" id = "reLoad" value="새로고침">
				<input type = "button" id = "soundOnKor" value="음성 듣기"><br>
				모바일에선 음성이 지원하지 않을 수 있습니다.
				<br>
				<input type="text" id="answer" name ="answer" value="">
				<input type="button" id="frmSubmit" value="확인">
			</div>
		
		</div>
		
	</article>
	
	<%@ include file="../include/footer.jsp"  %>
</body>
</html>