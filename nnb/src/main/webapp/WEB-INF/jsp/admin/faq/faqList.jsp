<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>FAQ 게시판</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@include file="/WEB-INF/include/adminHeader.jspf"%>


<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/myInterest.css'/>" />
</head>

<br />
<br />
<br />

<body>


	<div>
		<h1>게시판 관리</h1>
	</div>
	<br />

	<div>
<!-- 링크에 URL 제대로 바꿔줘야 됩니다. 지금은 테스트용 jsp 링크입니다. -->
	<a href=# onclick="location.href='/nnb/admin/OpenFaqList'">자주 묻는 질문</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href=# onclick="location.href='OpenQnaList.jsp'">1:1 질문</a>
	</div>

<br/><br/><br/>

	<div class="selectFaqList">


	</div>
	<div id="PAGE_NAVI"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
   
   <br>
   	<div>    
  		<a href="#" onClick="goPage1(${map.FAQ_NUM})">새 공지 작성</a>
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
		var x = $('a#'+num);
		var str = "<form id='frm' method='post' action='delete'>"
				+ "<input type='hidden' name='num' value='"+num+"'>"
				+ "</form>";
		console.log(str);
		x.html(str);
		frm.submit();
	}
}

function goPage(num) {   // 수정
	location.href="modifyForm?FAQ_NUM="+num; 
	}
	
function goPage1(num) {   // 새 약관 등록
	location.href="writeForm?FAQ_NUM="+num; 
	}	
	
$(document).ready(function(){
	fn_selectFaqList(1);
})


function fn_selectFaqList(pageNo){
	var comAjax = new ComAjax(); 
	comAjax.setUrl("<c:url value='/admin/faq/list'/>"); 
	comAjax.setCallback("fn_selectFaqListCallback"); 
	comAjax.addParam("PAGE_INDEX",pageNo); 
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
	    			+ "<a href='<c:url value='/admin/faq/detail?num=${" + value.FAQ_NUM + "}'/>'>"
	    					+ value.RNUM +"&nbsp;"+ value.FAQ_CATEGORY +"&nbsp;"+ value.FAQ_TITLE + "</a>"
	    			+ "<a href='#' onClick='goPage(" + value.FAQ_NUM + ")'> 수정" + "</a>"
					+ "<a href='#' class='btn' id='" + value.FAQ_NUM +"' onclick='delet("+ value.FAQ_NUM +")'>삭제</a>"
						+ "<div class='content' id=" + value.FAQ_NUM + "style= display: none;>"
							+ "<div class='p4'>내용</div>"
							+ "<div class='p5'>"+ value.FAQ_CONTENT+ "</div>"
						+ "</div>"
				+ "</div>";
			}); 
		body.append(str); 
	} 
}
</script>
</body>
</html>
