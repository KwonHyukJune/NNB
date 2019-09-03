<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage.css'/>"/>
<script type="text/javascript">
$(document).ready(function(){
 	var id = sessionStorage.getItem("MEM_ID");
	$("#submit").on("click",function(e){
		e.preventDefault();
		fn_submit(id);
	});
});
function fn_submit(obj){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/myPage/myPageDelete'/>");
	comSubmit.addParam("MEM_ID",id);
	comSubmit.submit();
};
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="myPage.jspf" %>

<div class="myPageDelete">
	<div class="info11">	
		<div style=" text-align: center; font-weight:bold;" class="subtitle">회원탈퇴</div>
		<div>
		<p style= "color:red; font-weight:bold; text-align: center;" >*회원탈퇴를 신청하기 전에 아래 사항을 꼭 확인해주세요.*</p>		
		<p style=" text-align: center;" >탈퇴 신청시 즉시 탈퇴 처리됩니다.</p>
		<p style=" text-align: center;">탈퇴 전 작성된 게시물이나 댓글 등은 탈퇴 후에도 유지됩니다.</p>
		<p style=" text-align: center;">게시물 삭제 등을 원하는 경우 반드시 삭제 처리 후 탈퇴를 신청해주세요.</p>
		<p style=" text-align: center;">비밀번호 확인 후 탈퇴하기 버튼을 누르면 탈퇴가 진행됩니다.</p>
		<br/>
		</div>
		<div class="pwd">
		비밀번호 확인
			<form action="MyInfoDelete" method="post">
			<input type="password" id="password" name="MEM_PW">
			<button class="infobtn" type="submit">탈퇴하기</button>
			</form>
		</div>
	</div>	
</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
