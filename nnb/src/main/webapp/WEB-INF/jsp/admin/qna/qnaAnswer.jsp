<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>1:1 문의 답변</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminQNA.css'/>"/>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#update").on("click", function(e){ //작성하기 버튼
		insertBoard();
	});
	function insertBoard(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/admin/qna/reply?num=${map.QNA_NUM}'/>");
		comSubmit.submit();
	}
});
</script>
</head>
<body>
<h1 class="styled__Title-sc-1pis5dj-1 gHsEax">${MEM_ID }님의 문의 사항</h1>
<div class="eugBve">
	<ul class="hIJwlj">
		<li>
			<p class="efvxco">번호</p>
			<p class="efvxco">${map.QNA_NUM}</p>
		</li>
		<li>
			<p class="efvxco">제목</p>
			<p class="efvxco">${map.QNA_TITLE}</p>
		</li>
		<li>
			<p class="efvxco">날짜</p>
			<p class="efvxco">${map.REGDATE}</p>
		</li>
		<li>
			<p class="efvxco">내용</p>
			<p class="bqTGEL hunnDM">${map.QNA_CONTENT }</p>
		</li>
    </ul>

<h1 class="styled__Title-sc-1pis5dj-1 gHsEax">답변 하기</h1>    
 	<form method="post" id="frm" name="frm">
		<div class="eugBve">
		<ul class="hIJwlj">
			<li>
				<p class="efvxco">제목</p>
        		<input autocomplete="off" class="ilgADB kTQnUD" id="RES_TITLE" name="RES_TITLE">
        	</li>
        	<li>
        		<p class="efvxco">내용</p>
        		<textarea class="bqTGEL hunnDM" id="RES_CONTENT" name="RES_CONTENT" placeholder="내용을 입력하세요."></textarea>
        	</li>
        </ul>
        </div>	
     </form>   
     <div align="center">
			<button class="kcMULl" onclick="location.href='/nnb/admin/qna/list'">취소</button>
			<button class="iEZQG" id="update">답변</button>
	</div>
  </div>	
   
<br>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>