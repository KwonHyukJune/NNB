<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>메시지 작성</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

<script type="text/javascript">

$(document).ready(function(){
	
	$("#write").on("click", function(e){
		insertMessage();
	});
	
	function insertMessage(){
		var comSubmit = new Comsubmit("frm");
		comSubmit.setUrl("<c:url value='/admin/massegeWrite' />");
		comSubmit.submit();
	}
});

function frameclose(){
	self.close()
	window.close()
}
</script>

</head>

<br/><br/><br/>

<body>


<div><h1>회원 관리</h1></div>
<br/>
	
<div>
<!-- 링크에 URL 제대로 바꿔줘야 됩니다. 지금은 테스트용 jsp 링크입니다. -->
<a href=# onclick="location.href='noticeList.jsp'">회원 검색</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href=# onclick="location.href='termsList.jsp'">전체 쪽지함</a>
</div>
<br/><br/>
<h3>메시지작성</h3>
<hr>	
<br/><br/>
    
	<form action="adminWriteMessage" method="get" id="frm" name="frm">
	<div>
       	받는 사람
        <select id="RECIVER" name="RECIVER">
        	<option value="전체">전체</option>
        	<option value="임대">임대</option>
        	<option value="임차">임차</option>
        </select>	
  	</div>
  	 			<br/>
   
 
	<div>
      	 제목
       	<input type="text" id="MESSAGE_TITLE" name="MESSAGE_TITLE"/>
 	</div>
 				<br/>
	<div>    
       	 내용
		<textarea rows="20" cols="50" title="내용" id="MESSAGE_CONTENTS" name="MESSAGE_CONTENTS"></textarea>
    </div>

    <div>
    	<br/><br/>
    	<a href="#" id="write">보내기</a>

    	<a href="javascript:frameclose()">취소</a>
    </div>
 </form> 	     


<br/>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>