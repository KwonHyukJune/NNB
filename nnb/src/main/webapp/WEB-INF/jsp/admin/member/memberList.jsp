<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/include/include-header.jspf" %>
<%@ include file="/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

<script type="text/javascript">
function showPopup() { 
	  window.open("memberDetail.jsp", "회원상세보기", 
			  "width=700, height=700, scrollbars=1, left=100, top=50"); }
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


<!-- 테스트용 세팅 -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
   Map<String,Object> member1 = new HashMap<String,Object>();
	member1.put("MEM_NUM","1");
	member1.put("MEM_KIND","임대");
	member1.put("MEM_ID","ID4");
	member1.put("MEM_EMAIL","ID4@NAVER.COM");
	member1.put("MEM_PHONE","010-1234-1234");
	   
   
   List<Map<String,Object>> memberList = new ArrayList<Map<String,Object>>();
   memberList.add(member1);
 
   
 
   request.setAttribute("memberList",memberList);
%>
<!-- 테스트용 세팅 끝 -->

<div class="selectMeberList">


<div class="memberList">
  
   <c:forEach var="member" items="${memberList}">
   <div class="member">
      <div>
         ${member.MEM_NUM}&nbsp;	
      	
		 ${member.MEM_KIND}&nbsp;      
      	
         ${member.MEM_ID}&nbsp;
         
         ${member.MEM_EMAIL}&nbsp;
         
         ${member.MEM_PHONE}	
          
      </div>
       
    <input type="button" value="상세보기" onclick="showPopup();" />
      <a href="#this" class="btn" id="delete">활성화</a>

  
   </div>	
 
  </c:forEach> 
</div>

</div>
<br>
<div>
<%@ include file="/include/footer.jspf" %>
</div>
</body>
</html>