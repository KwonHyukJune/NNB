<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/service.css'/>"/>
<script type="text/javascript">
	function toggle(num){
		var div = document.getElementById(num);
		if(div.style.display=="none"){
			div.style.display = "block";
		}else if(div.style.display=="block"){
			div.style.display = "none";
		}
	};
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="service.jspf" %>

<!-- 테스트용 세팅 -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
	Map<String,Object> notice1 = new HashMap<String,Object>();
	notice1.put("NT_NUM","1");
	notice1.put("NT_TITLE","공지입니다");
	notice1.put("NT_CONTENT","집에 가고 싶어요");
	notice1.put("NT_DATE","2019/07/25");
	notice1.put("NT_TYPE","긴급공지");
	Map<String,Object> notice2 = new HashMap<String,Object>();
	notice2.put("NT_NUM","2");
	notice2.put("NT_TITLE","공지2입니다");
	notice2.put("NT_CONTENT","집에 가고 싶어요");
	notice2.put("NT_DATE","2019/07/25");
	notice2.put("NT_TYPE","일반공지");
	
	List<Map<String,Object>> noticeList = new ArrayList<Map<String,Object>>();
	noticeList.add(notice1);
	noticeList.add(notice2);
	
	request.setAttribute("noticeList",noticeList);
%>
<!-- 테스트용 세팅 끝 -->

<div class="notice">

	<div>
		<div class="p1">순번</div>
		<div class="p2">공지유형</div>
		<div class="p3">등록날짜</div>
		<div class="p4">제목</div>
	</div>

<c:forEach var="notice" items="${noticeList}">
	<div class="title" onclick="toggle(${notice.NT_NUM});">
		<div class="p1">${notice.NT_NUM}</div>
		<div class="p2">${notice.NT_TYPE}</div>
		<div class="p3">${notice.NT_DATE}</div>
		<div class="p4">${notice.NT_TITLE}</div>
	</div>
	<div class="content" id="${notice.NT_NUM}" style="display: none;">
		<div class="p5">내용</div>
		<div class="p6">${notice.NT_CONTENT}</div>
	</div>
</c:forEach>
	
</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
