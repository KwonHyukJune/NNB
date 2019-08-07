<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
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
<%@ include file="myPage.jspf" %>

<div class="messageList cAeKOJ">

	<div class="list">
	<ul>
	<li>
		<div>번호</div>
		<div><select id="type">
		<option value="0">전체</option>
		<option value="1">수신</option>
		<option value="2">발신</option>
		</select></div>
		<div>대상</div>
		<div>제목</div>
		<div>날짜</div>
	</li>
	<c:forEach var="message" items="${list}" varStatus="i">
	<li id="${i.index}">
	<div onclick="openMessage(${message.MESSAGE_NUM})" class="message">
		<div>${message.RNUM}</div>
		<div>
		</div>
		<div id="${i.index}">
		</div>
		<script type="text/javascript">
			if("${message.SENDER}"==memId){
				$("li#${i.index}>div>div:nth-child(2)").text("발신");
				$("li#${i.index}>div>div:nth-child(3)").text("${message.RECEIVER}");
				$("li#${i.index}>div>div:nth-child(2)").className="발신";
			}else if("${message.RECEIVER}"==memId){
				$("li#${i.index}>div>div:nth-child(2)").text("수신");
				$("li#${i.index}>div>div:nth-child(3)").text("${message.SENDER}");
				$("li#${i.index}>div>div:nth-child(2)").className="수신";
			}
		</script>
		<div>${message.MESSAGE_TITLE}</div>
		<div>${message.SEND_DATE}</div>
		<div class="content" style="display: none;" id="${message.MESSAGE_NUM}">
			<div style="width:10%">내용</div>
			<div style="width:90%">${message.MESSAGE_CONTENT}</div>
		</div>
	</div>
			<a href="#" class="btn" onclick="javascript:reply_${i.index}();">답장</a>
			<a href="#" class="btn" onclick="javascript:ignore_${i.index}();">차단</a>
			<script type="text/javascript">
				function reply_${i.index}(){
					var mem = $("li#${i.index}>div>div:nth-child(3)").text();
					var url = "messageWriteForm?receiver="+mem;
					location.href=url;
				};
				function ignore_${i.index}(){
					var mem = $("li#${i.index}>div>div:nth-child(3)").text();
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
	</c:forEach>
	</ul>
	</div>
	<c:if test="${count==0}">
	조회된 메시지가 없습니다.
	</c:if>
	<a href="messageWriteForm">새 메시지 작성</a>
	<a href="ignoreUserList">차단목록</a>
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
