<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제휴 은행 리스트</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@include file="/WEB-INF/include/adminHeader.jspf"%>
</head>

<br />
<br />
<br />

<body>


   <h1>
      <div>제휴은행 관리</div>
   </h1>
   <br />
   <hr>

   <br />
   <br />
   <br />

   <div class="selectBankList">


      <div class="bankList">
         <c:forEach var="bank" items="${list}">
            <div class="bank">
               <a href="#" onClick="javascript:goPage1(${bank.BANK_NUM})">

                  <div>${bank.RNUM}&nbsp; ${bank.BANK_KIND}&nbsp;
                     ${bank.BANK_REGDATE}&nbsp; ${bank.BANK_HITCOUNT}&nbsp;
                     ${bank.BANK_TITLE}
                  </div>
               </a> 
               <a href="#" onClick="goPage3(${bank.BANK_NUM})">수정</a> <a href="#"
                  class="btn" id="${bank.BANK_NUM}"
                  onclick="delet(${bank.BANK_NUM})">삭제</a>

               <div></div>
            </div>
         </c:forEach>
         <c:if test="${list.size()==0}">
등록된 글이 없습니다.
</c:if>
         <a href="bankWriteForm">새 글 등록</a>

      </div>


   </div>
   <br>
   <div>
      <%@include file="/WEB-INF/include/footer.jspf"%>
   </div>
  
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">

function goPage1(num) {    //리스트 누르면 상세보기
   location.href="bankDetail?num="+num; 
   }
           
function goPage3(num) {   // 수정
   location.href="bankModifyForm?num="+num; 
   }
function delet(num){
   if(confirm('삭제하시겠습니까?')){
      var x = $('a#'+num);
      var str = "<form id='frm' method='post' action='bankDelete'>"
            + "<input type='hidden' name='num' value='"+num+"'>"
            + "</form>";
      x.html(str);
      console.log(str);
      frm.submit();
   }
}

</script>
</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>제휴 은행 리스트</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@include file="/WEB-INF/include/adminHeader.jspf"%>

<!-------------------------------------------------------------- -->
</head>

<br />
<br />
<br />

<body>


	<div>
		<h1>제휴 은행 관리</h1>
	</div>
	<br />
	<hr>
	

	<br />
	<br />
	<br />

	<div class="selectBankList">


	</div>
	<div id="PAGE_NAVI"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
   
   <br>
   	<div>    
  		<a href="#" onClick="goPage1(${map.NT_NUM})">새 글 등록</a>
	</div>



<br>
	<div>
		<%@include file="/WEB-INF/include/footer.jspf"%>
	</div>
	
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">
	
function delet(num){  // 삭제
	if(confirm('삭제하시겠습니까?')){
		var x = $('a#'+num);
		var str = "<form id='frm' method='post' action='bankDelete'>"
				+ "<input type='hidden' name='BANK_NUM' value='"+num+"'>"
				+ "</form>";
		console.log(str);
		x.html(str);
		frm.submit();
	}
}

function goPage(num) {   // 수정
	location.href="bankModifyForm?BANK_NUM="+num; 
	}
	
function goPage1(num) {   // 새 공지사항 등록
	location.href="bankWriteForm?BANK_NUM="+num; 
	}	
	
$(document).ready(function(){
	fn_selectBankList(1);
})


function fn_selectBankList(pageNo){
	var comAjax = new ComAjax(); 
	comAjax.setUrl("<c:url value='/admin/bankList'/>"); 
	comAjax.setCallback("fn_selectBankListCallback"); 
	comAjax.addParam("PAGE_INDEX",pageNo); 
	comAjax.addParam("PAGE_ROW", 15); 
	comAjax.ajax(); }

function fn_selectBankListCallback(data){ 
	var total = data.TOTAL; 
	var body = $("div.selectBankList"); 
	body.empty(); 
	if(total == 0){ 
		var str = "<div class='bank'>" + "조회된 결과가 없습니다." 
		+ "</div>"; 
		body.append(str); 
	
	} else{ 
		var params = { 
					divId : "PAGE_NAVI", 
					pageIndex : "PAGE_INDEX", 
					totalCount : total, 
					eventName : "fn_selectBankList" 
					}; 
		gfn_renderPaging(params); 
		var str = ""; 
		$.each(data.list, function(key, value){ 
			str += 
			    "<div class='bank'>" 
	    			+ "<a href='<c:url value='/admin/bankDetail?num=${" + value.NT_NUM + "}'/>'>"+ 
	    					value.RNUM +"&nbsp;"+ value.NT_TYPE +"&nbsp;"+ value.NT_DATE +"&nbsp;"+ value.NT_TITLE + "</a>"
	    			+ "<a href='#' onClick='goPage(" + value.NT_NUM + ")'>+ 수정" + "</a>"
					+ "<a href='#' class='btn' id='" + value.NT_NUM +"' onclick='delet("+ value.NT_NUM +")'>삭제</a>"
				+ "</div>";

			}); 
		body.append(str); 
	} 
}
</script>
</body>
</html>
