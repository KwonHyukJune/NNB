<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage.css'/>"/>
<script type="text/javascript">
/*
 * 전체,수신,발신 선택해서 표시 되도록
 */
	var memId = sessionStorage.getItem("MEM_ID");
	function openMessage(num){
		var content = document.getElementById(num);
		if(content.style.display=="block"){
 			content.style.display = "none"; 
		}else if(content.style.display=="none"){
			content.style.display = "block";
		}
	};
	function fn_openReplyForm(mem){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/myPage/messageWriteForm'/>");
		comAjax.addParam("RECEIVER",mem);
		comAjax.addParam("SENDER",memId);
		comAjax.ajax();
	};
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="myPage.jspf" %>

<div class="messageList">

	<div class="list">
	<ul>
		<li class="p1">번호</li>
		<li class="p2"><select>
		<option>전체</option>
		<option>수신</option>
		<option>발신</option>
		</select></li>
		<li class="p3">대상</li>
		<li class="p4">제목</li>
		<li class="p5">날짜</li>
	</ul>
	<c:forEach var="message" items="${messageList}">
	<div onclick="openMessage(${message.NUM})" class="message">
	<ul>
		<li class="p1">${message.MESSAGE_NUM}</li>
		<li class="p2">${message.TYPE}</li>
		<li class="p3">${message.MEM}</li>
		<li class="p4">${message.MESSAGE_TITLE}</li>
		<li class="p5">${message.SEND_DATE}</li>
		<li>
		<div class="content" style="display: block;" id="${message.NUM}">
			<div style="width:10%">내용</div>
			<div style="width:90%">${message.CONTENT}</div>
			<a href="#" class="btn" onclick="reply(${message.MEM});">답장</a>
			<a href="javascript:openMessage(${message.NUM})" class="btn" id="close">닫기</a>
		</div>
		</li>
	</ul>
	</div>
	</c:forEach>
	</div>
<%-- 	<div class="paging">
		${pagingHtml}
	</div> --%>
	
</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
