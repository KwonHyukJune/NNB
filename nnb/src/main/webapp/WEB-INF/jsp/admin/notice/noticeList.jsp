<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>공지 게시판</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@include file="/WEB-INF/include/adminHeader.jspf"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminNotice.css'/>"/>	
</head>
<body>
<div style="margin:0 auto; width:1180px; min-height: 800px;">
<%@ include file="/WEB-INF/include/adminBoardHeader.jspf"%>
<!-- 내용 -->
	<div>
		<div class="selectNoticeList">
		</div>
	</div>
<!-- 페이징 -->
	<div id="PAGE_NAVI" align="center"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
<!-- 하단부 -->
   	<div class="cxBJwZ" align="center">e    
  		<button class="hRSpXj" onClick="goPage1(${map.NT_NUM})">새 공지 작성</button>
	</div>
<br>
</div>
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
		var str = "<ul class='qUCQS'>"
			+ "<li class='pbYHJ'>"
			+ "<p>번호</p>"
			+ "<p>공지유형</p>"
			+ "<p>제목</p>"
			+ "<p>날짜</p>"
			+ "<p>기능</p>"
		+ "</li>"
	+ "<li class='bryRNw'>" + "조회된 결과가 없습니다. </li>"
	+ "</ul>" 
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
		str +=  "<ul class='qUCQS'>"
			+ "<li class='pbYHJ'>"
			+ "<p>번호</p>"
			+ "<p>공지종류</p>"
			+ "<p>제목</p>"
			+ "<p>날짜</p>"
			+ "<p>기능</p>"
		+ "</li>"
		$.each(data.list, function(key, value){ 
			str +=
			    	"<li class='bryRNw'>" 
	    			+ "<a href='<c:url value='/admin/noticeDetail?num=" + value.NT_NUM + "'/>'>"
	    			+"<p>"+value.RNUM +"</p>"+"<p>"+"[ "+ value.NT_TYPE +"]"+"</p>"
	    			+"<p>"+ value.NT_TITLE +"</p>"
	    			+"<p>"+ value.NT_DATE +"</p>" 
	    			+ "</a>"
	    			+"<p>"
	    			+ "<a href='#' onClick='goPage(" + value.NT_NUM + ")'>수정" + "</a>"
	    			+ " / "
					+ "<a href='#' class='btn' id='" + value.NT_NUM +"' onclick='delet("+ value.NT_NUM +")'>삭제</a>"
					+ "</p>"
				+ "</li>";

			}); 
			str+= "</ul>";
		body.append(str); 
	} 
}
</script>
</body>
</html>