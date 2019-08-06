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
	            	$('#chkMsg').html("��밡���� ���̵� �Դϴ�.").css("color", "blue");         
	            }else{
	            	$('#chkMsg').html("���Ұ����� ���̵� �Դϴ�.").css("color", "red");
	            }
	        },
	        error:function(){
	                alert("�����Դϴ�");
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
	            	$('#chkMsg2').html("��밡���� �г��� �Դϴ�.").css("color", "blue");         
	            }else{
	            	$('#chkMsg2').html("���Ұ����� �г����Դϴ�.").css("color", "red");
	            }
	        },
	        error:function(){
	                alert("�����Դϴ�");
	        }
	    });
	};
	
	$(document).ready(function(){
			$("#email").change(function(){
				$("#email2").val($(this).val());
			});
		});
	
	$(document).ready(function() { //��й�ȣ ��ġ Ȯ��
        //[1] lblError ���̾� Ŭ����
        $('#mem_pw').keyup(function() {
            //$('#lblError').remove(); // ����
            $('#lblError').text(''); // ���Ű� �ƴ϶� Ŭ����
            	$('#password2').val('');
        });
        //[2] ��ȣ Ȯ�� ��� ����
        $('#password2').keyup(function() {
            if ($('#mem_pw').val() != $('#password2').val()) {
                $('#lblError').text(''); // Ŭ����
                $('#lblError').html("��ȣ�� ��ġ���� �ʽ��ϴ�."); //���̾ HTML ���
            }
            else {
                $('#lblError').text(''); // Ŭ����
                $('#lblError').html("��ȣ�� ��ġ�մϴ�.");
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
			alert("���̵� �Է����ּ���.");
			$("#mem_id").focus();
			return false;
		}
		if($("#chkMsg").html()!="��밡���� ���̵� �Դϴ�."){
			alert("���̵� �ߺ�Ȯ���� ���ּ���.");
			return false;
		}
		if(!$("#mem_pw").val()){
			alert("��й�ȣ�� �Է����ּ���.");
			$("#mem_pw").focus();
			return false;
		}
		if(!$("#password2").val()){
			alert("��й�ȣ Ȯ���� �Է����ּ���.");
			$("#password2").focus();
			return false;
		}
		if($("#lblError").html()!="��ȣ�� ��ġ�մϴ�."){
			alert("��ȣ�� ��ġ���� �ʽ��ϴ�.");
			return false;
		}
		if(!$("#mem_name").val()){
			alert("�̸��� �Է����ּ���.");
			$("#mem_name").focus();
			return false;
		}
		if(!$("#mem_nick").val()){
			alert("�г����� �Է����ּ���.");
			$("#mem_nick").focus();
			return false;
		}
		if($("#chkMsg2").html()!="��밡���� �г��� �Դϴ�."){
			alert("�г��� �ߺ�Ȯ���� ���ּ���.");
			return false;
		}
		if(!$("#email1").val() || !$("#email2").val()){
			alert("�̸����� �Է����ּ���.");
			if(!$("#email1").val()){
				$("#email1").focus();
			}else{
				$("#email2").focus();
			}
			return false;
		}
		if(!$("#phone2").val() || !$("#phone3").val()){
			alert("����ó�� �Է����ּ���.");
			if(!$("#phone2").val()){
				$("#phone2").focus();
			}else{
				$("#phone3").focus();
			}
			return false;
		}
		var type = $("input[name='mem_kind']");
		if(type[0].checked==false && type[1].checked==false){
			alert("ȸ�� ������ �������ּ���.");
			return false;
		}
		if(chk[0].checked==false){
			alert("���� �̿����� �������ּ���.");
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
		<h1>ȸ������</h1>
		</div>
		<form id="joinForm" method="post" class="gAswBM">
			<div class="jpYZaf">
				<div class="bhsJD">
					<input type="text" id="mem_id" name="mem_id" placeholder="���̵�" class="jYdxqx2 kTQnUD"> 
					<button class="kvrxoz2" onclick="fn_idCheck();" type="button">���̵� �ߺ� Ȯ��</button>
				</div>
				<span id = "chkMsg"></span>
				
				<div class="bhsJD">
					<input type="password" id="mem_pw" name="mem_pw" placeholder="��й�ȣ" class="jYdxqx kTQnUD"> 
				</div>
				
				<div class="bhsJD">
					<input type="password" id="password2" placeholder="��й�ȣ Ȯ��" class="jYdxqx kTQnUD"> 
				</div>
				<span id="lblError"></span>
				
				
				<div class="bhsJD">
					<input type="text" id="mem_name" name="mem_name" placeholder="�̸�" class="jYdxqx kTQnUD"> 
				</div>
				
				<div class="bhsJD">
					<input type="text" id="mem_nick" name="mem_nick" placeholder="�г���" class="jYdxqx2 kTQnUD">
					<button class="kvrxoz2" onclick="fn_nickCheck();" type="button">�г��� �ߺ� Ȯ��</button>
				</div>
				<span id="chkMsg2"></span>
				
				
				<div class="bhsJD">
					<input type="hidden" id="mem_email" name="mem_email">
					<input type="text" id="email1" name="email1" placeholder="�̸���" class="dhAhwQ kTQnUD"> 
					<p class="iOEIhG">@</p>
					<input type="text" id="email2" name="email2" value="" class="GDYdP kTQnUD"> 
				
					<select id="email" class="gPbYuA hRFrgm">
						<option>�����Է�</option>
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
						<h1 class="ebOKOI">�Ϲ�ȸ��</h1>
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
						<h1 class="ebOKOI">�Ӵ�ȸ��</h1>
					</label>
				</div>
	
				<div class="terms cjVNiy">
					<label class="styled__AgreeLabel-xfpugq-4 iULJvV">
						<h1 class="styled__AgreeTitle-xfpugq-6 ebOKOI">�ϳ��� ���� �̿��� ���� <span>(�ʼ�)</span></h1>
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
			<button class="kvrxoz3" id="join">ȸ������</button>
			<button class="kvrxoz3" onclick="back();">���</button>

		</form>

	</div>
	</div>
	
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>


	<%@ include file="/WEB-INF/include/footer.jspf"%>
</body>
</html>