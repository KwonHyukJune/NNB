<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<!-- 테스트용 세팅 -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/roommate.css'/>"/>
<script type="text/javascript">
	var mem = sessionStorage.getItem("MEM_ID");
	function report(){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/report'/>");
		comAjax.addParam("REPORT_D_ID","${mate.RI_MEM_ID}");
		comAjax.ajax();
	};
	function ignore(){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/ignore'/>");
		comAjax.addParam("IGNORE_MEM","${mate.RI_MEM_ID}");
		comAjax.addParam("check",0);
		comAjax.ajax();
	};
	function insertFav(num){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/common/back.jsp'/>");
		comAjax.addParam("RI_MEM_ID","${mate.RI_MEM_ID}");
		comAjax.addParam("MEM_ID",mem);
		var url = window.location.href;
		comAjax.addParam("URL",url);
		comAjax.ajax();
	};
	function deleteFav(num){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/roommate/list/deleteFavRoommate'/>");
		comAjax.addParam("RI_MEM_ID","${mate.RI_MEM_ID}");
		comAjax.addParam("MEM_ID",mem);
		var url = window.location.href;
		comAjax.addParam("URL",url);
		comAjax.ajax();
	};
	function sendMessage(){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/myPage/messageWriteForm'/>");
		comAjax.addParam("RECEIVER","${mate.RI_MEM_ID}");
		comAjax.ajax();
	};
</script>
</head>
<body style="text-align: center; display: block; margin: 0 auto; font-size: 16px; color: #999;" >
<div class="title">룸메이트 상세보기</div>
<div class="roommateDeteil" style="text-align: center; display: block; margin: 0 auto; font-size: 16px; color: #999;">
<table class="alkdf" >
<tr><th>닉네임 </th><td>${mate.MEM_NICK}</td></tr>
<tr><th >성별 </th><td>${mate.RI_LOAN_BIG}</td></tr>
<tr><th>보증금 </th><td>${mate.RI_LOAN_BIG}</td></tr>
<tr><th>월세 </th><td>${mate.RI_LOAN_SMALL}</td></tr>
<tr><th>선호지역 </th><td>${mate.RI_REGION1}</td></tr>
<tr><th>생년월일 </th><td>${mate.RI_BIRTH}</td></tr>
<tr><th>입주시기 </th><td>${mate.RI_DATE_START}~${mate.RI_DATE_END}</td></tr>
<tr><th>자기소개 </th><td>${mate.RI_PROFILE}</td></tr>
<tr><th>성별 </th><td>${mate.RI_GENDER}</td></tr>
</table>
	</div>
		<div class="ignore"><a href="#" class="btn" onclick="ignore();">차단</a></div>
	<script type="text/javascript">
	function ignore(){
		var mem = "${mate.MEM_ID}";
		if(confirm("'"+mem+"' 회원을 차단하시겠습니까?")){
			var str = "<form id='frm' action='ignoreUser' method='post'>"
				+ "<input type='hidden' name='IGNORE_D_MEM' value='"+mem+"'>"
				+ "</form>";
			$(".ignore").after(str);
			frm.submit();
		};
	};
	
	</script>	
	<div class="report"><a href="#" onclick="report();">신고</a></div>
	<c:if test="${mate.check=='0'}">
	<a href="#" class="btn" onclick="insertFav();">찜하기</a>
	</c:if>
	<c:if test="${mate.check=='1'}">
	<a href="#" class="btn" onclick="deleteFav();">찜취소</a>
	</c:if>
	<a href="#" class="btn" onclick="sendMessage();">메시지 보내기</a>
	<a href="#" class="btn" onclick="javascript:window.close();">닫기</a>

<div>
</div>
<br>
<%-- <div class="footer">
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div> --%>
</body>
</html>
