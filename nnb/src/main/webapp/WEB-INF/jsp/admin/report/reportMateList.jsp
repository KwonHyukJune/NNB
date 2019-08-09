<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>신고 관리</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>
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
    var option = "width = 500, height = 500, top = 100, left = 200, location = no, resizeable = yes, scrollbars = yes"
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

</head>

<br/><br/><br/>

<body>
<%@ include file="/WEB-INF/include/adminReportHeader.jspf"%>

<br/>
<br/>
<div style="margin:0 700px">
<select>
	<option>처리완료</option>
	<option>처리대기</option>
</select>
&nbsp;&nbsp;
<select>
	<option>전체</option>
	<option>검색유형1</option>
	<option>검색유형2</option>
</select>
<select>
	<option>제목</option>
	<option>신고자</option>
	<option>매물번호</option>
</select>
&nbsp;&nbsp;
	<input type="text" name='keyword' id="keywordInput" value='${cri.keyword }' style="height: 15px; ">
&nbsp;&nbsp;
    <a href="#this" class="btn" id="delete">조회</a>
	<br/>
	<p>총x건의 검색 결과가 있습니다.</p>
	
<br/>

<br/>
</div>



<div class="selectReportMateList">
<div class="reportMateList">
   
   <c:forEach var="map" items="${list}">
	   <div class="report">
	         ${map.RNUM}&nbsp;	
	      	
			 ${map.REPORT_TYPE}&nbsp;      
	      	
	         ${map.REPORT_DATE}&nbsp;
	         
	         ${map.REPORT_D_ID}&nbsp;	
	         
	         ${map.REPORT_TITLE}
	     
	      <input type="button" value="상세보기" onclick="showPopup(${map.REPORT_NUM});" /> 
	      <a href="#" class="btn" id="${map.REPORT_NUM}" onclick="delet(${map.REPORT_NUM})">삭제</a>
	        
	     
	   </div>	 
   </c:forEach>
</div>

</div>
<br>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>