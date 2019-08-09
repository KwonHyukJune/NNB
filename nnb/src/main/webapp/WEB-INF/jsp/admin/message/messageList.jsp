<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

<script type="text/javascript">
function messageDetail() { 
	  window.open("messageDetail.jsp", "회원상세보기", 
			  "width=700, height=700, scrollbars=1, left=100, top=50"); }
			  
			  
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


<h1><div>회원 관리</div></h1>
<br/>
	
<div>
<!-- 링크에 URL 제대로 바꿔줘야 됩니다. 지금은 테스트용 jsp 링크입니다. -->
<a href=# onclick="location.href='noticeList.jsp'">회원 검색</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href=# onclick="location.href='termsList.jsp'">전체 쪽지함</a>
</div>
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

<div class="selectMessageList">

<div class="messageList">
   
   <c:forEach var="message" items="${adminMessageList}">
   <div class="message">
  <a href="#" onClick="javascript:messageDetail()">
      
	     
		<div>
			 ${map.MESSAGE_NUM}&nbsp;	
			      	
			 ${map.MEM_KIND}&nbsp;      
	      	
	         ${map.RECEIVER}&nbsp;
	         
	         ${map.MESSAGE_TITLE}&nbsp;&nbsp;|&nbsp;
	         
	         ${map.SEND_DATE}	
          
		</div>
      </a>
      <div>
      	<a href="#" onClick="javascript:showPopup2()">새 메시지 작성</a>
      </div>
   </div>	
 
  </c:forEach> 
</div>

</div>
<br>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>