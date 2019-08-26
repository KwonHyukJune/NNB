<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>제휴 은행 리스트</title>
<head>
<%@include file="/WEB-INF/include/include-header.jspf"%>
<%@include file="/WEB-INF/include/adminHeader.jspf"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminBank.css'/>"/>
</head>
<!-------------------------------------------------------------- -->


<br />
<br />

<body>
<div class="jtRefx">
	<h1 class="title kuldyr">제휴 은행 관리</h1>
</div>
<br/>

<br>
<div id="selectBankList"> 
	
</div>
<div id='writeForm' align="center">   
	<button class="iEZQG" onClick='goPage1(${map.BANK_NUM})'>새 글 등록</button>
</div>
<Br>
<Br>
<div id="PAGE_NAVI">  </div>
<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
<br>
<br>
<div>
	<%@include file="/WEB-INF/include/footer.jspf"%>
</div>
	
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">
	
function delet(num){  // 삭제
	if(confirm('삭제하시겠습니까?')){
		location.href="bankDelete?BANK_NUM="+num; 
	}
}

function goPage(num) {   // 수정
	location.href="bankModifyForm?BANK_NUM="+num; 
	}
	
function goPage1(num) {   // 새 공지사항 등록
	location.href="bankWriteForm?BANK_NUM="+num; 
	}	
	
$(document).ready(function(){
	fn_selectBankList(1);
});


function fn_selectBankList(pageNo){
	var comAjax = new ComAjax(); 
	comAjax.setUrl("<c:url value='/admin/bankList'/>"); 
	comAjax.setCallback("fn_selectBankListCallback"); 
	comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val()); 
	comAjax.addParam("PAGE_ROW", 15); 
	comAjax.ajax(); }

function fn_selectBankListCallback(data){ 
	var total = data.TOTAL;
	var body = $("div#selectBankList"); 
	body.empty();
	
	if(total == 0){ 
		var str = "<ul class='qUCQS'>"
			+ "<li class='pbYHJ'>"
			+ "<p>번호</p>"
			+ "<p>은행종류</p>"
			+ "<p>제목</p>"
			+ "<p>조회수</p>"
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
					eventName : "fn_selectBankList" 
					}; 
		gfn_renderPaging(params); 
		var str = ""; 
			str += "<ul class='qUCQS'>"
				+ "<li class='pbYHJ'>"
					+ "<p>번호</p>"
					+ "<p>은행종류</p>"
					+ "<p>제목</p>"
					+ "<p>날짜</p>"
					+ "<p>조회수</p>"
					+ "<p>기능</p>"
				+ "</li>"
		$.each(data.list, function(key, value){ 
			str += 
				"<li class='bryRNw'>" 
				+ "<a href='<c:url value='/admin/bankDetail?BANK_NUM=" + value.BANK_NUM + "'/>'>"+ 
				"<p>"+value.ROW_NUM+"</p>"+ "<p>"+value.BANK_KIND +"</p>"
				+"<p>"+value.BANK_TITLE + "</p>"
				+ "<p>" + value.REGDATE +"</p>"+"<p>"+value.BANK_HITCOUNT +"</p>"+"</a>"
				+	"<p>"
	    			+ "<a href='#' onClick='goPage(" + value.BANK_NUM + ")'> 수정 / " + "</a>"
				+ "<a href='#' class='btn' id='" + value.BANK_NUM +"' onclick='delet("+ value.BANK_NUM +")'>삭제</a>";
				+ "</p>"
				+ "</li>"

			}); 
				str+= "</ul>";
					
		body.append(str); 
	} 
}
</script>
</body>
</html>
