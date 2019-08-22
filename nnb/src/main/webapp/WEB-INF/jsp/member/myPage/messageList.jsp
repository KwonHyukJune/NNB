<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<div style="display:none;">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
</div>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage.css'/>"/>
<script type="text/javascript">
var memId = sessionStorage.getItem("MEM_ID");
var check = "${check}";
$(document).ready(function(){
	if(check!=null && check!="" && check!='0'){
		alert('이미 차단한 회원입니다.');
	};
	$('#amessage').addClass('active');
	var type = getParameterByName('type');
	if(type=='1'){
		$("#type").val("1").prop("selected",true);
	}else if(type=='2'){
		$("#type").val("2").prop("selected",true);
	}else{
		$("#type").val("0").prop("selected",true);
	};
	$("#type").change(function(){
		var inputVal = $("#type option:selected").val();
		location.href="messageList?type="+inputVal;
	});
});
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

<div class="messageList cAeKOJ">
<%@ include file="myPage.jspf" %>

	<div class="list">
	<ul class="qUCQS">
	<li class="pbYHJ">
		<p>번호</p>
		<p>
			<select id="type">
			<option value="0">전체</option>
			<option value="1">수신</option>
			<option value="2">발신</option>
			</select>
		</p>
		<p>대상</p>
		<p>제목</p>
		<p>날짜</p>
	</li>
	<c:forEach var="message" items="${list}" varStatus="i">
	<fmt:parseDate var="dateString" value="${message.SEND_DATE}" pattern="yyyy-MM-dd"/>
	<li id="li${i.index}" class="bryRNw">
	<div onclick="openMessage(${message.MESSAGE_NUM})" class="message">
		<p>${message.RNUM}</p>
		<p></p>
		<p></p>
		<script type="text/javascript">
			if("${message.SENDER}"==memId){
				$("li#li${i.index}>div>p:nth-child(2)").text("발신");
				$("li#li${i.index}>div>p:nth-child(3)").text("${message.RECEIVER}");
				$("li#li${i.index}>div>p:nth-child(2)").className="발신";
			}else if("${message.RECEIVER}"==memId){
				$("li#li${i.index}>div>p:nth-child(2)").text("수신");
				$("li#li${i.index}>div>p:nth-child(3)").text("${message.SENDER}");
				$("li#li${i.index}>div>p:nth-child(2)").className="수신";
			}
		</script>
		<p>${message.MESSAGE_TITLE}</p>
		<p><fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd"/></p>
	</div>
			<script type="text/javascript">
				function reply_${i.index}(){
					var mem = $("li#li${i.index}>div>p:nth-child(3)").text();
					var url = "messageWriteForm?receiver="+mem;
					location.href=url;
				};
				function ignore_${i.index}(){
					var mem = $("li#li${i.index}>div>p:nth-child(3)").text();
					if(confirm("'"+mem+"' 회원을 차단하시겠습니까?")){
						var str = "<form id='frm' action='ignoreUser' method='post'>"
							+ "<input type='hidden' name='IGNORE_D_MEM' value='"+mem+"'>"
							+ "</form>";
						$(".messageList").after(str);
						frm.submit();
					};
				};
			</script>
	</li>
	<li class="content bryRNw2" style="display: none;" id="${message.MESSAGE_NUM}">
		<p style="width:10%">내용</p>
		<p style="width:90%; text-align:left">${message.MESSAGE_CONTENT}</p>
		<div style="text-align:center; word-break: break-all;">
		<a href="#" class="btn" onclick="javascript:reply_${i.index}();">답장</a>
		<a href="#" class="btn" onclick="javascript:ignore_${i.index}();">차단</a>
		</div>
	</li>
	</c:forEach>
	</ul>
	<c:if test="${count==0}">
	<li>조회된 메시지가 없습니다.</li>
	</c:if>
	</div>
	<div>
	<a href="messageWriteForm" style="">새 메시지 작성</a>
	<a href="ignoreUserList">차단목록</a>
	</div>
	
</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
