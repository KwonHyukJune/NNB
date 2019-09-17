<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>FAQ 게시판</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@include file="/WEB-INF/include/adminHeader.jspf"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminFaq.css'/>"/>
<script type="text/javascript">
$(document).ready(function(){
	$('#awrite').addClass('active');
});
</script>
</head>
<body>
<div style="margin:0 auto; width:1180px;">
<%@ include file="/WEB-INF/include/adminQnaHeader.jspf"%>
	<div class="selectFaqList"  style="padding-top: 50px; padding-bottom: 50px;">
	</div>
	<br>
	<div align="center" id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
	<br>
	<div align="center" style="padding-bottom: 100px;">    
	 <button class="iEZQG" onClick="goPage1(${map.FAQ_NUM})">자주묻는 질문 작성</button>
	</div>
</div>
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
//페이징
$(document).ready(function(){
	fn_selectFaqList(1);
});
function fn_selectFaqList(pageNo){
	var comAjax = new ComAjax(); 
	comAjax.setUrl("<c:url value='/admin/faq/list'/>");  //value 요청으로 실행
	comAjax.setCallback("fn_selectFaqListCallback");     //
	comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val()); 
	comAjax.addParam("PAGE_ROW", 15); 
	comAjax.ajax(); }

function fn_selectFaqListCallback(data){ 
	var total = data.TOTAL; 
	var body = $("div.selectFaqList"); 
	body.empty(); 
	
	if(total == 0){ 
		var str = "<div class='faq' align='center' style='line-height:100px;'>" + "조회된 결과가 없습니다." 
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
	    			+ "<div class='title' onclick='toggle("+ value.FAQ_NUM +");'>"
	    					+ "["+ value.FAQ_CATEGORY +"]"+"&nbsp;"+ value.FAQ_TITLE 
	    			+ "</div>"
					+ "<div class='content' id='" + value.FAQ_NUM + "' style='display: none;'>"
						+ "<div class='p5'>"+ value.FAQ_CONTENT+ "</div>"
					+ "<div align='center'>"
					+ "<button class='kcMULl' onClick='goPage(" + value.FAQ_NUM + ")'> 수정 </button>"
					+ "<button class='iEZQG' id='" + value.FAQ_NUM +"' onclick='delet("+ value.FAQ_NUM +")'>삭제</button>"
					+ "</div>"
					+ "</div>"
				+ "</div>";
			}); 
		body.append(str); 
	} 
}
</script>

</body>
</html>
