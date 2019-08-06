<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>


<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css'/>"/>
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
					<button class="kvrxoz2" onclick="idCheck();">아이디 중복 확인</button>
					<span id = "chkMsg"></span>
				</div>
				
				<div class="bhsJD">
					<input type="password" id="mem_pw" name="mem_pw" placeholder="비밀번호" class="jYdxqx kTQnUD"> 
				</div>
				
				<div class="bhsJD">
					<input type="password" id="password2" placeholder="비밀번호 확인" class="jYdxqx kTQnUD"> 
				</div>
				
				<div id="lblError"></div>
				
				<div class="bhsJD">
					<input type="text" id="mem_name" name="mem_name" placeholder="이름" class="jYdxqx kTQnUD"> 
				</div>
				
				<div class="bhsJD">
					<input type="text" id="mem_nick" name="mem_nick" placeholder="닉네임" class="jYdxqx2 kTQnUD">
					<button class="kvrxoz2" onclick="nickCheck();">닉네임 중복 확인</button>
				</div>
				
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
	<script type="text/javascript">
	
/* 	
	$(document).ready(function() { //회원가입 (안됨)
		$("#idCheck").on("click", function(e) {
			e.preventDefault();
			fn_idCheck();
		});
	});
	 */
	function idCheck(){
	    var mem_id = $('#mem_id').val();
	    $.ajax({
	        url:'/join/idCheck',
	        type:'post',
	        data:{"mem_id":mem_id},
	        success:function(data){
	            if($.trim(data)==0){
	            	$('#chkMsg').html("사용가능");         
	            }else{
	            	$('#chkMsg').html("사용불가"); 
	            }
	        },
	        error:function(){
	                alert("에러입니다");
	        }
	    });
	};
	
	
	
	
	
	
	
	
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
	
	$(document).ready(function() { //회원가입 (안됨)
		$("#join").on("click", function(e) {
			e.preventDefault();
			fn_join();
		});
	});
	
	function fn_join(joinForm) { //회원가입 (안됨)
		var comSubmit = new ComSubmit("joinForm");
		comSubmit.setUrl("<c:url value='/join/emailAuth'/>");
		var email = $("#email1").val()+"@"+$("#email2").val();
		var phone = $("#phone1").val()+$("#phone2").val()+$("#phone3").val();
		$("#mem_email").val(email);
		$("#mem_phone").val(phone);
		comSubmit.submit();
	}
	$("#joinForm").on("submit",function(e){
		var chk = $("input[name=agree_required]");
		console.log(chk);
	});
	</script>

	<%@ include file="/WEB-INF/include/footer.jspf"%>
</body>
</html>