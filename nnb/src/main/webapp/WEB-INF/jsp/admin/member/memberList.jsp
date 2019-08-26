<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/adminMember.css'/>" />
<style>
.kuldyr {
	line-height: 54px;
	color: rgb(34, 34, 34);
	font-size: 33px;
	text-align: center;
	font-weight: 400;
	margin: 70px auto 45px;
}
.jtRefx {
	width: 100%;
}
.jSSNqy {
	width: 100%;
	height: 57px;
	border-bottom: 1px solid rgba(232, 232, 232, 0.7);
}

.jSSNqy>li {
	float: left;
	width: 50%;
	height: 57px;
}

.jSSNqy>li>a {
	display: block;
	width: 100%;
	height: 57px;
	color: rgb(136, 136, 136);
	font-size: 16px;
	line-height: 57px;
	text-align: center;
	cursor: pointer;
	border-bottom: 2px solid transparent;
}

.jSSNqy>li>a.active {
	color: rgb(34, 34, 34);
	font-weight: 500;
	border-bottom-color: rgb(72, 72, 72);
}

.jSSNqy::after {
	display: block;
	content: "";
	clear: both;
}

.jSSNqy>li>a:hover, .jSSNqy>li>a:active {
	color: rgb(34, 34, 34);
}
</style>


<script type="text/javascript">

function showPopup(num,id){

    var url = "/nnb/admin/memberDetail?MEM_NUM="+num+"&MEM_ID="+id;
    var name = "회원정보";
    var option = "width = 500, height = 500, top = 100, left = 200, location = no, resizeable = yes, scrollbars = yes"
    window.open(url, name, option);
}
</script>

</head>

<br/><br/><br/>

<body>
<%@ include file="/WEB-INF/include/adminMemberHeader.jspf"%>

<br>

<br/>
<div class ="searchT">
<select>
	<option>검색유형1</option>
	<option>검색유형2</option>
	<option>검색유형3</option>
</select>
	<input type="text" name='keyword' id="keywordInput" value='${cri.keyword }'">
    <a href="#this" class="amdinbtn" id="delete">조회</a>
	<br/>
	<p>총 ${count}건의 검색 결과가 있습니다.</p>
</div>	
<br/>

<div class="selectMeberList">


<div class="memberList">
 <table class = "tbody">
	    <tbody>
		    <tr>
		    	<td class="adN" style = "width: 60px; height: 30px;  ">번호</td>
		    	<td class="Inf" style = "width: 70px ">회원정보</td>
		    	<td class="Mii" style = "width: 100px ">아이디</td>
		    	<td class="Mel" style = "width: 190px ">이메일</td>
		    	<td class="Mpn" style = "width: 170px ">전화번호</td>
		    	<td class="Mld" style = "width:  ">상세보기　</td>
		    	
		    </tr>
	    </tbody>
    </table>
  
   <c:forEach var="memberDetail" items="${adminMemberList}">
   <div class="memberLS">
   
         <div style="border: 1px white; float: left; width: 10%; ">${memberDetail.MEM_NUM}</div>	
      	
		 <div style="border: 1px white; float: left; width: 10%; ">${memberDetail.MEM_KIND}</div>      
      	
         <div style="border: 1px white; float: left; width: 15%; ">${memberDetail.MEM_ID}</div>
         
         <div style="border: 1px white; float: left; width: 28%; ">${memberDetail.MEM_EMAIL}</div>
         
         <div style="border: 1px white; float: left; width: 23%; ">${memberDetail.MEM_PHONE}</div>	
          
    
     <form class="formMem">    
    <input class = "adminbtn" type="button" value="상세보기" onclick="showPopup(${memberDetail.MEM_NUM},'${memberDetail.MEM_ID}');" />
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