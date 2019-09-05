<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<!-- 테스트용 세팅 -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/roommate.css'/>"/>
<script type="text/javascript">
	var mem = sessionStorage.getItem("MEM_ID");
	/* function report(){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/roommate/reportUser'/>");
		comAjax.addParam("REPORT_D_ID","${mate.RI_MEM_ID}");
		comAjax.ajax();
	}; */

 	 function ignore(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/roommate/ignore'/>");
		comSubmit.addParam("IGNORE_MEM","${mate.MEM_ID}");
		comSubmit.addParam("IGNORE_D_MEM","${mate.RI_MEM_ID}");
		comSubmit.addParam("check",0); 
		comSubmit.submit();
	};  
	function insertFav(num){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/common/back.jsp'/>");
		comAjax.addParam("RI_MEM_ID","${mate.RI_MEM_ID}");
		comAjax.addParam("MEM_ID",mem);
		var url = window.location.href;
		comAjax.addParam("URL",url);
		comAjax.ajax();
	};
	function deleteFav(num){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/roommate/list/deleteFavRoommate'/>");
		comAjax.addParam("RI_MEM_ID","${mate.RI_MEM_ID}");
		comAjax.addParam("MEM_ID",mem);
		var url = window.location.href;
		comAjax.addParam("URL",url);
		comAjax.ajax();
	};
	$(document).ready(function(){
		$("#message").on("click",function(e){
			e.preventDefault();
			fn_message();
		});
	});
	function fn_message(){
		var comSubmit = new ComSubmit();
		comAjax.setUrl("<c:url value='/roommate/detail/messageWriteForm'/>");
		comAjax.addParam("RECEIVER","${mate.RI_MEM_ID}");
		comAjax.ajax();
	};
	
</script>
</head>
<body >
<div class="roommateDeteil" >
<table class="alkdf" style="width:400px;">
<tr><a id="aa"><td id="asl" colspan="2" align="center" height="30px" ><div class="title" style="text-align:center;">룸메이트 정보</div></td></a></tr>
<tr ><a id="aa"><th id="asl">닉네임 </th></a><td id="dsl">${mate.MEM_NICK}</td></tr>
<tr><a id="aa"><th id="asl">보증금 </th></a><td id="dsl">${mate.RI_LOAN_BIG}</td></tr>
<tr ><a id="aa"><th id="asl">월세 </th></a><td id="dsl">${mate.RI_LOAN_SMALL}</td></tr>
<tr><a id="aa"><th id="asl">선호지역 </th></a><td id="dsl">${mate.RI_REGION1}</td></tr>
<tr ><a id="aa"><th id="asl">생년월일 </th></a><td id="dsl">${mate.RI_BIRTH}</td></tr>
<tr ><a id="aa"><th id="asl">입주시기 </th></a><td id="dsl">${mate.RI_DATE_START}~${mate.RI_DATE_END}</td></tr>
<tr ><a id="aa"><th id="asl">자기소개 </th></a><td id="dsl">${mate.RI_PROFILE}</td></tr>
<tr ><a id="aa"><th id="asl">성별 </th></a><td id="dsl">${mate.RI_GENDER}</td></tr>
</table>
		<div class="ignore"><a href="<c:url value='/roommate/ignore?mem=${mate.MEM_ID}'/>" class="btn" onclick="ignore();">차단</a></div>
	<script type="text/javascript">
	function ignore(){
		var mem = "${mate.MEM_ID}"; 
		if(confirm("'"+mem+"' 회원을 차단하시겠습니까?")){

			var str = "<form id='frm' action='ignore' method='post'>"
				+ "<input type='hidden' name='IGNORE_D_MEM' value='"+mem+"'>"
				+ "</form>"; 
			$(".ignore").after(str);
			frm.submit();
		};
	};
	

	</script>	

<!-- 	<div class="report"><th id="asl"><a href="#" onclick="report();">신고</a></th></div> -->
	<c:if test="${mate.check=='0'}">
	<th id="qasl"><a href="#" class="btn" onclick="insertFav();">찜하기</a></th>
	</c:if>
	<c:if test="${mate.check=='1'}">
	<th id="qasl"><a href="#" class="btn" onclick="deleteFav();">찜취소</a></th>
	</c:if>
<a href="<c:url value='/roommate/detail/messageWriteForm?RECEIVER=${mate.MEM_ID}'/>" class="btn">메시지 보내기</a>


	<a href="#" class="btn" onclick="javascript:window.close();">닫기</a>

<br>
<%-- <div class="footer">
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div> --%>
</body>
</html>
