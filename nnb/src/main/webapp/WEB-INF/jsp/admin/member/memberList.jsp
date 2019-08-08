<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

<script type="text/javascript">

function showPopup(num, id){
    var url = "/nnb/admin/memberDetail?MEM_NUM="+num+"&MEM_ID=id"+num;
    var name = "회원정보";
    var option = "width = 500, height = 500, top = 100, left = 200, location = no, resizeable = yes, scrollbars = yes"
    window.open(url, name, option);
}
</script>

</head>

<br/><br/><br/>

<body>


<div><h1>회원 관리</h1></div>
<br/>
	
<div><h3>
<!-- 링크에 URL 제대로 바꿔줘야 됩니다. 지금은 테스트용 jsp 링크입니다. -->
<a href=# onclick="location.href='/nnb/admin/memberList'">회원 검색</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href=# onclick="location.href='messageList.jsp'">전체 쪽지함</a>
</h3></div>
<br/>
<select>
	<option>검색유형1</option>
	<option>검색유형2</option>
	<option>검색유형3</option>
</select>
	<input type="text" name='keyword' id="keywordInput" value='${cri.keyword }' style="height: 15px; ">
    <a href="#this" class="btn" id="delete">조회</a>
	<br/>
	<p>총 ${count}x건의 검색 결과가 있습니다.</p>
	
<br/>

<div class="selectMeberList">


<div class="memberList">
  
   <c:forEach var="memberDetail" items="${adminMemberList}">
   <div class="member">
      <div>
         ${memberDetail.MEM_NUM}&nbsp;	
      	
		 ${memberDetail.MEM_KIND}&nbsp;      
      	
         ${memberDetail.MEM_ID}&nbsp;
         
         ${memberDetail.MEM_EMAIL}&nbsp;
         
         ${memberDetail.MEM_PHONE}	
          
      </div>
     <form>    
    <input type="button" value="상세보기" onclick="showPopup(${memberDetail.MEM_NUM});" />
      <a href="#this" class="btn" id="delete">활성화</a>
	</form> 
  
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