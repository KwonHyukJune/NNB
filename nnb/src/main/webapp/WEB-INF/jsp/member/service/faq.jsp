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
	Map<String,Object> faq1 = new HashMap<String,Object>();
	faq1.put("FAQ_NUM","1");
	faq1.put("FAQ_CATEGORY","계정문의");
	faq1.put("FAQ_TITLE","이미 등록된 계정이라고 뜹니다");
	faq1.put("FAQ_CONTENT","그런가요..");
	Map<String,Object> faq2 = new HashMap<String,Object>();
	faq2.put("FAQ_NUM","2");
	faq2.put("FAQ_CATEGORY","다른문의");
	faq2.put("FAQ_TITLE","집에 가고싶어요");
	faq2.put("FAQ_CONTENT","그런가요..");
	
	List<Map<String,Object>> faqList = new ArrayList<Map<String,Object>>();
	faqList.add(faq1);
	faqList.add(faq2);
	
	request.setAttribute("FAQ",faqList);
%>
<!-- 테스트용 세팅 끝 -->

<div class="faq">

	<div>
		<div class="p1">순번</div>
		<div class="p2">카테고리</div>
		<div class="p3">글제목</div>
	</div>

<c:forEach var="faq" items="${FAQ}">
	<div class="title" onclick="toggle(${faq.FAQ_NUM});">
		<div class="p1">${faq.FAQ_NUM}</div>
		<div class="p2">${faq.FAQ_CATEGORY}</div>
		<div class="p3">${faq.FAQ_TITLE}</div>
	</div>
	<div class="content" id="${faq.FAQ_NUM}" style="display: none;">
		<div class="p4">내용</div>
		<div class="p5">${faq.FAQ_CONTENT}</div>
	</div>
</c:forEach>
	
</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
