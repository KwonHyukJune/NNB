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


	<div class="title">제휴은행</div>
	<div class="list">
	<ul>
		<li>
			<div>번호</div>
			<div>은행종류</div>
			<div>제목</div>
			<div>조회수</div>
			<div>날짜</div>
		</li>
	</ul>
	</div>	
	<div class="selectBankList">
	
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
	comAjax.addParam("PAGE_INDEX",pageNo); 
	comAjax.addParam("PAGE_ROW", 15); 
	comAjax.ajax(); }

function fn_selectBankListCallback(data){ 
	var total = data.TOTAL; 
	var body = $("div.selectBankList"); 
	body.empty(); 
	
	if(total == 0){ 
		var str = "<div class='bankList'>" + "조회된 결과가 없습니다. </div>"; 
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
					"<div class='bankList'>" 
	    			+ "<a href='<c:url value='/bank/bankDetail?BANK_NUM=" + value.BANK_NUM + "'/>'>"+ 
	    					value.RNUM +"&nbsp;"+ value.BANK_KIND +"&nbsp;"+ value.BANK_REGDATE +"&nbsp;"+ value.BANK_TITLE + 
	    					+ value.BANK_HITCOUNT + "</a>"
				+ "</div>";

        	}); 
        	body.append(str); 
		} 
}
        
</script>

</body>
</html>
