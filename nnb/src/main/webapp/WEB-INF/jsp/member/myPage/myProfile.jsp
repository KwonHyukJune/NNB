<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage.css'/>"/>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/room.css'/>" />
<fmt:parseDate var="dateString" value="${map.RI_AVAILABLE_DATE}" pattern="yyyy-MM-dd"/>
<fmt:parseDate var="dateString2" value="${map.RI_BIRTH}" pattern="yyyy-MM-dd"/>
<script type="text/javascript">
$(document).ready(function(){
	$('#amyProfile').addClass('active');
}); 
var mem = sessionStorage.getItem("MEM_ID");
function updateMyProfile(){
	var comSubmit = new ComSubmit("frm");
	comSubmit.addParam("MEM_ID", mem);
	comSubmit.submit();
   };
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>

<div class="myProfile cAeKOJ">
	<%@ include file="myPage.jspf" %>
	<c:choose>
	<c:when test="${map!=null}">
	<div class="styled__Wrap-qdiane-0 elDNKp">
		<div class="styled__Form-qdiane-1 gffxRf">
			<div class="styled__Box-qdiane-2 LEUHe">
				<h1 class="styled__Title-qdiane-3 fHGwAQ">성별</h1>
				<div class="styled__FakeInput-qdiane-5 fZOKyS">${map.RI_GENDER}</div>
			</div>
			<div class="styled__Box-qdiane-2 LEUHe">
				<h1 class="styled__Title-qdiane-3 fHGwAQ">부담가능액</h1>
				<div class="styled__FakeInput-qdiane-5 fZOKyS">보증금: ${map.RI_LOAN_BIG}만원 / 월세:${map.RI_LOAN_SMALL}만원</div>
			</div>
			<div class="styled__Box-qdiane-2 LEUHe">
				<h1 class="styled__Title-qdiane-3 fHGwAQ">선호지역</h1>
				<div class="styled__FakeInput-qdiane-5 fZOKyS">${map.RI_REGION1}
					<c:if test="${map.RI_REGION2!=null}">
						, ${map.RI_REGION2}
					</c:if>
					<c:if test="${map.RI_REGION3!=null}">
						, ${map.RI_REGION3}
					</c:if>
				</div>
			</div>
			<div class="styled__Box-qdiane-2 LEUHe">
				<h1 class="styled__Title-qdiane-3 fHGwAQ">생일</h1>
				<div class="styled__FakeInput-qdiane-5 fZOKyS"><fmt:formatDate value="${dateString2}" pattern="yyyy-MM-dd"/></div>
			</div>
			<div class="styled__Box-qdiane-2 LEUHe">
				<h1 class="styled__Title-qdiane-3 fHGwAQ">입주 가능일</h1>
				<div class="styled__FakeInput-qdiane-5 fZOKyS"><fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd"/></div>
			</div>
			<div class="styled__Box-qdiane-2 LEUHe">
				<h1 class="styled__Title-qdiane-3 fHGwAQ">자기소개</h1>
				<textarea class="kTQnUD" name="RI_PROFILE" id="RI_PROFILE" readonly="readonly" style="resize: none;margin: 0px; width: 450px; height: 380px; padding:10px 15px;">${map.RI_PROFILE}</textarea>
			</div>
		</div>
		<div class="styled__BtnWrap-qdiane-16 kHllhC">
			<button class="styled__EditBtn-qdiane-19 gsJtOS styled__Btn-qdiane-17 ejTRmD" 
				onclick="location.href='/nnb/myPage/myProfileModifyForm?RI_MEM_ID=${map.RI_MEM_ID}'">수정</button>
		</div>
		<div class="styled__BtnWrap-sc-1yi6h0n-0 PfvsJ">
			<button onclick="location.href='/nnb/myPage/myProfileDelete?RI_MEM_ID=${map.RI_MEM_ID}'">내 룸메이트 정보 삭제</button>
		</div>
	</div>
	</c:when>
	<c:otherwise>
		<br>
		<div style="text-align:center">
		<div>
			등록된 프로필이 없습니다.
		</div>
		<Br>
		<a href="<c:url value='/myPage/registMyProfileForm'/>">새로 작성하기</a>
		</div>
	</c:otherwise>
</c:choose>
</div>
<br>

</body>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</html>
