<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script type="text/javascript">
/* 
닫기
 */
</script>
</head>
<body>
${eCheck }
<div class="result" style="display: none">
임시 비밀번호가 입력하신 이메일로 전송되었습니다.<br>
<a href="#" class="btn" onclick="close();">닫기</a>
</div>

</body>
</html>