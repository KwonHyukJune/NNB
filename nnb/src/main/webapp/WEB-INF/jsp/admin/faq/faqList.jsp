<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>FAQ 게시판</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@include file="/WEB-INF/include/adminHeader.jspf"%>

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
</head>

<br />
<br />
<br />

<body>
<%@ include file="/WEB-INF/include/adminQnaHeader.jspf"%>
	<br><br>
	<div class="selectFaqList" style="margin:0 700px">


	</div>
	<div id="PAGE_NAVI" style="margin:0 700px"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
   
   <br>
   	<div>    
  		<a href="#" onClick="goPage1(${map.FAQ_NUM})" style="margin:0 700px">새 공지 작성</a>
	</div>



<br>
	<div>
		<%@include file="/WEB-INF/include/footer.jspf"%>
	</div>
	
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">

function toggle(num){
	var div = document.getElementById(num);
	if(div.style.display=="none"){
		div.style.display = "block";
	}else if(div.style.display=="block"){
		div.style.display = "none";
	}
};

function delet(num){  // 삭제
	if(confirm('삭제하시겠습니까?')){
		location.href="<c:url value='/admin/faq/delete?FAQ_NUM="+num+"'/>"
	}
}

function goPage(num) {   // 수정
	location.href="<c:url value='/admin/faq/modifyForm?FAQ_NUM="+num+"'/>"
	}
	
function goPage1(num) {   // 새 약관 등록
	location.href="<c:url value='/admin/faq/writeForm?FAQ_NUM="+num+"'/>"
	}	
	
$(document).ready(function(){
	fn_selectFaqList(1);
});


function fn_selectFaqList(pageNo){
	var comAjax = new ComAjax(); 
	comAjax.setUrl("<c:url value='/admin/faq/list'/>"); 
	comAjax.setCallback("fn_selectFaqListCallback"); 
	comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val()); 
	comAjax.addParam("PAGE_ROW", 15); 
	comAjax.ajax(); }

function fn_selectFaqListCallback(data){ 
	var total = data.TOTAL; 
	var body = $("div.selectFaqList"); 
	body.empty(); 
	
	if(total == 0){ 
		var str = "<div class='faq'>" + "조회된 결과가 없습니다." 
		+ "</div>"; 
		body.append(str); 
	
	} else{ 
		var params = { divId : "PAGE_NAVI", 
					pageIndex : "PAGE_INDEX", 
					totalCount : total, 
					eventName : "fn_selectFaqList" 
					}; 
		gfn_renderPaging(params); 
		var str = ""; 
		$.each(data.list, function(key, value){ 
			str += 
			    "<div class='faq'>" 
	    			+ "<div class='title' onclick='toggle("+ value.FAQ_NUM +");' style='font-weight:bold'>"
	    					+ value.RNUM +"&nbsp;"+ value.FAQ_CATEGORY +"&nbsp;"+ value.FAQ_TITLE 
	    			+ "</div>"
					+ "<div class='content' id='" + value.FAQ_NUM + "' style='display: none;'>"
						+ "<div class='p4'>&nbsp&nbsp&nbsp;내용</div>"
						+ "<div class='p5'>&nbsp&nbsp&nbsp"+ value.FAQ_CONTENT+ "</div>"
					+ "</div>"
					+ "<a href='#' onClick='goPage(" + value.FAQ_NUM + ")'> 수정 </a>"
					+ "<a href='#' class='btn' id='" + value.FAQ_NUM +"' onclick='delet("+ value.FAQ_NUM +")'>삭제</a>"
				+ "</div>";
			}); 
		body.append(str); 
	} 
}
</script>
</body>
</html>
