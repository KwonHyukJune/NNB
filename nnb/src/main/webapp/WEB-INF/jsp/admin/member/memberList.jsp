<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>
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



<div><h1>회원 관리</h1></div>
<br/>
	
<div><h3>
<a href=# onclick="location.href='/nnb/admin/memberList'">회원 검색</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href=# onclick="location.href='/nnb/admin/messageList'">전체 쪽지함</a>
</h3></div>
<br>

<br/>
<div style="margin:0 700px">
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
    <input type="button" value="상세보기" onclick="showPopup(${memberDetail.MEM_NUM},'${memberDetail.MEM_ID}');" />
      <a href="#this" class="btn" id="delete">활성화</a>
	</form> 
  
   </div>	
 
  </c:forEach> 
</div>

</div>
</div>
<br>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>