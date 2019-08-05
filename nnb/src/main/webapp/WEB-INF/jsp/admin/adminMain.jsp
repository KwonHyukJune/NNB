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
            document.form1.action="/admin/login"
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

관리자 로그인 중입니다.

<br/><br/><br/><br/><br/><br/>

&nbsp;&nbsp;&nbsp;&nbsp;
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>

</body>
</html>
