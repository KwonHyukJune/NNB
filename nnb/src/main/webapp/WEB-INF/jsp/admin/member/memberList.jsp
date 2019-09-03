<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminMember.css'/>" />
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
.hRFrgm {
    height: 46px;
    color: rgb(68, 68, 68);
    font-size: 15px;
    box-sizing: border-box;
    -webkit-appearance: none;
    padding: 0px 15px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(208, 210, 214);
    border-image: initial;
    border-radius: 0px;
    background: url(/nnb/media/arrow.svg) right 15px center / 10px no-repeat rgb(255, 255, 255);
    outline: none;
}
.kZIxja {
    display: inline-block;
    width: 670px;
    height: 46px;
    color: rgb(34, 34, 34);
    font-size: 15px;
    border: 1px solid rgb(208, 210, 214);
    margin: 0;
    outline: none;
}
.dsdsd {
    width: 100px;
    height: 46px;
    color: rgb(255, 255, 255);
    font-size: 16px;
    line-height: 46px;
    letter-spacing: -0.3px;
    background-color: rgb(19, 116, 248);
    border-width: 0px;
    border-style: initial;
    border-color: initial;
    border-image: initial;
    border-radius: 2px;
    outline: none;
}
</style>


<script type="text/javascript">
//상세보기
function showPopup(obj){
	var num = obj.children('.num').text();
	var id = obj.children('.num').next().children('#id').text();
    var url = "/nnb/admin/memberDetail?MEM_NUM="+num+"&MEM_ID="+id;
    var name = "회원정보";
    var option = "width = 700, height = 700, top = 100, left = 200, location = no, resizeable = yes, scrollbars = yes"
    window.open(url, name, option);
}
//검색
function fn_search(){
	var comAjax = new ComAjax()
	comAjax.setUrl("<c:url value='selectMemberList'/>");
	comAjax.setCallback("fn_selectSearchMemberListCallback");
	comAjax.addParam("searchType",$("select[name=searchType]").val());
	comAjax.addParam("keyword",$("input[name=keyword]").val());
	comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX").val());
	comAjax.addParam("PAGE_ROW", 15);
	comAjax.ajax();
}
//몇페이지 목록 보기
$(document).ready(function() {
	var PAGE_INDEX = gfn_isNull("${param.PAGE_INDEX}")==true? "1": "${param.PAGE_INDEX}";
	$("#PAGE_INDEX").val(PAGE_INDEX);
	fn_selectSearchMemberList(PAGE_INDEX);
});
function fn_selectSearchMemberList(pageNo) {
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/admin/selectMemberList'/>");
	comAjax.setCallback("fn_selectSearchMemberListCallback");
	comAjax.addParam("searchType",$("select[name=searchType]").val());
	comAjax.addParam("keyword",$("input[name=keyword]").val());
	comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX").val());
	comAjax.addParam("PAGE_ROW", 15);
	comAjax.ajax();
}
//콜백함수
function fn_selectSearchMemberListCallback(data) {
	var total = data.total;
	var body = $("ul#selectMemberList");
	$("#count").empty();
	body.empty();
	
	if (total == 0) {
		var str = "<div class='memberList'>" + "조회된 결과가 없습니다." + "</div>";
		body.append(str);
		$("#PAGE_NAVI").empty();
	} else {
		var params = {
			divId : "PAGE_NAVI",
			pageIndex : "PAGE_INDEX",
			totalCount : total,
			eventName : "fn_selectSearchMemberList"
		};
		gfn_renderPaging(params);
		
		var head = 	"<li>"
					+	"<p class='adN'>번 호</p>"
					+	"<p class='Inf'>유 형</p>"
					+	"<p class='Mii'>아 이 디</p>"
					+	"<p class='Mel'>이 메 일</p>"
					+	"<p class='Mpn'>연 락 처</p>"
				+	"</li>"
		body.append(head);

		var str = "";
		var count = "총 " + data.total + "개의 검색 결과가 있습니다.";
		$("#count").append(count);
		$.each(data.list, function(key, member) {
		if(member.MEM_KIND=='lessor'){
			var MEM_KIND = '임대회원';
		}else{
			var MEM_KIND = '임차회원';
		}
		var MEM_PHONE = member.MEM_PHONE.slice(0,3) + "-" + member.MEM_PHONE.slice(3,7) + "-" + member.MEM_PHONE.slice(7,11);
			str += "<li class='member'>"
					+ "<div class='num' style='display:none;'>" + member.MEM_NUM + "</div>"
					+ "<div class='tbody'>"
						+ "<p>" + member.RNUM + "</p>"
						+ "<p>" + MEM_KIND + "</p>" 
						+ "<p id='id'>"	+ member.MEM_ID + "</p>" 
						+ "<p>" + member.MEM_EMAIL + "</p>" 
						+ "<p>" + MEM_PHONE + "</p>" 
					+ "</div>"
				+ "</li>";
		});
		body.append(str)
		
		$("li.member").on("click",function(e){
			e.preventDefault();
			showPopup($(this));
		})
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
<div style="margin:0 auto; width: 900px;">
<%@ include file="/WEB-INF/include/adminMemberHeader.jspf"%>
<div style="margin:50px 0">
<select name="searchType" class="hRFrgm">
	<option value="">전체보기</option>
	<option value="id">아이디+이름</option>
	<option value="email">이메일</option>
	<option value="phone">연락처</option>
</select>
	<input class="kZIxja" type="text" name='keyword' id="keywordInput" value='${cri.keyword }'>
	<button class="dsdsd" type="button" onclick="fn_search()">조회</button>
</div>
	

<div class="selectMeberList">


<div class="memberList">
	<div id="count"></div>
	<ul id="selectMemberList"></ul>
	<div id="PAGE_NAVI"></div>
	<input type='hidden' id='PAGE_INDEX' name="PAGE_INDEX">
</div>

</div>
</div>
<br>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>