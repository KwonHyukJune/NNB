<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>제휴 은행 리스트</title>
<head>
<%@include file="/WEB-INF/include/include-header.jspf"%>
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
<!-------------------------------------------------------------- -->


<br />
<br />
<br />

<body>
<%@ include file="/WEB-INF/include/adminBankHeader.jspf"%>


	<br/>
	<br>
	<div class="selectBankList" style="margin:0 700px"> 
	
	</div>
	
	<div id="PAGE_NAVI" style="margin:0 700px">  </div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
   
   <br>
   	<div>    
  		<a href="#" style="margin:0 700px" onClick="goPage1(${map.NT_NUM})">새 글 등록</a>
	</div>



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
	var body = $("div.selectBankList"); 
	body.empty();
	
	if(total == 0){ 
		var str = "<div class='bank'>" + "조회된 결과가 없습니다." 
		+ "</div>"; 
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
		$.each(data.list, function(key, value){ 
			str += 
			      "<div class='bank'>" 
	    			+ "<a href='<c:url value='/admin/bankDetail?BANK_NUM=" + value.BANK_NUM + "'/>'>" 
	    					+ value.ROW_NUM +"&nbsp;"+ value.BANK_KIND +"&nbsp;"+ value.BANK_REGDATE +"&nbsp;"+ value.BANK_TITLE + "</a>"
	    			+ "<a href='#' onClick='goPage(" + value.BANK_NUM + ")'> 수정" + "</a>"
					+ "<a href='#' class='btn' id='" + value.BANK_NUM +"' onclick='delet("+ value.BANK_NUM +")'>삭제</a>"
				+ "</div>";

			}); 
		body.append(str); 
	} 
}
</script>
</body>
</html>
