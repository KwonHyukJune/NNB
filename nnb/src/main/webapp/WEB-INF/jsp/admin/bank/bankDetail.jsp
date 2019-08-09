<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제휴 은행 상세보기</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@include file="/WEB-INF/include/adminHeader.jspf"%>
<script type="text/javascript">
	function pop(url){
		console.log(url);
		var OpenWindow = window.open();
		OpenWindow.document.write("<img src="+url+">");
	}
$(document).ready(function(){
	$(".image").on("click",function(e){
		var src = e.this.src;
		console.log(src);
		window.open($(this).src);
	});
});
</script>
</head>
<body>

   <%-- <!-- 테스트용 세팅 -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
   Map<String,Object> bank1 = new HashMap<String,Object>();
   bank1.put("BANK_NUM","1");
   bank1.put("BANK_KIND","국민 은행");
   bank1.put("BANK_TITLE","국민 은행입니다");
   bank1.put("BANK_CONTENT","국민에게 돈 빌려 드립니다 ^오^.");
   bank1.put("BANK_HITCOUNT","152");
   bank1.put("BANK_BANK_STORED_FILE2","../img/google.png");
   
   
   List<Map<String,Object>> bank = new ArrayList<Map<String,Object>>();
   bank.add(bank1);
  
 
   request.setAttribute("bank",bank1);
%>
<!-- 테스트용 세팅 끝 --> --%>

   <h1>
      <div>제휴은행 관리</div>
   </h1>



   <div>

      <hr>

   </div>
   <form action="bankList.jsp" method="get" name="bankWriteForm">
      <div>
         ${bank.BANK_NUM}&nbsp;&nbsp; <b>은행종류</b>&nbsp;${bank.BANK_KIND}&nbsp;&nbsp;
         <b>제목</b>&nbsp;${bank.BANK_TITLE }&nbsp;&nbsp; <b>조회수</b>&nbsp;${bank.BANK_HITCOUNT}&nbsp;&nbsp;
      </div>

      <hr>
      <br />
      <c:if test="${bank.BANK_STORED_FILE1!=null && bank.BANK_STORED_FILE1!=''}">
      <div>
         <img width="500" height="300" onclick="pop(this.src)" style="cursor:pointer;"
            src="<c:url value='/bankImages/${bank.BANK_STORED_FILE1}'/>" />
      </div>
      </c:if>
      <c:if test="${bank.BANK_STORED_FILE2!=null && bank.BANK_STORED_FILE2!=''}">
      <div class="image">
         <img width="500" height="300" onclick="pop(this.src)" style="cursor:pointer;"
            src="<c:url value='/bankImages/${bank.BANK_STORED_FILE2}'/>" />
      </div>
      </c:if>
      <div>
         내용<br />
         <div>${bank.BANK_CONTENT}</div>
      </div>

      <div>
         <br />
         <hr>
         <a href="openAdminBankList">목록으로</a> <a
            href="bankModifyForm?BANK_NUM=${bank.BANK_NUM}">수정</a>
      </div>
      <hr>
   </form>
   <br />
   <br />
   <br />
   <br />
   <div>
      <%@include file="/WEB-INF/include/footer.jspf"%>
   </div>
</body>
</html>