<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

<script type="text/javascript">
			  
function showPopup(num){    //새 메시지 작성

    var url = "/nnb/admin/messageWriteForm?receiver=all";
    var name = "회원정보";
    var option = "width = 500, height = 500, top = 100, left = 200, location = no, resizeable = yes, scrollbars = yes"
    window.open(url, name, option);
}			  
			  
			  
function searchCheck(frm){
    //검색
   
    if(frm.keyWord.value ==""){
        alert("검색 단어를 입력하세요.");
        frm.keyWord.focus();
        return;
    }
    frm.submit();      
}
		  
</script>

</head>

<br/><br/><br/>

<body>


<div><h1>회원 관리</h1></div>
<br/>
	

<div><h3>
<a href=# onclick="location.href='/nnb/admin/memberList'">회원 검색</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href=# onclick="location.href='/nnb/admin/messageList'">전체 쪽지함</a>
</h3></div>

<br/>
<select name="searchType">
		<option value="n"
			<c:out value="${cri.searchType == null?'selected':''}"/>>
			---</option>
		<option value="t"
			<c:out value="${cri.searchType eq 't'?'selected':''}"/>>제목</option>
		<option value="c"
			<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>내용</option>
		<option value="w"
			<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>작성자</option>
		<option value="tc"
			<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
			제목+ 내용</option>
		<option value="cw"
			<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
			내용 + 작성자</option>
		<option value="tcw"
			<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
			제목 + 내용 + 작성자</option>
	</select>
	<input type="text" name='keyword' id="keywordInput"
		value='${cri.keyword }'>
	<button type="button" id='searchBtn'>검색</button>
	
	
<br/><br/>

<div class="adminMessageList">

<div class="messageList">
   
   <c:forEach var="map" items="${adminMessageList}">     
   
		<div>
			<a href="<c:url value='/admin/messageDetail?MASSAGE_NUM=${map.MESSAGE_NUM}'/>">${map.RNUM}&nbsp;${map.MEM_KIND}&nbsp;${map.RECEIVER}&nbsp;${map.MESSAGE_TITLE}&nbsp;&nbsp;|&nbsp;${map.SEND_DATE}</a>
			
		</div>
  </c:forEach> 
   				<br/><br/>
 	 <div>
 	 			<input type="button" value="메시지 작성" onclick="showPopup();" />
     </div>
</div>

</div>
<br>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>