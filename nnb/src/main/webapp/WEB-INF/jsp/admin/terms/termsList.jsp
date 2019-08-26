<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>약관 관리</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/terms.css'/>"/>

<script type="text/javascript">
function delet(num){  // 삭제
	if(confirm('삭제하시겠습니까?')){
		var x = $('a#'+num);
		var str = "<form id='frm' method='post' action='/nnb/admin/terms/delete'>"
				+ "<input type='hidden' name='num' value='"+num+"'>"
				+ "</form>";
		console.log(str);
		x.html(str);
		frm.submit();
	}
}
function goPage(num) {   // 수정
	location.href="/nnb/admin/terms/termsModifyForm?num="+num; 
	}
	
function goPage1(num) {   // 새 약관 등록
	location.href="/nnb/admin/terms/termsWrite?num="+num; 
	}
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/adminBoardHeader.jspf"%>
<br/>
<div class=selectTermsList>
<ul class='qUCQS'>
	<li class='pbYHJ'>
		<p>번호 </p>
		<p>종류</p>
		<p>날짜</p>
		<p>기능</p>
	</li>
	<c:forEach var="terms" items="${list}">
	<c:if test="${terms.TERMS_NUM != null }">
		<ul>
			<li class='bryRNw'>
				<a href='<c:url value='/admin/terms/detail?num=${terms.TERMS_NUM }'/>'>
				<p>${terms.TERMS_NUM }</p>
				<p>${terms.TERMS_TITLE }</p>
				<p>${terms.REGDATE }</p>
				</a>
				<p><a href='#' onClick='goPage(${terms.TERMS_NUM})'>수정</a>/
				<a href='#' id="${terms.TERMS_NUM }" onClick="delet(${terms.TERMS_NUM })">삭제</a></p>
			</li>
		</ul>
	</c:if>
	</c:forEach>
		<c:if test="${size <= 0 }">
		<div class="content">
			<br/><br/>
    		<p><h3>약관이 존재하지 않습니다. 약관 작성을 눌러주세요.</h3></p><br/><br/>
    		<p><a href="#" onClick="goPage1(${terms.TERMS_NUM})">약관 작성</a></p>
    		<br/><br/>
    	</div>
  	</c:if>
	</ul>
</div>
<br>
<div>
	<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
<%-- <div class="selectTermsList">
		<c:forEach var="terms" items="${list}">
  		<c:if test="${terms.TERMS_NUM != null }">
		<ul class="qUCQS">
 	 	
			<li id="pbYHJ" >
				<p>번호</p>
				<p>제목</p>
				<p>날짜</p>
			</li>
			<li class='bryRNw'>
				<p>${terms.row_NUM}</p>
				<p>${terms.TERMS_TITLE}</p>
				<p>${terms.REGDATE }</p>
			</li>
    	</ul>
    	<ul>
    	<li id="content">
   	 			<button class="kcMULl"onClick="goPage(${terms.TERMS_NUM})">수정</button>&nbsp;&nbsp;&nbsp;&nbsp;
   	 			<button class="iEZQG"  onclick="location.href='<c:url value='/admin/terms/delete?num=${terms.TERMS_NUM }'/>'">삭제</button>
    		</li>
    	</ul>
       	</c:if>	
  		</c:forEach>
  
  	<c:if test="${size <= 0 }">
    		<div>
    			<br/><br/><br/>
    			<p id="content">약관이 존재하지 않습니다. 약관을 작성해주세요.</p><br/><br/>
    			<p id="content"><a href="#" onClick="goPage1(${terms.TERMS_NUM})">약관 작성</a></p>
    		</div>
  	</c:if>

</div>
<br>
<div>
	<%@ include file="/WEB-INF/include/footer.jspf" %>
</div> --%>
</body>
</html>