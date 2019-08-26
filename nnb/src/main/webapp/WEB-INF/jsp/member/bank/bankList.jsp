<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/bank.css'/>"/>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>


	<h1 class="styled__Title-sc-1pis5dj-1 gHsEax">제휴 은행</h1>
	<div id="selectBankList">

	</div>
	
	<div id="PAGE_NAVI">  </div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
	

<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>

<%@ include file="/WEB-INF/include/include-body.jspf"%>

<script type="text/javascript">
$(document).ready(function(){
	fn_selectBankList(1);
	

});


function fn_selectBankList(pageNo){
	var comAjax = new ComAjax(); 
	comAjax.setUrl("<c:url value='/bank/bankList'/>"); 
	comAjax.setCallback("fn_selectBankListCallback"); 
	comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val()); 
	comAjax.addParam("PAGE_ROW", 15); 
	comAjax.ajax(); }

function fn_selectBankListCallback(data){ 
	var total = data.TOTAL; 
	var body = $("div#selectBankList"); 
	body.empty(); 
	
	if(total == 0){ 
		var str = 
			"<ul class='qUCQS'>"
			+ "<li class='pbYHJ'>"
				+ "<p>번호</p>"
				+ "<p>은행종류</p>"
				+ "<p>제목</p>"
				+ "<p>조회수</p>"
				+ "<p>날짜</p>"
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
						+ "</li>"
			$.each(data.list, function(key, value){ 
				str += 
					  "<li class='bryRNw'>" 
	    					+ "<a href='<c:url value='/bank/bankDetail?BANK_NUM=" + value.BANK_NUM + "'/>'>"+ 
	    					"<p>"+value.ROW_NUM+"</p>"+ "<p>"+value.BANK_KIND +"</p>"
	    					+"<p>"+value.BANK_TITLE + "</p>"
	    					+ "<p>" + value.REGDATE +"</p>"+"<p>"+value.BANK_HITCOUNT +"</p>"+"</a>"
					+ "</li>";
        		}); 
				str+= "</ul>"
        	body.append(str);
		} 

}
</script>

</body>
</html>


