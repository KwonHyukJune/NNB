<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>


<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css'/>"/>
<script type="text/javascript">
	
	$(document).ready(function() {
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
	
	$(document).ready(function() {
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
		var chk = $("input[name=agree_required]");
		if(!$("#mem_id").val()){
			alert("아이디를 입력해주세요.");
			$("#mem_id").focus();
			return false;
		}
		if($("#chkMsg").html()!="사용가능한 아이디 입니다."){
			alert("아이디 중복확인을 해주세요.");
			return false;
		}
		if(!$("#mem_pw").val()){
			alert("비밀번호를 입력해주세요.");
			$("#mem_pw").focus();
			return false;
		}
		if(!$("#password2").val()){
			alert("비밀번호 확인을 입력해주세요.");
			$("#password2").focus();
			return false;
		}
		if($("#lblError").html()!="암호가 일치합니다."){
			alert("암호가 일치하지 않습니다.");
			return false;
		}
		if(!$("#mem_name").val()){
			alert("이름을 입력해주세요.");
			$("#mem_name").focus();
			return false;
		}
		if(!$("#mem_nick").val()){
			alert("닉네임을 입력해주세요.");
			$("#mem_nick").focus();
			return false;
		}
		if($("#chkMsg2").html()!="사용가능한 닉네임 입니다."){
			alert("닉네임 중복확인을 해주세요.");
			return false;
		}
		if(!$("#email1").val() || !$("#email2").val()){
			alert("이메일을 입력해주세요.");
			if(!$("#email1").val()){
				$("#email1").focus();
			}else{
				$("#email2").focus();
			}
			return false;
		}
		if(!$("#phone2").val() || !$("#phone3").val()){
			alert("연락처를 입력해주세요.");
			if(!$("#phone2").val()){
				$("#phone2").focus();
			}else{
				$("#phone3").focus();
			}
			return false;
		}
		var type = $("input[name='mem_kind']");
		if(type[0].checked==false && type[1].checked==false){
			alert("회원 종류를 선택해주세요.");
			return false;
		}
		if(chk[0].checked==false){
			alert("서비스 이용약관에 동의해주세요.");
			return false;
		}
		var comSubmit = new ComSubmit("joinForm");
		comSubmit.setUrl("<c:url value='/join/emailAuth'/>");
		var email = $("#email1").val()+"@"+$("#email2").val();
		var phone = $("#phone1").val()+$("#phone2").val()+$("#phone3").val();
		$("#mem_email").val(email);
		$("#mem_phone").val(phone);
		comSubmit.submit();
	}
	$("#joinForm").on("submit",function(e){
	});
	</script>
</head>


<body>
	<%@ include file="/WEB-INF/include/header.jspf"%>

	<div class="join fmOFyn">
	<div class="gsssVZ">
		<div class="eawcIp">
		<h1>회원가입</h1>
		</div>
		<form id="joinForm" method="post" class="gAswBM">
			<div class="jpYZaf">
				<div class="bhsJD">
					<input type="text" id="mem_id" name="mem_id" placeholder="아이디" class="jYdxqx2 kTQnUD"> 
					<button class="kvrxoz2" onclick="fn_idCheck();" type="button">아이디 중복 확인</button>
				</div>
				<span id = "chkMsg"></span>
				
				<div class="bhsJD">
					<input type="password" id="mem_pw" name="mem_pw" placeholder="비밀번호" class="jYdxqx kTQnUD"> 
				</div>
				
				<div class="bhsJD">
					<input type="password" id="password2" placeholder="비밀번호 확인" class="jYdxqx kTQnUD"> 
				</div>
				<span id="lblError"></span>
				
				
				<div class="bhsJD">
					<input type="text" id="mem_name" name="mem_name" placeholder="이름" class="jYdxqx kTQnUD"> 
				</div>
				
				<div class="bhsJD">
					<input type="text" id="mem_nick" name="mem_nick" placeholder="닉네임" class="jYdxqx2 kTQnUD">
					<button class="kvrxoz2" onclick="fn_nickCheck();" type="button">닉네임 중복 확인</button>
				</div>
				<span id="chkMsg2"></span>
				
				
				<div class="bhsJD">
					<input type="hidden" id="mem_email" name="mem_email">
					<input type="text" id="email1" name="email1" placeholder="이메일" class="dhAhwQ kTQnUD"> 
					<p class="iOEIhG">@</p>
					<input type="text" id="email2" name="email2" value="" class="GDYdP kTQnUD"> 
				
					<select id="email" class="gPbYuA hRFrgm">
						<option>직접입력</option>
						<option>naver.com</option>
						<option>hanmail.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
					</select> 
				</div>
				
				<div class="bhsJD">
					<input type="hidden" id="mem_phone" name="mem_phone" class="jYdxqx kTQnUD">
					<select id="phone1" name="phone1" class="bJfKMv hRFrgm">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select> 
					<p class="iZIhov">-</p>
					<input type="number" id="phone2" name="phone2" class="hBLrdP kTQnUD"> 
					<p class="iZIhov">-</p>
					<input type="number" id="phone3" name="phone3" class="hBLrdP kTQnUD">
				</div>
				
				<div class="bhsJD">
					<label class="imdae iULJvV2">
						<input type="radio" id="normal" name="mem_kind" value="normal" class="ebouDA">
						<svg width="30" height="30" viewBox="0 0 31 31">
							<g fill="none" fill-rule="evenodd">
								<g>
									<circle class="Circle__fill" cx="15.5" cy="15.5" r="15.5"></circle>
									<circle class="Circle__border" cx="15.5" cy="15.5" r="14.9" stroke-width="1.2"></circle>
								</g>
								<path class="Circle__check" stroke-width="2.4" d="M7.154 15.369l6.027 6.027L23.846 10.73"></path>
							</g>
						</svg>
						<h1 class="ebOKOI">일반회원</h1>
					</label>
					<label class="imdae iULJvV2">
						<input type="radio" id="lessor" name="mem_kind" value="lessor" class="ebouDA">
						<svg width="30" height="30" viewBox="0 0 31 31">
							<g fill="none" fill-rule="evenodd">
								<g>
									<circle class="Circle__fill" cx="15.5" cy="15.5" r="15.5"></circle>
									<circle class="Circle__border" cx="15.5" cy="15.5" r="14.9" stroke-width="1.2"></circle>
								</g>
								<path class="Circle__check" stroke-width="2.4" d="M7.154 15.369l6.027 6.027L23.846 10.73"></path>
							</g>
						</svg>
						<h1 class="ebOKOI">임대회원</h1>
					</label>
				</div>
	
				<div class="terms cjVNiy">
					<label class="styled__AgreeLabel-xfpugq-4 iULJvV">
						<h1 class="styled__AgreeTitle-xfpugq-6 ebOKOI">니내방 서비스 이용약관 동의 <span>(필수)</span></h1>
						<input type="checkbox" class="styled__CheckBox-xfpugq-5 ebouDA" name="agree_required">
						<svg width="30" height="30" viewBox="0 0 31 31">
							<g fill="none" fill-rule="evenodd">
								<g>
									<circle class="Circle__fill" cx="15.5" cy="15.5" r="15.5"></circle>
									<circle class="Circle__border" cx="15.5" cy="15.5" r="14.9" stroke-width="1.2"></circle>
								</g>
								<path class="Circle__check" stroke-width="2.4" d="M7.154 15.369l6.027 6.027L23.846 10.73"></path>
							</g>
						</svg>
					</label>
					<div class="lReCa">
						<iframe src="https://s3-ap-northeast-1.amazonaws.com/dabang-static/html/station3_180816_dabang_serviceaccessterms.html"
							scrolling="yes" width="100%" height="100%" frameborder="0" allowtransparency="true"></iframe>
					</div>
				</div>
			</div>
			<button class="kvrxoz3" id="join">회원가입</button>
			<button class="kvrxoz3" onclick="back();">취소</button>

		</form>

	</div>
	</div>
	
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>


	<%@ include file="/WEB-INF/include/footer.jspf"%>
</body>
</html>