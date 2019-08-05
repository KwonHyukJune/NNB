<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>관리자 메인 페이지</title>

<script>
    $(document).ready(function(){
        $("#login").click(function(){
            // 태크.val() : 태그에 입력된 값
            // 태크.val("값") : 태그의 값을 변경 
            var adminId = $("#ADMIN_ID").val();
            var adminPw = $("#ADMIN_PW").val();
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

<form action="AdminLogin" name="form1" id="form1" method="post">
        	<div>
                <div>아이디 &nbsp;
                <input name="ADMIN_ID" id="ADMIN_ID"></div>
           
          
                <div>비밀번호&nbsp;
                <input type="password" name="ADMIN_PW" id="ADMIN_PW"></div>
 					
 				 <a href="#" id="login">로그인</a>
 			</div>
                <c:if test="${msg == 'failure'}">
                    <div style="color: red">
                        아이디 또는 비밀번호가 일치하지 않습니다.
                    </div>
                </c:if>
                <c:if test="${msg == 'logout'}">
                    <div style="color: red">
                        로그아웃되었습니다.
                    </div>
                </c:if>
    </form>

<br/><br/><br/><br/><br/><br/>

&nbsp;&nbsp;&nbsp;&nbsp;
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>

</body>
</html>
