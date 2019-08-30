<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/faq.css'/>"/>
</head>
<body>
<%@ include file="/WEB-INF/include/serviceHeader.jspf"%>
<br><br>
<div class="selectFAQList"></div>
<div align="center" id="PAGE_NAVI"></div>
<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
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
//페이징
$(document).ready(function(){
	fn_selectFaqList(1);
});
function fn_selectFaqList(pageNo){
	var comAjax = new ComAjax(); 
	comAjax.setUrl("<c:url value='/member/faq'/>");  //value 요청으로 실행
	comAjax.setCallback("fn_selectFaqListCallback");     //
	comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val()); 
	comAjax.addParam("PAGE_ROW", 15); 
	comAjax.ajax(); }

function fn_selectFaqListCallback(data){ 
	var total = data.TOTAL; 
	var body = $("div.selectFAQList"); 
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
	    			+ "<div class='title' onclick='toggle("+ value.FAQ_NUM +");'>"
	    			+ "["+value.FAQ_CATEGORY +"]"+"&nbsp;"+ value.FAQ_TITLE 
	    			+ "</div>"
					+ "<div class='content' id='" + value.FAQ_NUM + "' style='display: none;'>"
					+ "<div class='p5'>&nbsp&nbsp&nbsp"+ value.FAQ_CONTENT+ "</div>"
					+ "</div>"
				+ "</div>";
			}); 
		body.append(str); 
	} 
}
</script>
</body>
</html>
