<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>
<script type="text/javascript">
	function openDetail(url){
		var strUrl = "/nnb"+url;
		window.open(strUrl);
	}
	function deleteFav(num){
		var conSubmit = new ComSubmit();
		conSubmit.setUrl("<c:url value='/myInterest/favRoommateCancel'/>");
		conSubmit.addParam("RI_MEM_NUM",num);
		conSubmit.addParam("MEM_NUM",${MEM_NUM});
		conSubmit.submit();
	};
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="myInterest.jspf" %>

<!-- 테스트용 세팅 -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
	Map<String,Object> mate1 = new HashMap<String,Object>();
	mate1.put("RI_MEM_NUM","1");
	mate1.put("MEM_NICK","withfour");
	mate1.put("RI_AGE","24");
	mate1.put("RI_GENDER","여자");
	mate1.put("RI_REGION1","서울");
	mate1.put("RI_LOAN_BIG","300");
	mate1.put("RI_LOAN_SMALL","30");
	Map<String,Object> mate2 = new HashMap<String,Object>();
	mate2.put("RI_MEM_NUM","2");
	mate2.put("MEM_NICK","withfour");
	mate2.put("RI_AGE","24");
	mate2.put("RI_GENDER","여자");
	mate2.put("RI_REGION1","서울");
	mate2.put("RI_LOAN_BIG","300");
	mate2.put("RI_LOAN_SMALL","30");
	
	List<Map<String,Object>> mateList = new ArrayList<Map<String,Object>>();
	mateList.add(mate1);
	mateList.add(mate2);
	
	int count = mateList.size();
	request.setAttribute("count", count);
	request.setAttribute("mateList",mateList);
%>
<!-- 테스트용 세팅 끝 -->

<div class="myRoommateList">

<p>총 ${count}명의 찜한 룸메이트가 있습니다.</p>
<c:if test="${count!=null && count!=''}">
<div class="mateList">
	<div class="listheader">
		<div class="p1">닉네임</div>
		<div class="p2">나이</div>
		<div class="p3">성별</div>
		<div class="p4">지역</div>
		<div class="p5">부담가능금액</div>
		<div class="p6"></div>
	</div>
	<c:forEach var="mate" items="${mateList}">
	<div class="mate">
	<a href="#" onclick="openDetail('/roommate/detail?num=${mate.RI_MEM_NUM}');" class="btn">
	<%-- <a href="javascript:window.open(<c:url value='/roommate/detail?num=${mate.RI_MEM_NUM}'/>)"> --%>
		<div class="p1">${mate.MEM_NICK}</div>
		<div class="p2">${mate.RI_AGE}</div>
		<div class="p3">${mate.RI_GENDER}</div>
		<div class="p4">${mate.RI_REGION1}</div>
		<div class="p5">${mate.RI_LOAN_BIG}/${mate.RI_LOAN_SMALL}</div>
		<div class="p6">
			<div class="deleteFav" onclick="deleteFav(${mate.RI_MEM_NUM});">
			</div>
		</div>
	</a>
	</div>
	</c:forEach>
</div>
</c:if>
<c:if test="${count==null || count==''}">
	<a href="<c:url value='/search/roomList'/>" class="btn">룸메이트 찾으러가기</a>
</c:if>
</div>
<br>
<div class="footer">
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
