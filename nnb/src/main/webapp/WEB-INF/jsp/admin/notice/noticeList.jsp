<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>공지 게시판</title>
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
	width: 33%;
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
<!-------------------------------------------------------------- -->
<br />
<br />
<br />

<body>

<%@ include file="/WEB-INF/include/adminBoardHeader.jspf"%>
	<div style="width:100%">
	<br><br>
		<div class="selectNoticeList" style="margin:0 300px;">



		</div>
	</div>
	
	<br><br>
	<div id="PAGE_NAVI" style="margin:0 300px; text-align:center;">  </div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
   
   <br>
   	<div style="margin:0 300px; text-align:center;">    
  		<a href="#" onClick="goPage1(${map.NT_NUM})">새 공지 작성</a>
	</div>



<br>
	<div>
		<%@include file="/WEB-INF/include/footer.jspf"%>
	</div>
	
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">
	
function delet(num){  // 삭제
	if(confirm('삭제하시겠습니까?')){
		var x = $('a#'+num);
		var str = "<form id='frm' method='post' action='noticeDelete'>"
				+ "<input type='hidden' name='NT_NUM' value='"+num+"'>"
				+ "</form>";
		console.log(str);
		x.html(str);
		frm.submit();
	}
}

function goPage(num) {   // 수정
	location.href="noticeModifyForm?num="+num; 
	}
	
function goPage1(num) {   // 새 공지사항 등록
	location.href="/nnb/admin/noticeWriteForm?num="+num; 
	}	
	
$(document).ready(function(){
	fn_selectNoticeList(1);
});


function fn_selectNoticeList(pageNo){
	var comAjax = new ComAjax(); 
	comAjax.setUrl("<c:url value='/admin/noticeList'/>"); 
	comAjax.setCallback("fn_selectNoticeListCallback"); 
	comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val()); 
	comAjax.addParam("PAGE_ROW", 15); 
	comAjax.ajax(); }

function fn_selectNoticeListCallback(data){ 
	var total = data.TOTAL; 
	var body = $("div.selectNoticeList"); 
	body.empty(); 
	
	if(total == 0){ 
		var str = "<div class='notice'>" + "조회된 결과가 없습니다." 
		+ "</div>"; 
		body.append(str); 
	
	} else{ 
		var params = { 
					divId : "PAGE_NAVI", 
					pageIndex : "PAGE_INDEX", 
					totalCount : total, 
					eventName : "fn_selectNoticeList" 
					}; 
		gfn_renderPaging(params); 
		var str = ""; 
		$.each(data.list, function(key, value){ 
			str += 
			    "<div class='notice'>" 
	    			+ "<a href='<c:url value='/admin/noticeDetail?num=" + value.NT_NUM + "'/>'>"+ 
	    					value.ROW_NUM +"&nbsp;"+ value.NT_TYPE +"&nbsp;"+ value.NT_DATE +"&nbsp;"+ value.NT_TITLE + "</a>"
	    			+ "<a href='#' onClick='goPage(" + value.NT_NUM + ")'>+ 수정" + "</a>"
					+ "<a href='#' class='btn' id='" + value.NT_NUM +"' onclick='delet("+ value.NT_NUM +")'>삭제</a>"
				+ "</div>";

			}); 
		body.append(str); 
	} 
}
</script>
</body>
</html>