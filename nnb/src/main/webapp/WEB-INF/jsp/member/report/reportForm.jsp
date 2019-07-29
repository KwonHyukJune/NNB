<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script type="text/javascript">
	var mem = sessionStorage.getItem("MEM_ID");
	function submit(){
		var comSubmit = new ComSubmit(frm);
		comSubmit.setUrl("<c:url value='/report/submit'/>");
		comSubmit.addParam("REPORT_D_ID","${map.REPORT_D_ID}");
		/* POST_NUM 없으면 공백으로 들어가려나? */
		comSubmit.addParam("REPORT_POST_NUM","${map.REPORT_POST_NUM}");
		comSubmit.addParam("REPORT_ID",mem);
		comSubmit.submit(frm);
	}
</script>
</head>
<body>

<div class="title">신고하기</div>

<form id="frm">
<div class="h">신고유형</div>
<div class="b">
	<select name="REPORT_TYPE">
		<option>--신고유형 선택--</option>
		<option value="1">욕설 및 혐오발언</option>
		<option value="2">허위정보 기재</option>
		<option value="3">음란성 게시글</option>
		<option value="4">도배/광고</option>
	</select>
</div>
<div class="h">아이디</div>
<div class="b">${map.REPORT_D_ID}</div>
<c:if test="${map.REPORT_POST_NUM!=null || map.REPORT_POST_NUM!=''}">
<div class="h">글 번호</div>
<div class="b">${map.REPORT_POST_NUM}</div>
</c:if>
<div class="h">제목</div>
<div class="b"><input type="text" id="title" name="title"></div>
<div class="h">내용</div>
<div class="b"><textarea id="content" name="content"></textarea></div>
</form>
<div>
<a href="#" class="btn" onclick="submit();">제출</a>
<a href="#" class="btn" onclick="window.close();">취소</a>
</div>


<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>