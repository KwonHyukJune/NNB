<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding = "UTF-8"%>
<!DOCTYPE html>
<html>
<title>신고 관리</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminReport.css'/>"/>
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
function showPopup(num){
    var url = "/nnb/admin/reportRoomDetail?REPORT_NUM="+num;
    var name = "회원정보";
    var option = "width = 700, height = 700, top = 100, left = 200, location = no, resizeable = yes, scrollbars = yes"
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
	$('#awrite').addClass('active');
});
</script>
</head>
<body>
<div style="margin:0 auto; width:1180px;">
	<%@ include file="/WEB-INF/include/adminReportHeader.jspf"%>
<div class="adminReport" style="padding-top: 30px;">
		<div class="reportRoomList"></div>
		<p class="hXdylP" id="count"></p>
		<ul class='qUCQS' id='body'></ul>
		<div id="PAGE_NAVI" align="center"></div>
		<input type='hidden' id='PAGE_INDEX' name="PAGE_INDEX">
</div>
</div>
<br><br><br>
<div>
	<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
<script type="text/javascript">
$(document).ready(function(){
	var PAGE_INDEX = gfn_isNull("${param.PAGE_INDEX}")==true? "1": "${param.PAGE_INDEX}";
	$("#PAGE_INDEX").val(PAGE_INDEX);
	fn_selectReportRoomList(PAGE_INDEX);
});
function fn_selectReportRoomList(pageNo){
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/admin/reportRoomList'/>");
	comAjax.setCallback("fn_selectReportListCallback");
	comAjax.addParam("reportType",$("select[name=reportType]").val());
	comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX").val());
	comAjax.addParam("PAGE_ROW", 15);
	comAjax.ajax();
}
$("#reportType").change(function(){
	fn_selectReportRoomList();
});
function fn_selectReportListCallback(data) {
	var total = data.size;
	var body = $("ul#body");
	$("#count").empty();
	body.empty();
	if (total == 0) {
		var str = "<div class='cbeboU'><p>" + "조회된 결과가 없습니다." + "</p></div>";
		body.append(str);
		$("#PAGE_NAVI").empty();
	} else {
		var params = {
			divId : "PAGE_NAVI",
			pageIndex : "PAGE_INDEX",
			totalCount : total,
			eventName : "fn_selectReportRoomList"
		};
		gfn_renderPaging(params);
		var head = 	"<li class='pbYHJ'>"
				+	"<p>번 호</p>"
				+	"<p>신고유형</p>"
				+	"<p>신고당한 회원</p>"
				+	"<p>신고한 회원</p>"
				+	"<p>신고날짜</p>"
				+	"<p>비고</p>"
				+	"</li>"
		body.append(head);
		var str = "";
		var count = "1:1 문의 사항  총 " + data.size + "개";
		$("#count").append(count);
		$.each(data.list, function(key, report) {
			str	+=	"<li class='pbYHJ'>"
					+	"<p>" + report.RNUM + "</p>"
					+	"<p>";
						if(report.REPORT_TYPE=='1'){
					str	+=			"거래가 완료된 매물";
						}else{
					str +=			"정보가 다른 매물";
						}
					str	+=		"</p>"
					+	"<p>" + report.REPORT_D_ID + "</p>"
					+	"<p>" + report.REPORT_ID + "</p>"
					+	"<p>" + report.REGDATE + "</p>"
					+	"<p>"
						+	"<a href='#' onClick='showPopup(" + report.REPORT_NUM + ")'>상세보기</a>"
						+ " / "
						+	"<a href='#' id='" + report.REPORT_NUM + "' onClick='delet(" + report.REPORT_NUM + ")'>삭제</a>"
					+	"</p>"
				+	"</li>";
		});
		body.append(str);
	}
}
</script>
</body>
</html>