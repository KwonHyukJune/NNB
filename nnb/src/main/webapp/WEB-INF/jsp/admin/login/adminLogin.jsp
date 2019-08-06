<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>관리자 메인 페이지</title>

<script>
$(document).ready(function(){
    $("#btnLogin").click(function(){
        // 태크.val() : 태그에 입력된 값
        // 태크.val("값") : 태그의 값을 변경 
        var userId = $("#ADMIN_ID").val();
        var userPw = $("#ADMIN_PW").val();
        if(userId == ""){
            alert("아이디를 입력하세요.");
            $("#ADMIN_ID").focus(); // 입력포커스 이동
            return; // 함수 종료
        }
        if(userPw == ""){
            alert("비밀번호를 입력하세요.");
            $("#ADMIN_PW").focus();
            return;
        }
        // 폼 내부의 데이터를 전송할 주소
        document.form1.action="/admin/main"
        // 제출
        document.form1.submit();
    });
});
</script>


<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>
</head>
<br/>

<body>

<div class="loginForm">
관리자 로그인
<form id="form1" action="/admin/main" method="POST">
<input type="text" id="ADMIN_ID" name="ADMIN_ID" placeholder="아이디 입력"><br>
<input type="password" id="ADMIN_PW" name="ADMIN_PW" placeholder="비밀번호 입력" onkeypress="if( event.keyCode == 13 ){fsubmit();}">
</form>
	<a href="#" class="btn" onclick="btnLogin();">로그인</a>
	<a href="#" class="btn" onclick="back();">취소</a><br>

</div>


<br/><br/><br/><br/><br/><br/>

&nbsp;&nbsp;&nbsp;&nbsp;
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>

</body>
</html>
