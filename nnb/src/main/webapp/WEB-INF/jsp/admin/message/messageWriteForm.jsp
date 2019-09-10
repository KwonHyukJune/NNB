<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>메시지 작성</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminMessage.css'/>"/>
<style>
.msgW > p:first-child{
	
	
	float: left;
	padding: 21px 16px 16px 31px;

	
}
.msgW > p:nth-child(2){
	
	width: 480px;
	
	padding: 21px 31px 0px 0px;

	
}
.msgW2 > p:first-child{
	
	
	float: left;
	padding: 16px 16px 16px 31px;

}
.msgW2 > p:nth-child(2){
	
	width: 480px;
	
	padding: 5px 31px 0px 0px;

	
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	if('${param.receiver}'!=null && '${param.receiver}'=='all'){
		str = '　　대상　　'
			+ '<select style="background-color: #ffffff17; border: 1px solid rgb(34, 34, 34);" name="type">'
			+	 '<option value="all">전체</option>'
			+	 '<option value="normal">임차인</option>'
			+	 '<option value="lessor">임대인</option>'
			+ '</select>'
		$("#frm").prepend(str);
	}
});
function frameclose(){
	window.close();
}
</script>
</head>
<body>
<br/>
<div class="mwtl"><h3>메시지작성</h3></div>
	
<form style="background-image: url(/nnb/css/msgbg4.png); background-repeat: no-repeat;  action="messageWrite" method="post" id="frm">
	<input type="hidden" name="RECEIVER" value="${param.id}">
	<input type="hidden" name="forAll" value="${param.receiver}">
	<div class="msgW">
      	<p>제목</p>
       	<p><input type="text" id="TITLE" name="MESSAGE_TITLE" style="width: 335.6px; background-color: #ffffff17; border: 1px solid rgb(34, 34, 34);" /></p>
 	</div>
 		<br/>
	<div class="msgW2">    
       	 <p>내용</p>
	<p><textarea style="background-color: #ffffff17; border: 1px solid rgb(34, 34, 34);" rows="20" cols="50" title="내용" id="CONTENTS" name="MESSAGE_CONTENT"></textarea></p>
    </div>

   <div class="msbtn">
   	<br/><br/>
   	<button class="adminbtn" type="submit">보내기</button>

   	<a class="adminbtn" href="javascript:frameclose()">취소</a>
   </div>
</form>


<br/>
</body>
</html>