<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>
<script type="text/javascript">
function openDetail(obj){
	var url = obj.children('#id').text();
	var strUrl = "<%=request.getContextPath()%>"+"/roommate/detail?id="+url;
	window.open(strUrl);
};

</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="myInterest.jspf" %>
<script type="text/javascript">
$('.tabmenu:nth-child(3)').addClass('active');
</script>

<div class="myRoommateList hVYleu">

<div class="jZuXcw">
<p class="fxSxol">총 <span id="count"></span>명의 찜한 룸메이트가 있습니다.</p>
</div>
<ul id="mateList"></ul>
<div id="PAGE_NAVI"></div>
<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX">

</div>


<div class="footer">
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>

<script type="text/javascript">
function fn_deleteFav(obj){
	var str = window.location.href;
	var url = "redirect:"+str.split("<%=request.getContextPath()%>")[1];
	var num = obj.children('#num').text();
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/roommate/addFavRoommate'/>");
	comSubmit.addParam("check", 1);
	comSubmit.addParam("RI_MEM_ID", num);
	comSubmit.addParam("MEM_ID", idChk);
	comSubmit.addParam("url", url);
	comSubmit.submit();
}
$(document).ready(function() {
	var PAGE_INDEX = gfn_isNull("${param.PAGE_INDEX}")==true? "1": "${param.PAGE_INDEX}";
	$("#PAGE_INDEX").val(PAGE_INDEX);
	fn_selectFavMateList(PAGE_INDEX);
});
	function fn_selectFavMateList(pageNo){
		var comAjax = new ComAjax(); 
		comAjax.setUrl("<c:url value='/myInterest/openFavRoommateList'/>"); 
		comAjax.setCallback("fn_selectFavMateListCallback"); 
		comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val()); 
		comAjax.addParam("PAGE_ROW", 15); 
		comAjax.ajax(); 
	}
	
	function fn_selectFavMateListCallback(data){ 
		var total = data.total;
		var body = $("ul#mateList"); 
		body.empty(); 
		
		if(total == 0){ 
			$("#count").empty();
			$("#count").append('0');
			var str = "<a href='<c:url value='/searchRoommate'/>' class='btn'>룸메이트 보러가기</a>"; 
			body.append(str); 
	        	
		} else{ 
			var params = { 
				divId : "PAGE_NAVI", 
				pageIndex : "PAGE_INDEX", 
				totalCount : total, 
				eventName : "fn_selectFavMateList" 
				}; 
			
			gfn_renderPaging(params); 
				var count = data.total;
				$("#count").empty();
				$("#count").append(count);
				var str	=	"";
					$.each(data.list, function(key, mate){ 
						str	+=	"<div id='id' style='display:none;'>" + mate.RI_MEM_ID + "</div>"
							+	"<li class='qUCQS2'>"
								+	"<a href='#' onclick='openDetail($(this));' class='btn hVfzba2'>"
									+	"<div>" + mate.MEM_NICK + "</div>"
									+	"<div>" + mate.RI_BIRTH + "</div>"
									+	"<div>";
									if(mate.RI_GENDER=='F'){
						str	+=			"여자";
									}else if(mate.RI_GENDER=='M'){
						str	+=			"남자";
									}
						str	+=			"</div>"
									+	"<div>" + mate.RI_REGION1 + "</div>"
									+	"<div>" + mate.RI_LOAN_BIG + "/" + mate.RI_LOAN_SMALL + "</div>"
									+	"<div>";
									str	+=	"<div class='deleteFav' onclick='fn_deleteFav($(this));'>"
											+	"<div id='num' style='display:none;'>"
												+	mate.RI_MEM_ID
											+	"</div>"
										+	"</div>";
								str	+=	"</div>"
								+	"</a>"
							+	"</li>";
			       	}); 
			       	body.append(str); 
			} 
	}
</script>

</body>
</html>
