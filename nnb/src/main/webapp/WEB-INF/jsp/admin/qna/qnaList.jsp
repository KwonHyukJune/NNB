<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Q&A 관리</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminQNA.css'/>"/>
<style>

</style>

<script type="text/javascript">
function delet(num){  // 삭제
	if(confirm('삭제하시겠습니까?')){
		var x = $('a#'+num);
		var str = "<form id='frm' method='post' action='/nnb/admin/qna/delete'>"
				+ "<input type='hidden' name='num' value='"+num+"'>"
				+ "</form>";
		console.log(str);
		x.html(str);
		frm.submit();
	}
}
function goDetail(num) {  
	location.href="/nnb/admin/qna/detail?num="+num; 
	}

</script>
</head>
<body>
	<%@ include file="/WEB-INF/include/adminQnaHeader.jspf"%>
<br>

<div class="adminQNA">
	<p>
		<select class="freEbZ hRFrgm">
			<option selected value="답변대기">답변대기</option>
			<option value="답변완료">답변완료</option>
		</select>
	</p>
	<br/><br/><br/>
	<p class="hXdylP">1:1 문의 사항  총 ${size}개</p>
	<ul class='qUCQS'>
		<li class='pbYHJ'>
			<p>번호 </p>
			<p>제목</p>
			<p>날짜</p>
			<p>답변상태</p>
			<p>비고</p>
		</li>
	<c:forEach var="qna" items="${list}">
	<c:if test="${qna.QNA_NUM !=null }">
	<ul>
		<li class="pbYHJ">
				<p>${qna.RNUM }</p>
				<p>${qna.QNA_TITLE }</p>
				<p>${qna.REGDATE }</p>
				<p>	
					<c:choose>
					<c:when test="${qna.RES_STATE=='N' }">
						<span>답변 대기</span>
					</c:when>
					<c:otherwise>
						<span>답변 완료</span>
					</c:otherwise>
					</c:choose>
				</p>
				<p>
					<a href="#" onClick='goDetail(${qna.QNA_NUM})'>답변</a> /
					<a href="#" id="${qna.QNA_NUM }" onClick="delet(${qna.QNA_NUM })">삭제</a>
				</p>
		</li>
	</ul>
	</c:if>
	</c:forEach>
	<c:if test="${size<=0 }">
	<div class="cbeboU">
		<p >문의가 존재하지 않습니다</p>
	</div>
	</c:if>
	</ul>
</div>
<br/>
<br/>
<div>
	<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
