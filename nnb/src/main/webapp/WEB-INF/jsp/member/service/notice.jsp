<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/faq.css'/>"/>
<script type="text/javascript">
	function toggle(num){
		var div = document.getElementById(num);
		if(div.style.display=="none"){
			div.style.display = "block";
		}else if(div.style.display=="block"){
			div.style.display = "none";
		}
	};
</script>
<style type="text/css">
.box{
    margin:0 auto; 
    width:1180px;
}
.noticeList, #PAGE_NAVI{
	margin: 50px 0;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#anotice').addClass('active');
});
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<div class="box">
	<%@ include file="/WEB-INF/include/serviceHeader.jspf"%>
	
	<div class="noticeList">
	</div>
	<div align="center" id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
	
<%-- 	<c:forEach var="notice" items="${noticeList}">
		<div class="title" onclick="toggle(${notice.NT_NUM});">
			<div class="p1">${notice.NT_NUM}</div>
			<div class="p2">${notice.NT_TYPE}</div>
			<div class="p3">${notice.NT_DATE}</div>
			<div class="p4">${notice.NT_TITLE}</div>
		</div>
		<div class="content" id="${notice.NT_NUM}" style="display: none;">
			<div class="p5">내용</div>
			<div class="p6">${notice.NT_CONTENT}</div>
		</div>
	</c:forEach> --%>
</div>
<br><br><br><br><br><br><br><br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
<script type="text/javascript">
//페이징
$(document).ready(function(){
	fn_selectNoticeList(1);
});
function fn_selectNoticeList(pageNo){
	var comAjax = new ComAjax(); 
	comAjax.setUrl("<c:url value='/member/notice'/>");  //value 요청으로 실행
	comAjax.setCallback("fn_selectNoticeListCallback");     //
	comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val()); 
	comAjax.addParam("PAGE_ROW", 15); 
	comAjax.ajax(); }

function fn_selectNoticeListCallback(data){ 
	var total = data.TOTAL; 
	var body = $("div.noticeList"); 
	body.empty(); 
	
	if(total == 0){ 
		var str = "<div class='notice faq' align='center'>" + "조회된 결과가 없습니다." 
		+ "</div>"; 
		body.append(str); 
	} else{ 
		var params = { divId : "PAGE_NAVI", 
					pageIndex : "PAGE_INDEX", 
					totalCount : total, 
					eventName : "fn_selectNoticeList" 
					}; 
		gfn_renderPaging(params); 
		var str = ""; 
		$.each(data.list, function(key, notice){ 
			str += 
			    "<div class='notice faq'>" 
	    			+ "<div class='title' onclick='toggle("+ notice.NT_NUM +");'>"
	    			+ "["+notice.NT_TYPE +"]"+"&nbsp;"+ notice.NT_TITLE 
	    			+ "</div>"
					+ "<div class='content' id='" + notice.NT_NUM + "' style='display: none;'>"
					+ "<div class='p5'>"+ notice.NT_CONTENT+ "</div>"
					+ "</div>"
				+ "</div>";
			}); 
		body.append(str); 
	} 
}
</script>
</body>

</html>
