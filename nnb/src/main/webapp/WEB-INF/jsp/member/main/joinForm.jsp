<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>


<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>


<body>
	<%@ include file="/WEB-INF/include/header.jspf"%>

	<div class="join">
		<img src="NINAEBANG">
		<form id="joinForm" method="post">
			<input type="text" id="mem_id" name="mem_id" placeholder="아이디" > 
			<a href="#this" class="btn" id="idCheck">아이디 중복 확인</a>
			<br>
			<div id = "chkMsg"></div>
			<br>
			
			<input type="password" id="mem_pw" name="mem_pw" placeholder="비밀번호"> 
			<br> 
			
			<input type="password" id="password2" placeholder="비밀번호 확인"> 
			<br> 
			
			<div id="lblError"></div>
			<br>
			
			<input type="text" id="mem_name" name="mem_name" placeholder="이름"> 
			<br> 
			
			<input type="text" id="mem_nick" name="mem_nick" placeholder="닉네임">
			<a href="#this" class="btn" id="nickCheck">닉네임 중복 확인</a> 
			<br> 
			
			<div id = "chkMsg2"></div>
			<br>
			
			<input type="hidden" id="mem_email" name="mem_email">
			<input type="text" id="email1" name="email1" placeholder="이메일"> @ 
			<input type="text" id="email2" name="email2" value=""> 
			
			<select id="email">
				<option>직접입력</option>
				<option>naver.com</option>
				<option>hanmail.net</option>
				<option>gmail.com</option>
				<option>nate.com</option>
			</select> 
			<br>
			
			<input type="hidden" id="mem_phone" name="mem_phone">
			<select id="phone1" name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select> 
			
			<input type="number" id="phone2" name="phone2"> 
			<input type="number" id="phone3" name="phone3">
			<br>
			
			<input type="radio" id="normal" name="mem_kind" value="normal">일반회원 
			<input type="radio" id="lessor" name="mem_kind" value="lessor">임대회원
			<br>

			<div class="terms">
				<iframe src=""></iframe>
			</div>
			<input type="checkbox">동의합니다.
			<br> 
			

		</form>

		<a href="#this" class="btn" id="join">회원가입</a> 
		<a href="#this" class="btn" onclick="back();">취소</a>
	</div>
	
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
	
	$(document).ready(function() { //회원가입 (안됨)
		$("#idCheck").on("click", function(e) {
			e.preventDefault();
			fn_idCheck();
		});
	});

	function fn_idCheck(){
	    var mem_id = {mem_id : $('#mem_id').val()};
	    $.ajax({
	        url:"<c:url value='/join/idCheck'/>",
	        type:'get',
	        data: mem_id,
	        success:function(data){	        	
	            if($.trim(data)=="0"){
	            	$('#chkMsg').html("사용가능한 아이디 입니다.").css("color", "blue");         
	            }else{
	            	$('#chkMsg').html("사용불가능한 아이디 입니다.").css("color", "red");
	            }
	        },
	        error:function(){
	                alert("에러입니다");
	        }
	    });
	};
	
	$(document).ready(function() { //회원가입 (안됨)
		$("#nickCheck").on("click", function(e) {
			e.preventDefault();
			fn_nickCheck();
		});
	});

	function fn_nickCheck(){
	    var mem_nick = {mem_nick : $('#mem_nick').val()};
	    $.ajax({
	        url:"<c:url value='/join/nickCheck'/>",
	        type:'get',
	        data: mem_nick,
	        success:function(data){	        	
	            if($.trim(data)=="0"){
	            	$('#chkMsg2').html("사용가능한 닉네임 입니다.").css("color", "blue");         
	            }else{
	            	$('#chkMsg2').html("사용불가능한 닉네임입니다.").css("color", "red");
	            }
	        },
	        error:function(){
	                alert("에러입니다");
	        }
	    });
	};
	
	$(document).ready(function(){
			$("#email").change(function(){
				$("#email2").val($(this).val());
			});
		});
	
	$(document).ready(function() { //비밀번호 일치 확인
        //[1] lblError 레이어 클리어
        $('#mem_pw').keyup(function() {
            //$('#lblError').remove(); // 제거
            $('#lblError').text(''); // 제거가 아니라 클리어
            	$('#password2').val('');
        });
        //[2] 암호 확인 기능 구현
        $('#password2').keyup(function() {
            if ($('#mem_pw').val() != $('#password2').val()) {
                $('#lblError').text(''); // 클리어
                $('#lblError').html("암호가 일치하지 않습니다."); //레이어에 HTML 출력
            }
            else {
                $('#lblError').text(''); // 클리어
                $('#lblError').html("암호가 일치합니다.");
            }
        });
    });
	
	$(document).ready(function() { 
		$("#join").on("click", function(e) {
			e.preventDefault();
			fn_join();
		});
	});
	
	function fn_join(joinForm) {
		var comSubmit = new ComSubmit("joinForm");
		comSubmit.setUrl("<c:url value='/join/emailAuth'/>");
		var email = $("#email1").val()+"@"+$("#email2").val();
		var phone = $("#phone1").val()+$("#phone2").val()+$("#phone3").val();
		$("#mem_email").val(email);
		$("#mem_phone").val(phone);
		comSubmit.submit();
	}
	
	</script>

	<%@ include file="/WEB-INF/include/footer.jspf"%>
</body>
</html>