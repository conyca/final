<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="./resources/js/jquery/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	function changeCaptcha(){
		$('#captcha').html('<img src="test2.do?rand='+Math.random()+'"/>');
	}
	function winPlayer(objUrl){
		$('#audiocaptcha').html('<bgsound src="'+objUrl+'">');
	}
	
	function audioCaptcha(type){
		var kor = (type > 0) ? "lan=kor&":"";
		var kor2 = "lan=kor";
		alert(kor);
		var uAgent = navigator.userAgent;
		var soundUrl = 'test3.do';
		if(uAgent.indexOf('Trident') > -1 || uAgent.indexOf('MSIE')>-1){
			winplayer(soundUrl+'?'+kor+'agent=msie&rand='+Math.random());
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
			if(!$('#answer').val()){
				alert('이미지에 보이는 숫자 또는 음성을 통해 들리는 숫자를 입력해주세요.');
			}else{
				ajax({
					url:'test3.do',
					type:'POST',
					data:'answer='+$('#answer').val(),
					async:false,
					success:function(resp){
						alert(resp);
						$('#reLoad').click();
						$('#answer').vla("");
					}
				});
			}
		});
	});
	
</script>
</head>
<body>
	<div id="captcha">Wait...</div>
	<div id="audiocaptcha" style="display: none;"></div>
	<input type = "button" id = "reLoad" value="새로고침">
	<input type = "button" id = "soundOn" value = "음성 듣기">
	<input type = "button" id = "soundOnKor" value="한글 음성">
	<br>
	<input type="text" id="answer" name ="answer" value="">
	<input type="button" id="frmSubmit" value="확인">
 	
</body>
</html>