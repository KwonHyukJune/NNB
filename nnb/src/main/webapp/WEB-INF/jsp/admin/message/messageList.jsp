<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@include file="/WEB-INF/include/adminHeader.jspf"%>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/myInterest.css'/>" />

<style>
.kuldyr {
	line-height: 54px;
	color: rgb(34, 34, 34);
	font-size: 33px;
	text-align: center;
	font-weight: 400;
	margin: 70px auto 45px;
}
.jtRefx {
	width: 100%;
}
.jSSNqy {
	width: 100%;
	height: 57px;
	border-bottom: 1px solid rgba(232, 232, 232, 0.7);
}

.jSSNqy>li {
	float: left;
	width: 50%;
	height: 57px;
}

.jSSNqy>li>a {
	display: block;
	width: 100%;
	height: 57px;
	color: rgb(136, 136, 136);
	font-size: 16px;
	line-height: 57px;
	text-align: center;
	cursor: pointer;
	border-bottom: 2px solid transparent;
}

.jSSNqy>li>a.active {
	color: rgb(34, 34, 34);
	font-weight: 500;
	border-bottom-color: rgb(72, 72, 72);
}

.jSSNqy::after {
	display: block;
	content: "";
	clear: both;
}

.jSSNqy>li>a:hover, .jSSNqy>li>a:active {
	color: rgb(34, 34, 34);
}
</style>

<script type="text/javascript">
	function showPopup(num) { //새 메시지 작성

		var url = "/nnb/admin/messageWriteForm?receiver=all";
		var name = "회원정보";
		var option = "width = 500, height = 500, top = 100, left = 200, location = no, resizeable = yes, scrollbars = yes"
		window.open(url, name, option);
	}

	function searchCheck(frm) {
		//검색

		if (frm.keyWord.value == "") {
			alert("검색 단어를 입력하세요.");
			frm.keyWord.focus();
			return;
		}
		frm.submit();
	}

	$(document).ready(function() {
		var PAGE_INDEX = gfn_isNull("${param.PAGE_INDEX}")==true? "1": "${param.PAGE_INDEX}";
		$("#PAGE_INDEX").val(PAGE_INDEX);
		fn_selectSearchMessageList(PAGE_INDEX);
	});
	//상세보기
	function fn_openMessageDetail(obj){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='messageDetail'/>");
		comSubmit.addParam("MESSAGE_NUM",obj.children(".num").text());
		comSubmit.addParam("PAGE_INDEX",$("#PAGE_INDEX").val());
		comSubmit.submit();
	}
	//검색
	function fn_search(){
		var comAjax = new ComAjax()
		comAjax.setUrl("<c:url value='selectMessageList'/>");
		comAjax.setCallback("fn_selectSearchMessageListCallback");
		comAjax.addParam("searchType",$("select[name=searchType]").val());
		comAjax.addParam("keyword",$("input[name=keyword]").val());
		comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX").val());
		comAjax.addParam("PAGE_ROW", 15);
		comAjax.ajax();
	}
	//몇페이지 목록 보기
	function fn_selectSearchMessageList(pageNo) {
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/admin/selectMessageList'/>");
		comAjax.setCallback("fn_selectSearchMessageListCallback");
		comAjax.addParam("searchType",$("select[name=searchType]").val());
		comAjax.addParam("keyword",$("input[name=keyword]").val());
		comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX").val());
		comAjax.addParam("PAGE_ROW", 15);
		comAjax.ajax();
	}
	//콜백함수
	function fn_selectSearchMessageListCallback(data) {
		var total = data.total;
		var body = $("ul#selectSearchMessageList");
		$("#count").empty();
		body.empty();
		
		if (total == 0) {
			var str = "<div class='messageList'>" + "조회된 결과가 없습니다." + "</div>";
			body.append(str);
			$("#PAGE_NAVI").empty();
		} else {
			var params = {
				divId : "PAGE_NAVI",
				pageIndex : "PAGE_INDEX",
				totalCount : total,
				eventName : "fn_selectSearchMessageList"
			};

			gfn_renderPaging(params);
			var str = "";
			var count = "총 " + data.total + "개의 검색 결과가 있습니다.";
			$("#count").append(count);
			$.each(data.list, function(key, message) {
				str += "<li class='message'>"
						+ "<div class='num' style='display:none;'>" + message.MESSAGE_NUM + "</div>"
						+ "<div class=''>" 
							+ "<p>" + message.RNUM + "</p>" 
							+ "<p>" + message.MEM_KIND + "</p>" 
							+ "<p>"	+ message.RECEIVER + "</p>" 
							+ "<p>" + message.MESSAGE_TITLE + "</p>" 
							+ "<p>" + message.SEND_DATE + "</p>" 
						+ "</div>" 
					+ "</li>";
			});
			body.append(str)
			
			$("li.message").on("click",function(e){
				e.preventDefault();
				fn_openMessageDetail($(this));
			})
		}
	}
</script>

</head>

<br />
<br />
<br />

<body>


<div class="jtRefx">
	<h1 class="title kuldyr">회원 관리</h1>
	<ul class="tab jSSNqy">
		<li>
		<a id="awrite" class="tabmenu" href="memberList">회원 검색</a>
		</li>
		<li>
		<a id="aadmin" class="tabmenu" href="messageList">전체 쪽지함</a>
		</li>
	</ul>
</div>
	<br />
	<br />
	
	<div class="searchT">
	<select name="searchType">
		<option value="n"
			<c:out value="${cri.searchType == null?'selected':''}"/>>
			---</option>
		<option value="t"
			<c:out value="${cri.searchType eq 't'?'selected':''}"/>>제목</option>
		<option value="c"
			<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>내용</option>
		<option value="w"
			<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>대상</option>
		<option value="tc"
			<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
			제목+ 내용</option>
		<option value="cw"
			<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>내용
			+ 대상</option>
		<option value="tcw"
			<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
			제목 + 내용 + 대상</option>
	</select>
	<input type="text" name='keyword' id="keywordInput"
		value='${cri.keyword }'>
	<button class="adminbtn" type="button" id='searchBtn' onclick="fn_search()">검색</button>
</div>
	<div class="adminMessageList">
		
		<div class="messageList">
			<div id="count"></div>	
			
		<br/><br/>	
		<table class = "tbody">
		    <tbody>
			    <tr>
			    	<td class="adN" style = "width: 60px; height: 30px;  ">번호</td>
			    	<td class="Inf" style = "width: 80px ">회원정보</td>
			    	<td class="Mii" style = "width: 100px ">아이디</td>
			    	<td class="Mel" style = "width: 190px ">매물번호</td>
			    	<td class="Mpn" style = "width: 170px ">전화번호</td>
			    	<td class="Mld" style = "width:  ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;　</td>
			    	
			    </tr>
		    </tbody>
	    </table>
					
			<ul id="selectSearchMessageList">
			</ul>
			<div class='' id="PAGE_NAVI"></div>
			<input type='hidden' id='PAGE_INDEX' name="PAGE_INDEX">
			<div>
				<input class="adminbtn" type="button" value="메시지 작성" onclick="showPopup();" />
			</div>
		</div>

	</div>
	<br>
	<div>
		<%@include file="/WEB-INF/include/footer.jspf"%>
	</div>
</body>
</html>