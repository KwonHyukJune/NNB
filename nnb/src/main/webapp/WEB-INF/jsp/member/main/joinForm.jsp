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
			<input type="text" id="mem_id" name="mem_id" placeholder="���̵�" > 
			<a href="#this" class="btn" id="idCheck">���̵� �ߺ� Ȯ��</a>
			<br>
			<div id = "chkMsg"></div>
			<br>
			
			<input type="password" id="mem_pw" name="mem_pw" placeholder="��й�ȣ"> 
			<br> 
			
			<input type="password" id="password2" placeholder="��й�ȣ Ȯ��"> 
			<br> 
			
			<div id="lblError"></div>
			<br>
			
			<input type="text" id="mem_name" name="mem_name" placeholder="�̸�"> 
			<br> 
			
			<input type="text" id="mem_nick" name="mem_nick" placeholder="�г���">
			<a href="#this" class="btn" id="nickCheck">�г��� �ߺ� Ȯ��</a> 
			<br> 
			
			<div id = "chkMsg2"></div>
			<br>
			
			<input type="hidden" id="mem_email" name="mem_email">
			<input type="text" id="email1" name="email1" placeholder="�̸���"> @ 
			<input type="text" id="email2" name="email2" value=""> 
			
			<select id="email">
				<option>�����Է�</option>
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
			
			<input type="radio" id="normal" name="mem_kind" value="normal">�Ϲ�ȸ�� 
			<input type="radio" id="lessor" name="mem_kind" value="lessor">�Ӵ�ȸ��
			<br>

			<div class="terms">
				<iframe src=""></iframe>
			</div>
			<input type="checkbox">�����մϴ�.
			<br> 
			

		</form>

		<a href="#this" class="btn" id="join">ȸ������</a> 
		<a href="#this" class="btn" onclick="back();">���</a>
	</div>
	
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
	
	$(document).ready(function() { //ȸ������ (�ȵ�)
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
	
	$(document).ready(function() { //ȸ������ (�ȵ�)
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