<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script type="text/javascript">
$(document).ready(function(){
	$("#regdate").change(function(){
		var regdate = $(this).val();
		$("div.term").hide();
		document.getElementById(regdate).style.display = "block";
	});
});
</script>
<select id="regdate">
	<option>--날짜 선택--</option>
</select>
<a href="javascript:window.close();">닫기</a>

<c:forEach var="term" items="${terms}">
<script type="text/javascript">
	var option = "<option>"+"${term.TERMS_REGDATE}"+"</option>";
	$("#regdate").append(option);
</script>
<div id="${term.TERMS_REGDATE}" style="display:none" class="term">
<div>${term.TERMS_TITLE}(${term.TERMS_REGDATE})</div>
<div>${term.TERMS_CONTENT}</div>
</div>
</c:forEach>

