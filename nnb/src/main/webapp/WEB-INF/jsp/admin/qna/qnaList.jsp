<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Q&A 관리</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminQNA.css'/>"/>
<script type="text/javascript">
$(document).ready(function(){
	$('#aadmin').addClass('active');
});
</script>
<script type="text/javascript">
function delet(num){  // 삭제
	if(confirm('삭제하시겠습니까?')){
		var x = $('a#'+num);
		var str = "<form id='frm' method='post' action='/nnb/admin/qna/delete'>"
				+ "<input type='hidden' name='num' value='"+num+"'>"
				+ "</form>";
		console.log(str);
		x.html(str);
		frm.submit();
	}
}
function goDetail(num) {  
	location.href="/nnb/admin/qna/detail?num="+num; 
	}

</script>
</head>
<body>
<div style="margin:0 300px; min-width:1180px;">
	<%@ include file="/WEB-INF/include/adminQnaHeader.jspf"%>

<div class="adminQNA" style="padding-top: 30px;">
	<p style="height: 80px;">
		<select class="freEbZ hRFrgm" name="searchType" id="searchType">
			<option value="">전체</option>
			<option value="n">답변대기</option>
			<option value="Y">답변완료</option>
		</select>
	</p>
	<p class="hXdylP" id="count"></p>
	<ul class='qUCQS' id='body'></ul>
	<div id="PAGE_NAVI" align="center"></div>
	<input type='hidden' id='PAGE_INDEX' name="PAGE_INDEX">
	<br><br><br>
</div>
</div>
<div>
	<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
<script type="text/javascript">
//검색
function fn_search(){
	var comAjax = new ComAjax()
	comAjax.setUrl("<c:url value='/admin/qna/openList'/>");
	comAjax.setCallback("fn_selectQnaListCallback");
	comAjax.addParam("searchType",$("select[name=searchType]").val());
	comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX").val());
	comAjax.addParam("PAGE_ROW", 15);
	comAjax.ajax();
}
$("#searchType").change(function(){
	fn_search();
});

$(document).ready(function(){
	var PAGE_INDEX = gfn_isNull("${param.PAGE_INDEX}")==true? "1": "${param.PAGE_INDEX}";
	$("#PAGE_INDEX").val(PAGE_INDEX);
	fn_selectQnaList(PAGE_INDEX);
});
function fn_selectQnaList(pageNo){
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/admin/qna/openList'/>");
	comAjax.setCallback("fn_selectQnaListCallback");
	comAjax.addParam("searchType",$("select[name=searchType]").val());
	comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX").val());
	comAjax.addParam("PAGE_ROW", 15);
	comAjax.ajax();
}
function fn_selectQnaListCallback(data) {
	var total = data.size;
	var body = $("ul#body");
	$("#count").empty();
	body.empty();
	
	if (total == 0) {
		var str = "<div class='cbeboU'><p>" + "문의가 존재하지 않습니다." + "</p></div>";
		body.append(str);
		$("#PAGE_NAVI").empty();
	} else {
		var params = {
			divId : "PAGE_NAVI",
			pageIndex : "PAGE_INDEX",
			totalCount : total,
			eventName : "fn_selectQnaList"
		};
		gfn_renderPaging(params);
		var str = "";
		var count = "1:1 문의 사항  총 " + data.size + "개";
		$("#count").append(count);
		$.each(data.list, function(key, qna) {
			str	+=	"<li class='pbYHJ'>"
					+	"<p>" + qna.RNUM + "</p>"
					+	"<p>" + qna.QNA_TITLE + "</p>"
					+	"<p>" + qna.REGDATE + "</p>"
					+	"<p>";
					if(qna.RES_STATE=='n'){
			str	+=			"답변대기";
					}else{
			str +=			"답변완료";
					}
			str	+=		"</p>"
					+	"<p>"
						+	"<a href='#' onClick='goDetail(" + qna.QNA_NUM + ")'>답변</a>"
						+	"<a href='#' id='" + qna.QNA_NUM + "' onClick='delet(" + qna.QNA_NUM + ")'>삭제</a>"
					+	"</p>"
				+	"</li>";
		});
		body.append(str);
	}
}
</script>
</body>
</html>
