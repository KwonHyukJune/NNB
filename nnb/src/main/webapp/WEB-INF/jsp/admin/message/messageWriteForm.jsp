<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>메시지 작성</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>
<script type="text/javascript">
$(document).ready(function(){
	if('${param.receiver}'!=null && '${param.receiver}'=='all'){
		str = '대상'
			+ '<select name="type">'
			+	 '<option value="all">전체</option>'
			+	 '<option value="normal">임차인</option>'
			+	 '<option value="lessor">임대인</option>'
			+ '</select>'
		$("#frm").prepend(str);
	}
});
</script>
</head>
<body>
<br/>
<h3>메시지작성</h3>
<br/>
<hr>	
<br/><br/>
<form action="messageWrite" method="post" id="frm">
	<input type="hidden" name="RECEIVER" value="${param.id}">
	<input type="hidden" name="forAll" value="${param.receiver}">
	<div>
      	제목
       	<input type="text" id="TITLE" name="MESSAGE_TITLE"/>
 		</div>
 		<br/>
	<div>    
       	 내용
	<textarea rows="20" cols="50" title="내용" id="CONTENTS" name="MESSAGE_CONTENT"></textarea>
    </div>

   <div>
   	<br/><br/>
   	<button type="submit">보내기</button>

   	<a href="javascript:frameclose()">취소</a>
   </div>
</form>


<br/>
</body>
</html>