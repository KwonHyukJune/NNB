<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>관리자 메인 페이지</title>

<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<style type="text/css">
div.body {
	width:100%;
	min-width: 1366px;
	height: 600px;
}
ul.main > li > ul > li:first-child{
	font-size: 20pt;
	border-bottom: 2px solid black;
}
ul.main > li{
	width: calc(20% - 60px);
	float: left;
	margin: 100px 30px;
}
ul.main > li > ul > li{
    padding: 5px 0px 5px 5px;
    margin-bottom: 5px;
    border-bottom: 1px solid #efefef;
    cursor: pointer;
}
</style>

<script type="text/javascript">
function goPage(url){
	location.href = url;
}
</script>
</head>

<body>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>
<div class="body">
<ul class="main">
	<li>
		<ul>
			<li>회원 관리</li>
			<li onclick="goPage('memberList');">회원 검색</li>
			<li onclick="goPage('messageList');">전체 쪽지함</li>
		</ul>
	</li>
	<li>
		<ul>
			<li>Q&A 관리</li>
			<li onclick="goPage('openFaqList');">자주 묻는 질문</li>
			<li onclick="goPage('<%=request.getContextPath()%>/admin/qna/list');">1:1 질문</li>
		</ul>
	</li>
	<li>
		<ul>
			<li>게시판 관리</li>
			<li onclick="goPage('openNoticeList');">공지 게시판</li>
			<li onclick="goPage('roomList');">방 게시판</li>
			<li onclick="goPage('<%=request.getContextPath()%>/admin/terms/list');">약관 관리</li>
		</ul>
	</li>
	<li>
		<ul>
			<li>제휴 은행 관리</li>
			<li onclick="goPage('openAdminBankList');">제휴 은행 관리</li>
		</ul>
	</li>
	<li>
		<ul>
			<li>신고 관리</li>
			<li onclick="goPage('reportRoomList');">신고 게시글 관리</li>
			<li onclick="goPage('reportMateList');">신고 룸메이트 관리</li>
		</ul>
	</li>
</ul>
</div>

<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>

</body>
</html>
