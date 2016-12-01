
	value="";
	
	function sendMail(c){
		var type = c;
		
		var em = document.getElementById("email");
		var num = document.getElementById("num");
		var text ="";
		var str = "";
		if(c == "id"){
			var text = document.getElementById("name");
			str = "이름을 입력해주세요";
		}else if (c=="pass"){
			var text =document.getElementById("id");
			str = "아이디를 입력해주세요";
			
		}
		alert(text.value);
		
		if(text.value == ""){
			alert(str);
			text.focus();
			return false;
		}
		if(em.value == ""){
			alert("이메일을 입력해주세요");
			em.focus();
			return false;
		}
		$.ajax({
			url : "/final/findIdMail.json",
			data : {type : type, text : text.value, email: em.value},
			type : "POST",
			dataType : "json",
			error: function(xhr){
				alert("실패 ㅠㅠ" + xhr.statusText);
			},
			success : function(data){
				alert("인증번호가 발송되었습니다. \n인증번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해주세요.");
				num.value = "";
				num.disabled = false;
				value = data.data.num;
				document.fr.sbText.value = text.value;
				document.fr.sbEmail.value = em.value;
			}
		});
		
	}
	
	function check(){
		var num = document.getElementById("num");
		
		if(num.value == ""|| num.value.length != 6){
			alert("인증번호를 정확히 입력하세요");
			num.focus();
			return false;
		}
		
		$.ajax({
			url : "/final/numberCheck.json",
			data : {postNum:value,inputNum:num.value},
			type : "POST",
			
			dataType : "json",
			error: function(xhr){
				alert("실패 ㅠㅠ" + xhr.statusText);
			},
			success:function(data){
				if(data.result=="true"){
					document.fr.submit();
				}else{
					alert("잘못된 인증번호입니다. 인증번호를 확인한 다음 다시 입력해주세요.");
					num.value = "";
					return false;
				}
			}
		});
		return false;
	}
	
	