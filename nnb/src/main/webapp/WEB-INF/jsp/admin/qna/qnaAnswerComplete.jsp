<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>1:1 문의 답변</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<script type="text/javascript">

$(document).ready(function(){
	
	$("#write").on("click", function(e){ //작성하기 버튼
		insertBoard();
	});
		
	function insertBoard(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/admin/qna/reply' />");
		comSubmit.submit();
	}
});

function goPage1(num) {   // 취소
	location.href="/nnb/admin/qna/list?num="+num; 
	}

</script>

</head>

<br/><br/><br/>

<body>


<div><h1>1:1 문의 답변 완료</h1></div>
<br/>
<hr>
<br/><br/><br/>

<div class="selectRoomList">


     
답변 완료     
  
   
    <br/><br/><br/> 

&nbsp;&nbsp;
    <a href="#" onClick="goPage1(${map.QNA_NUM})">목록으로</a>
</div>	
   

<br>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>