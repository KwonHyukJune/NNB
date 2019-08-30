<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제휴 은행 상세보기</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@include file="/WEB-INF/include/adminHeader.jspf"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminBank.css'/>"/>
<script type="text/javascript">
	function pop(url){
		console.log(url);
		var OpenWindow = window.open();
		OpenWindow.document.write("<img src="+url+">");
	}
$(document).ready(function(){
	$(".image").on("click",function(e){
		var src = e.this.src;
		console.log(src);
		window.open($(this).src);
	});
});
</script>
</head>
<body>
<h1 class="styled__Title-sc-1pis5dj-1 gHsEax">제휴 은행</h1>
<div class="page_line"></div>
<br><br><br>
<div class="detail">
	<div>
		<ul class="board-top">
			<li id ="title">${bank.BANK_TITLE}</li>
			<li id = "bank">${bank.BANK_KIND} 은행</li>
			<li id ="date">${bank.REGDATE}</li>
		</ul>
	</div>
		
	<div class="content">
		<c:if test="${bank.BANK_STORED_FILE1!=null && bank.BANK_STORED_FILE1!=''}">
			<div class="image">
				<img src="<c:url value='/bankImages/${bank.BANK_STORED_FILE1}'/>"
					onclick="pop(this.src)" style="cursor:pointer;" width="100%">
			</div>
		</c:if>
		<c:if test="${bank.BANK_STORED_FILE2!=null && bank.BANK_STORED_FILE2!=''}">
			<div class="image">	
				<img src="<c:url value='/bankImages/${bank.BANK_STORED_FILE1}'/>"
					onclick="pop(this.src)" style="cursor:pointer;" width="100%">
			</div>
		</c:if>
		
		${bank.BANK_CONTENT}
	</div>
		
</div>
<div class="toList">
	<button class="kcMULl" onclick="location.href='<c:url value='/admin/openAdminBankList'/>'">목록으로</button>
	<button class="iEZQG" onclick="location.href='<c:url value='bankModifyForm?BANK_NUM=${bank.BANK_NUM}'/>'">수정</button>
</div>
   <div>
      <%@include file="/WEB-INF/include/footer.jspf"%>
   </div>
</body>
</html>