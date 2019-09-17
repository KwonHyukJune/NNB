<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/roommate.css'/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/search.css'/>"/>
<script type="text/javascript">
	var mem = sessionStorage.getItem("MEM_ID");
	/* function report(){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/roommate/reportUser'/>");
		comAjax.addParam("REPORT_D_ID","${mate.RI_MEM_ID}");
		comAjax.ajax();
	}; */

/*  	 function ignore(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/roommate/ignore'/>");
		comSubmit.addParam("IGNORE_MEM","${mate.MEM_ID}");
		comSubmit.addParam("IGNORE_D_MEM","${mate.RI_MEM_ID}");
		comSubmit.addParam("check",0); 
		comSubmit.submit();
	};   */
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
		if(${param.report==1}){
			alert('신고가 정상적으로 접수되었습니다.');
		}
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
<tr ><a id="aa"><th id="asl">입주시기 </th></a><td id="dsl">${mate.RI_AVAILABLE_DATE}</td></tr>
<tr ><a id="aa"><th id="asl">자기소개 </th></a><td id="dsl">${mate.RI_PROFILE}</td></tr>
<tr ><a id="aa"><th id="asl">성별 </th></a><td id="dsl">${mate.RI_GENDER}</td></tr>
</table>
		<div class="ignore" style="text-align:center;"><a href="#" class="btn" onclick="ignore();">차단</a></div>
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
	<div style="text-align:center;">
<a href="<c:url value='/roommate/detail/messageWriteForm?RECEIVER=${mate.MEM_ID}'/>" class="btn">메시지 보내기</a>
	<button id="openReport" type="button" class="lhWOpc" value="평" style="position:inherit;">
		<svg width="17" height="18" viewBox="0 0 17 18"><g fill="none" fill-rule="evenodd"><path stroke-width="1.2" d="M8.6.6h1v1.8h-1zM15.207 2.934l.707.707-1.273 1.273-.707-.707zM1.934 2.793l.707-.707 1.273 1.273-.707.707z"></path><path d="M3.5 17.5h10V11A4.5 4.5 0 0 0 9 6.5H8A4.5 4.5 0 0 0 3.5 11v6.5z"></path><path stroke-width="1.2" d="M.6 17.6h15.8v1H.6z"></path></g></svg>
		<span>신고하기</span>
	</button>
</div>
<div style="text-align:center;">
	<a href="#" class="btn" onclick="javascript:window.close();" style="text-align:center;">닫기</a>
</div>
<br>
<%-- <div class="footer">
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div> --%>
<script type="text/javascript">
$(document).ready(function(){
	var modal = document.getElementById('myModal2');
    var btn = document.getElementById('openReport');
    var span = document.getElementsByClassName("close2")[0]; 
    var idChk = "<%=(String)session.getAttribute("MEM_ID")%>";
    btn.onclick = function() {
    	var loginCH = idChk
		if (loginCH == 'null'){
			alert("로그인을 하셔야 이용하실 수 있는 기능입니다");
		}else{
        modal.style.display = 'block';
		}
    }
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	    modal.style.display = 'none';
	}
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = 'none';
        }
    }

});
</script>
<div id="myModal2" class="modal2">
	<div class="styled__Overlay-sc-17v8eyt-0 dajUZo">
		<div class="styled__Wrap-sc-17v8eyt-1 hezqfH" style="width:400px; margin: 15px auto;">
			<header class="styled__Header-sc-17v8eyt-2 GoREo">
				<h1>불량이용자 신고</h1>
				<button class="styled__CloseBtn-sc-17v8eyt-3 kXLdvu close2">
				<svg width="30" height="30" viewBox="0 0 32 32">
					<g fill="none" fill-rule="evenodd" transform="translate(1 1)">
						<circle class="Circle" cx="15" cy="15" r="15">
						</circle>
						<g class="Close" stroke-linecap="round" stroke-width="2">
							<path d="M19.243 19.243l-8.486-8.486M19.243 10.757l-8.486 8.486"></path>
						</g>
					</g>
				</svg>
				</button>
			</header>
			
			<form action="/nnb/reportmate">
			<div class="styled__Wrap-sc-1n1jlbj-0 sAnxl">
				<div class="styled__Notice-sc-1n1jlbj-1 kNWuAm">
					<h1>불량 이용자를 신고해주세요!</h1>
					<p>확인 후 불량 이용자일 경우 해당 정보가 삭제되거나 이용이 제재됩니다.</p>
					<p>허위신고일 시 신고자는 법적인 책임을 질 수 있습니다.</p>
					<p>니내방은 자체 검열을 통해 불량이용자 근절에 노력하고 있습니다.</p>
				</div>
				<div class="styled__Box-sc-1n1jlbj-2 dSVCPu" style="margin-top:20px;">
					<h1 class="styled__BoxTitle-sc-1n1jlbj-3 dpGWsW" style="margin-bottom: 10px;">신고항목
						<span>(*필수)</span>
					</h1>
					<div class="styled__CheckWrap-sc-1n1jlbj-4 jrruna" style="height:50px; margin-bottom:15px;">
						<label class="clearfix Checkbox__Label-ifp1yz-0 kAqGVi" size="22">
							<input type="radio" class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" name="REPORT_TYPE" value="1">
							<span class="CheckBox"></span>
							<span class="styled__CheckText-sc-1n1jlbj-5 llNbGB">욕설/비하/음란물/불건전한 만남 및 대화</span>
						</label>
						<label class="clearfix Checkbox__Label-ifp1yz-0 kAqGVi" size="22" style="margin-left:0; margin-top:5px;">
							<input type="radio" class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" name="REPORT_TYPE" value="2">
							<span class="CheckBox"></span>
							<span class="styled__CheckText-sc-1n1jlbj-5 llNbGB">상업적 광고 및 판매</span>
						</label>
					</div>
						<textarea class="styled__Area-sc-1n1jlbj-6 eKDcBx Textarea-sc-6jro6l-0 hunnDM" name="REPORT_REASON" placeholder="추가 설명을 입력하세요." rows="3" style="height: 70px;">
</textarea>
				</div>
				<input type="hidden" name="REPORT_TITLE" value="이용자 [${mate.MEM_NICK}]에 대한 신고글입니다."/>
				<input type="hidden" name="REPORT_D_ID" value="${mate.MEM_ID}"/>
				<button class="styled__Btn-sc-1n1jlbj-18 bucdvX" id="report">신고 제출하기</button>
			</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>
