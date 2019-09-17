<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>신고 관리</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminReportRL.css'/>"/>
<style>
.kuldyr {
	line-height: 54px;
	color: rgb(34, 34, 34);
	font-size: 33px;
	text-align: center;
	font-weight: 400;
	margin: 70px auto 45px;
}
.jtRefx {
	width: 100%;
}
.jSSNqy {
	width: 100%;
	height: 57px;
	border-bottom: 1px solid rgba(232, 232, 232, 0.7);
}

.jSSNqy>li {
	float: left;
	width: 50%;
	height: 57px;
}

.jSSNqy>li>a {
	display: block;
	width: 100%;
	height: 57px;
	color: rgb(136, 136, 136);
	font-size: 16px;
	line-height: 57px;
	text-align: center;
	cursor: pointer;
	border-bottom: 2px solid transparent;
}

.jSSNqy>li>a.active {
	color: rgb(34, 34, 34);
	font-weight: 500;
	border-bottom-color: rgb(72, 72, 72);
}

.jSSNqy::after {
	display: block;
	content: "";
	clear: both;
}

.jSSNqy>li>a:hover, .jSSNqy>li>a:active {
	color: rgb(34, 34, 34);
}
</style>
<script type="text/javascript">
function showPopup(num, id){
    var url = "/nnb/admin/reportMemberDetail?REPORT_NUM="+num;
    var name = "회원정보";
    var option = "width = 500, height = 630, top = 100, left = 200, location = no, resizeable = yes, scrollbars = yes"
    window.open(url, name, option);
}

function delet(num){  // 삭제
	if(confirm('삭제하시겠습니까?')){
		var x = $('a#'+num);
		var str = "<form id='frm' method='post' action='delete'>"
				+ "<input type='hidden' name='num' value='"+num+"'>"
				+ "</form>";
		console.log(str);
		x.html(str);
		frm.submit();
	}
}
 </script>
<script type="text/javascript">
$(document).ready(function(){
	$('#aadmin').addClass('active');
});
</script>
</head>
<body>	
<div style="margin:0 auto; width:1180px;">
<div>
	<%@ include file="/WEB-INF/include/adminReportHeader.jspf"%>
</div>
<c:if test="${map.REPORT_NUM != null }">
<div>
	<ul class="qUCQS">
		<li class="pbYHJ">
			<p>번 호</p>
			<p>신고유형</p>
			<p>신고당한 회원</p>
			<p>신고한 회원</p>
			<p>신고날짜</p>
			<p>비고</p>
		</li>
		<li class="pbYHJ">
			<p>${map.RNUM }</p>
			<p>${map.REPORT_TYPE }</p>
			<p>${map.REPORT_D_ID }</p>
			<p>${map.REPORT_ID }</p>
			<p>${map.REPORT_DATE }</p>
			<p>
			<a href='#' onClick='showPopup("${map.REPORT_NUM} ")'>상세보기</a>
			/
			<a href='#' id="report.REPORT_NUM" onClick='delet("${map.REPORT_NUM} ")'>삭제</a>
			</p>

		</li>
	</ul>
</div>
</c:if>
<c:if test="${map.REPORT_NUM == null }">
	<div class="cbeboU">
		<p>조회된 결과가 없습니다.</p>
	</div>
</c:if>
</div>
<div>
	<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>