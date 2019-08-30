<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage.css'/>"/>
<script type="text/javascript">
$(document).ready(function(){
	$('#amyPage').addClass('active');
}); 
	var check = 0;
	function fn_nickCheck(){ 
		if($('#nickname').val()!="${map.MEM_NICK}"){
		    var mem_nick = {mem_nick : $('#nickname').val()};
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
		}else{
			$('#chkMsg2').html("��밡���� �г��� �Դϴ�.").css("color", "blue");
		}
	};
	$(document).ready(function(){
		$("#submit").on("click",function(e){
			e.preventDefault();
			fn_submit();
		});
		var emailArray = '${map.MEM_EMAIL}'.split('@');
		$("#email1").val(emailArray[0]);
		$("#email2").val(emailArray[1]);
		var phone1 = '${map.MEM_PHONE}'.substring(0,3);
		var phone2 = '${map.MEM_PHONE}'.substring(3,7);
		var phone3 = '${map.MEM_PHONE}'.substring(7,11);
		$("#phone2").val(phone2);
		$("#phone3").val(phone3);
		var key = $("select[name='phone1']>option");
		for(var i=0;i<key.length;i++){
			if(key[i].value==phone1){
				key[i].selected = true;
			}
		};
	});
	function fn_submit(){
		var emailval = $("#email1").val()+"@"+$("#email2").val();
		alert(emailval);
		var phoneval = $("#phone1").val()+$("#phone2").val()+$("#phone3").val();
		str = "<input type='hidden' name='mem_email' value='"+emailval+"'>"
			+ "<input type='hidden' name='mem_phone' value='"+phoneval+"'>";
		$("#frm").append(str);
		frm.submit();
/* 		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("modify");
		var email = $("#email1").val()+"@"+$("#email2").val();
		var phone = $("#phone1").val()+$("#phone2").val()+$("#phone3").val();
		$("#mem_email").val(email);
		$("#mem_phone").val(phone);
		comSubmit.submit();*/
		
	};
	/*
	�޴������� ��ũ��Ʈ -> identify()
	��ȣ �ٲ����� ���� �Ϸ��ش޶�� ��ũ��Ʈ -> validation()
	�г��� �ߺ�Ȯ��
	*/
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="myPage.jspf" %>

<div class="myPageInfoForm">

	<form id="frm" name="frm" method="post" action="modify">
	<div>�̸�</div>
		<input type="text" id="name" name="name" value="${map.MEM_NAME}" disabled="disabled">
	<div>��й�ȣ</div>
		<input type="password" id="password" name="MEM_PW">
	<div>�г���</div>
	<div class="bhsJD">
		<input type="text" id="nickname" name="nickname" placeholder="�г���" class="jYdxqx2 kTQnUD" value="${map.MEM_NICK}">
		<button class="kvrxoz2" onclick="fn_nickCheck();" type="button">�г��� �ߺ� Ȯ��</button>
	</div>
	<span id="chkMsg2"></span>
	<div>�̸���</div>
		<input type="text" id="email1" name="email1" value="${map.email1}">
		@
		<input type="text" id="email2" name="email2" value="${map.email2}">
		<select id="email">
			<option>�����Է�</option>
			<option>naver.com</option>
			<option>hanmail.net</option>
			<option>gmail.com</option>
			<option>nate.com</option>
		</select>
	<div>����ó</div>
		<div>
			<select id="phone1" name="phone1">
				<option>010</option>
				<option>011</option>
				<option>016</option>
				<option>017</option>
				<option>018</option>
				<option>019</option>
			</select>
			<input type="number" id="phone2" name="phone2">
			<input type="number" id="phone3" name="phone3">
		</div>
		
	</form>
	<div>
	<button onclick="fn_submit();">Ȯ��</button>
	<button type="button" onclick="location.href='<c:url value='/myPage/MyInfodetail'/>'">���</button>
	</div>
	<div><a href="<c:url value='/myPage/myPageDeleteComfirm'/>">ȸ��Ż��</a></div>
	
</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
