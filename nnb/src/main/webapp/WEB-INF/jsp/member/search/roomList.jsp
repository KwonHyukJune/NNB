<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/search.css'/>"/>
<script src="<c:url value='/js/nouislider/nouislider.js'/>" charset="utf-8"></script>
<script type="text/javascript">

function toggle(obj){
	if(obj.attr("class")=="fJNXpX"){
		$(".cRtqxV").attr("class","fJNXpX");
		$(".hKGAZL").attr("class","fUMVvC");
		$(".kdfXro").attr("class","bAZEbe");
		$(".fhfjff").hide();
		$(".dIVcAa").hide();
		obj.attr("class","cRtqxV");
		obj.next().show();
	}else if(obj.attr("class")=="cRtqxV"){
		obj.attr("class","fJNXpX");
		obj.next().hide();
	}
	if(obj.attr("class")=="fUMVvC"){
		$(".cRtqxV").attr("class","fJNXpX");
		$(".hKGAZL").attr("class","fUMVvC");
		$(".kdfXro").attr("class","bAZEbe");
		$(".fhfjff").hide();
		$(".dIVcAa").hide();
		obj.attr("class","hKGAZL");
		obj.next().show();
	}else if(obj.attr("class")=="hKGAZL"){
		obj.attr("class","fUMVvC");
		obj.next().hide();
	}
	if(obj.attr("class")=="bAZEbe"){
		$(".cRtqxV").attr("class","fJNXpX");
		$(".hKGAZL").attr("class","fUMVvC");
		$(".kdfXro").attr("class","bAZEbe");
		$(".fhfjff").hide();
		obj.attr("class","kdfXro");
		obj.next().show();
	}else if(obj.attr("class")=="kdfXro"){
		obj.attr("class","bAZEbe");
		obj.next().hide();
	}
}
function divsize(obj){
	var check = obj.attr('class');
	console.log(check);
	if(check=="cHCsIX"){
		obj.parent().css('width','512px');
		obj.parent().next('left','512px');
		$('.gdoUVB').css('left','512px');
		$('li.room').css('width','50%');
		obj.attr('class','HggYs');
		console.log('dd');
	}else{
		obj.parent().css('width','980px');
		obj.parent().next('left','980px');
		$('.gdoUVB').css('left','980px');
		$('li.room').css('width','25%');
		obj.attr('class','cHCsIX');
		console.log('ss');
	}
}
</script>
</head>
<!-------------------------------------------------------------- -->
<body>
<div class="root">
<!-- 전체 -->
<div id="searchOption" class="ePlFZY">
<!-- 헤더+검색창 -->
<div class="hJtKYy">
<%@ include file="/WEB-INF/include/header.jspf" %>
<!-- 검색 영역 -->
<div class="dWEBFj">
	<div class="byjidO">
		<input class="keOJyH" type="text" name="region" class="search" id="region" placeholder="잠실동 아파트" value="" onkeyup="fn_search();">
		<svg width="18" height="18" viewBox="0 0 18 18"><g fill="none" fill-rule="evenodd" stroke="#222"><circle cx="7.5" cy="7.5" r="6.5"></circle><path d="M12 12l5 5"></path></g></svg>
	</div>
	<div class="fvkqQK">
		<div class="hWgOZv">
			<div class="fJNXpX" onclick="toggle($(this));">
				<span>원룸, 투·쓰리룸, 오피스텔</span>
				<svg width="11" height="7" viewBox="0 0 11 7"><path fill="none" fill-rule="evenodd" stroke-width="1.5" d="M.658 1.021l4.537 4.263 4.463-4.263"></path></svg>
			</div>
			<div class="fhfjff" style="left:0px;">
				<h1 class="lmqlXb">방 종류	<p class="dUdesp">중복선택이 가능합니다.</p></h1>
				<ul class="hpBewf">
					<li>
						<label class="kAqGVi">
							<input type="checkbox" class="ROOM_TYPE PcMeW" name="ROOM_TYPE" value="원룸" checked="true">
							<span class="CheckBox"></span>
							<span class="kMvalg">원룸</span>
						</label>
					</li>
					<li>
						<label class="kAqGVi">
							<input type="checkbox" class="ROOM_TYPE PcMeW" name="ROOM_TYPE" value="투룸" checked="true">
							<span class="CheckBox"></span>
							<span class="kMvalg">투룸</span>
						</label>
					</li>
					<li>
						<label class="kAqGVi">
							<input type="checkbox" class="ROOM_TYPE PcMeW" name="ROOM_TYPE" value="쓰리룸" checked="true">
							<span class="CheckBox"></span>
							<span class="kMvalg">쓰리룸</span>
						</label>
					</li>
					<li>
						<label class="kAqGVi">
							<input type="checkbox" class="ROOM_TYPE PcMeW" name="ROOM_TYPE" value="오피스텔" checked="true">
							<span class="CheckBox"></span>
							<span class="kMvalg">오피스텔</span>
						</label>
					</li>
					<li>
						<label class="kAqGVi">
							<input type="checkbox" class="ROOM_TYPE PcMeW" name="ROOM_TYPE" value="아파트" checked="true">
							<span class="CheckBox"></span>
							<span class="kMvalg">아파트</span>
						</label>
					</li>
				</ul>
			</div>
		</div>
		<div class="hWgOZv">
			<div class="fJNXpX" onclick="toggle($(this));">
				<span>월세, 전세, 매매</span>
				<svg width="11" height="7" viewBox="0 0 11 7"><path fill="none" fill-rule="evenodd" stroke-width="1.5" d="M.658 1.021l4.537 4.263 4.463-4.263"></path></svg>
			</div>
			<div class="fhfjff" style="left:0px;">
				<h1 class="lmqlXb">매물 종류<p class="dUdesp">중복선택이 가능합니다.</p></h1>
				<ul class="eLjSYd">
					<li>
						<label class="kAqGVi">
							<input type="checkbox" class="TRADE_TYPE PcMeW" name="TRADE_TYPE" value="월세" checked="true">
							<span class="CheckBox"></span>
							<span class="nmQzi">월세</span>
						</label>
					</li>
					<li>
						<label class="kAqGVi">
							<input type="checkbox" class="TRADE_TYPE PcMeW" name="TRADE_TYPE" value="전세" checked="true">
							<span class="CheckBox"></span>
							<span class="nmQzi">전세</span>
						</label>
					</li>
				</ul>
			</div>
		</div>
		<div class="hWgOZv">
			<div class="fUMVvC" onclick="toggle($(this));">
				<span>가격대</span>
				<svg width="11" height="7" viewBox="0 0 11 7"><path fill="none" fill-rule="evenodd" stroke-width="1.5" d="M.658 1.021l4.537 4.263 4.463-4.263"></path></svg>
			</div>
			<div class="fhfjff" style="left:0px;">
				<div class="fBFAQm">
					<h1 class="lmqlXb">보증금/전세가<p class="eavwzc" id='p1'></p></h1>
					<div class="jqwYlT">
						<input type="hidden" name="MONTHLY_DEPOSIT_MIN" id="MONTHLY_DEPOSIT_MIN" value="0">
						<input type="hidden" name="MONTHLY_DEPOSIT_MAX" id="MONTHLY_DEPOSIT_MAX" value="무제한">
						<div class="noUi-target noUi-ltr noUi-horizontal" id="noUi-target"></div>
					</div>
					<ul class="ghXquW">
						<li>0</li>
						<li>1억 1000만 원</li>
						<li>무제한</li>
					</ul>
				</div>
				<div class="fBFAQm">
					<h1 class="lmqlXb">월세<p class="eavwzc" id='p2'></p></h1>
					<div class="jqwYlT">
						<input type="hidden" name="MONTHLY_PAYMENT_MIN" id="MONTHLY_PAYMENT_MIN" value="0">
						<input type="hidden" name="MONTHLY_PAYMENT_MAX" id="MONTHLY_PAYMENT_MAX" value="무제한">
						<div class="noUi-target noUi-ltr noUi-horizontal"></div>
					</div>
					<ul class="ghXquW">
						<li>0</li>
						<li>150만 원</li>
						<li>무제한</li>
					</ul>
				</div>
				<div class="kaLNCK">
					<button class="dBaYDj">
						<svg width="22" height="22" viewBox="0 0 22 22"><path fill="#000" fill-rule="evenodd" d="M15.344 10.344h-2L16 7.688l2.688 2.656h-2c0 .96-.245 1.856-.736 2.688-.47.81-1.11 1.45-1.92 1.92a5.201 5.201 0 0 1-2.688.736c-.512 0-1.01-.075-1.496-.224a5.476 5.476 0 0 1-1.352-.624l.976-.96c.565.31 1.19.464 1.872.464.725 0 1.395-.179 2.008-.536a3.972 3.972 0 0 0 1.456-1.456 3.918 3.918 0 0 0 .536-2.008zm-9.344 0c0-.96.245-1.856.736-2.688.47-.81 1.11-1.45 1.92-1.92A5.201 5.201 0 0 1 11.344 5c.512 0 1.013.072 1.504.216.49.144.939.355 1.344.632l-.976.96a3.835 3.835 0 0 0-1.872-.464c-.725 0-1.395.179-2.008.536A3.972 3.972 0 0 0 7.88 8.336a3.918 3.918 0 0 0-.536 2.008h2L6.688 13 4 10.344h2z"></path></svg>
						조건삭제
					</button>
				</div>
			</div>
		</div>
		<div class="hWgOZv">
			<div class="fUMVvC" onclick="toggle($(this));">
				<span>관리비</span>
				<svg width="11" height="7" viewBox="0 0 11 7"><path fill="none" fill-rule="evenodd" stroke-width="1.5" d="M.658 1.021l4.537 4.263 4.463-4.263"></path></svg>
			</div>
			<div class="fhfjff" style="left:0px;">
				<div class="fBFAQm">
					<h1 class="lmqlXb">관리비<p class="eavwzc" id='p3'></p></h1>
					<div class="jqwYlT">
						<input type="hidden" name="UTILITY_PRICE_MIN" id="UTILITY_PRICE_MIN" value="0">
						<input type="hidden" name="UTILITY_PRICE_MAX" id="UTILITY_PRICE_MAX" value="무제한">
						<div class="noUi-target noUi-ltr noUi-horizontal"></div>
					</div>
					<ul class="ghXquW">
						<li>0</li>
						<li>25만 원</li>
						<li>무제한</li>
					</ul>
				</div>
				<div class="kaLNCK">
					<button class="dBaYDj">
						<svg width="22" height="22" viewBox="0 0 22 22"><path fill="#000" fill-rule="evenodd" d="M15.344 10.344h-2L16 7.688l2.688 2.656h-2c0 .96-.245 1.856-.736 2.688-.47.81-1.11 1.45-1.92 1.92a5.201 5.201 0 0 1-2.688.736c-.512 0-1.01-.075-1.496-.224a5.476 5.476 0 0 1-1.352-.624l.976-.96c.565.31 1.19.464 1.872.464.725 0 1.395-.179 2.008-.536a3.972 3.972 0 0 0 1.456-1.456 3.918 3.918 0 0 0 .536-2.008zm-9.344 0c0-.96.245-1.856.736-2.688.47-.81 1.11-1.45 1.92-1.92A5.201 5.201 0 0 1 11.344 5c.512 0 1.013.072 1.504.216.49.144.939.355 1.344.632l-.976.96a3.835 3.835 0 0 0-1.872-.464c-.725 0-1.395.179-2.008.536A3.972 3.972 0 0 0 7.88 8.336a3.918 3.918 0 0 0-.536 2.008h2L6.688 13 4 10.344h2z"></path></svg>
						조건삭제
					</button>
				</div>
			</div>
		</div>
		<div class="hWgOZv">
			<div class="fUMVvC" onclick="toggle($(this));">
				<span>방크기</span>
				<svg width="11" height="7" viewBox="0 0 11 7"><path fill="none" fill-rule="evenodd" stroke-width="1.5" d="M.658 1.021l4.537 4.263 4.463-4.263"></path></svg>
			</div>
			<div class="fhfjff" style="left:0px;">
				<div class="fBFAQm">
					<h1 class="lmqlXb">방크기<p class="eavwzc" id='p4'></p></h1>
					<input type="hidden" name="REAL_SIZE_MIN" id="REAL_SIZE_MIN" value="15">
					<input type="hidden" name="REAL_SIZE_MAX" id="REAL_SIZE_MAX" value="무제한">
					<div class="jqwYlT">
						<div class="noUi-target noUi-ltr noUi-horizontal"></div>
					</div>
					<ul class="ghXquW">
						<li>0m²(0평)</li>
						<li>40m²(13평)</li>
						<li>무제한</li>
					</ul>
				</div>
				<div class="kaLNCK">
					<button class="dBaYDj">
						<svg width="22" height="22" viewBox="0 0 22 22"><path fill="#000" fill-rule="evenodd" d="M15.344 10.344h-2L16 7.688l2.688 2.656h-2c0 .96-.245 1.856-.736 2.688-.47.81-1.11 1.45-1.92 1.92a5.201 5.201 0 0 1-2.688.736c-.512 0-1.01-.075-1.496-.224a5.476 5.476 0 0 1-1.352-.624l.976-.96c.565.31 1.19.464 1.872.464.725 0 1.395-.179 2.008-.536a3.972 3.972 0 0 0 1.456-1.456 3.918 3.918 0 0 0 .536-2.008zm-9.344 0c0-.96.245-1.856.736-2.688.47-.81 1.11-1.45 1.92-1.92A5.201 5.201 0 0 1 11.344 5c.512 0 1.013.072 1.504.216.49.144.939.355 1.344.632l-.976.96a3.835 3.835 0 0 0-1.872-.464c-.725 0-1.395.179-2.008.536A3.972 3.972 0 0 0 7.88 8.336a3.918 3.918 0 0 0-.536 2.008h2L6.688 13 4 10.344h2z"></path></svg>
						조건삭제
					</button>
				</div>
			</div>
		</div>
		<div class="dgiYtt">
			<div class="bAZEbe" onclick="toggle($(this));">
				<span>추가필터</span>
				<svg width="11" height="7" viewBox="0 0 11 7"><path fill="none" fill-rule="evenodd" stroke-width="1.5" d="M.658 1.021l4.537 4.263 4.463-4.263"></path></svg>
			</div>
			<div class="dIVcAa">
				<table class="cgRTwE">
					<colgroup><col width="240px"><col width="240px"><col width="240px"><col width="240px"></colgroup>
					<tbody>
						<tr style="height: 290px;">
							<td>
								<h1 class="jpAxXq">
									층수<font>중복선택이 가능합니다.</font>
								</h1>
								<ul class="gpNskk">
									<li class="cHPNZJ">
										<label class="kAqGVi">
											<input type="checkbox" id="allChk" name="ROOM_FLOOR" class="PcMeW ROOM_FLOOR" value="" checked="checked">
											<span class="CheckBox"></span>
											<span class="cmTDVA">전체</span>
										</label>
									</li>
									<li class="cHPNZJ">
										<label class="kAqGVi">
											<input type="checkbox" id="ROOM_FLOOR" name="ROOM_FLOOR" class="PcMeW ROOM_FLOOR" value="1" checked="checked">
											<span class="CheckBox"></span>
											<span class="cmTDVA">1층</span>
										</label>
									</li>
									<li class="cHPNZJ">
										<label class="kAqGVi">
											<input type="checkbox" id="ROOM_FLOOR" name="ROOM_FLOOR" class="PcMeW ROOM_FLOOR" value="2" checked="checked">
											<span class="CheckBox"></span>
											<span class="cmTDVA">2층</span>
										</label>
									</li>
									<li class="cHPNZJ">
										<label class="kAqGVi">
											<input type="checkbox" id="ROOM_FLOOR" name="ROOM_FLOOR" class="PcMeW ROOM_FLOOR" value="3" checked="checked">
											<span class="CheckBox"></span>
											<span class="cmTDVA">3층</span>
										</label>
									</li>
									<li class="cHPNZJ">
										<label class="kAqGVi">
											<input type="checkbox" id="ROOM_FLOOR" name="ROOM_FLOOR" class="PcMeW ROOM_FLOOR" value="4" checked="checked">
											<span class="CheckBox"></span>
											<span class="cmTDVA">4층</span>
										</label>
									</li>
								</ul>
								<ul class="gpNskk">
									<li class="cHPNZJ">
										<label class="kAqGVi">
											<input type="checkbox" id="ROOM_FLOOR" name="ROOM_FLOOR" class="PcMeW ROOM_FLOOR" value="5" checked="checked">
											<span class="CheckBox"></span>
											<span class="cmTDVA">5층</span>
										</label>
									</li>
									<li class="cHPNZJ">
										<label class="kAqGVi">
											<input type="checkbox" id="ROOM_FLOOR" name="ROOM_FLOOR" class="PcMeW ROOM_FLOOR" value="6" checked="checked">
											<span class="CheckBox"></span>
											<span class="cmTDVA">6층</span>
										</label>
									</li>
									<li class="cHPNZJ">
										<label class="kAqGVi">
											<input type="checkbox" id="ROOM_FLOOR" name="ROOM_FLOOR" class="PcMeW ROOM_FLOOR" value="7" checked="checked">
											<span class="CheckBox"></span>
											<span class="cmTDVA">7층 이상</span>
										</label>
									</li>
									<li class="cHPNZJ">
										<label class="kAqGVi">
											<input type="checkbox" id="ROOM_FLOOR" name="ROOM_FLOOR" class="PcMeW ROOM_FLOOR" value="0" checked="checked">
											<span class="CheckBox"></span>
											<span class="cmTDVA">반지층</span>
										</label>
									</li>
									<li class="cHPNZJ">
										<label class="kAqGVi">
											<input type="checkbox" id="ROOM_FLOOR" name="ROOM_FLOOR" class="PcMeW ROOM_FLOOR" value="-1" checked="checked">
											<span class="CheckBox"></span>
											<span class="cmTDVA">옥탑방</span>
										</label>
									</li>
								</ul>
							</td>
							<td>
								<h1 class="jpAxXq">
									방구조<font>중복선택이 가능합니다.</font>
								</h1>
								<ul>
									<li class="bKVwEL">
										<label class="kAqGVi">
											<input type="checkbox" class="PcMeW STRUCTURES" name="STRUCTURES" value="2">
											<span class="CheckBox"></span>
											<span class="cmTDVA">주방 분리형(1.5룸)</span>
										</label>
									</li>
									<li class="bKVwEL">
										<label class="kAqGVi">
											<input type="checkbox" class="PcMeW STRUCTURES" name="STRUCTURES" value="1">
											<span class="CheckBox"></span>
											<span class="cmTDVA">복층</span>
										</label>
									</li>
								</ul>
							</td>
						</tr>
						<tr style="height:237px;">
							<td colspan="3">
								<h1 class="jpAxXq" style="margin-bottom:12px;">
									<span>추가 옵션</span>
									<font>중복선택이 가능합니다.</font>
								</h1>
								<ul class="geOCej">
									<li>
										<label class="jAoody">
											<input type="checkbox" name="PARKING" class="PARKING" value="1">
											<p class="jhkKdW">주차가능</p>
										</label>
									</li>
									<li>
										<label class="jAoody">
											<input type="checkbox" name="PET" class="PET" value="1">
											<p class="jhkKdW">반려동물</p>
										</label>
									</li>
									<li>
										<label class="jAoody">
											<input type="checkbox" name="ELEVATOR" class="ELEVATOR" value="1">
											<p class="jhkKdW">엘리베이터</p>
										</label class="jAoody">
									</li>
									<li>
										<label class="jAoody">
											<input type="checkbox" name="BALCONY" class="BALCONY" value="1">
											<p class="jhkKdW">베란다/발코니</p>
										</label>
									</li>
									<li>
										<label class="jAoody">
											<input type="checkbox" name="BUILT_IN" class="BUILT_IN" value="1">
											<p class="jhkKdW">빌트인</p>
										</label>
									</li>
									<li>
										<label class="jAoody">
											<input type="checkbox" name="OPTIONS" class="OPTIONS" value="1,2,8,9">
											<p class="jhkKdW">풀옵션</p>
										</label>
									</li>
									<li>
										<label class="jAoody">
											<input type="checkbox" name="LOAN_ACCESS" class="LOAN_ACCESS" value="1">
											<p class="jhkKdW">전세자금대출</p>
										</label>
									</li>
								</ul>
								<div class="bFZgGt">
									<svg x="0" y="0" width="18" height="18" viewBox="0 0 27 27"><clipPath id="c1_1"><path d="M13.7,20.6c-.6,0,-1.1,-.5,-1.1,-1.1c0,-.7,.5,-1.2,1.1,-1.2c.7,0,1.2,.5,1.2,1.2c0,.6,-.5,1.1,-1.2,1.1Zm.1,-3.8c-1,0,-1.2,-8.3,-1.2,-9.2c0,-.8,.5,-1.5,1.2,-1.5c.6,0,1.1,.7,1.1,1.5c0,.9,-.2,9.2,-1.1,9.2Z"></path></clipPath><g><circle cx="13.5" cy="13.5" r="13.5" fill="#E6E7EA"></circle><path fill="#9C9EA3" d="M5,28.3H22.5V-1.4H5V28.3Z" clip-path="url(#c1_1)"></path></g></svg>
									<p class="styled__Desc-gzb3pm-4 diBSwb">풀옵션 항목은 세탁기, 냉장고, 에어컨, 가스레인지 또는 인덕션입니다.</p>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 검색 영역 끝 -->
</div>
<!-- 헤더+검색 영역 끝 -->
<!-- 방 정보 영역 -->
<div class="gftUiJ">
	<!-- 방 리스트 영역 -->
	<div class="bcjswF">
		<div class="eXwtu">
			<div class="jLBlsX">
				<a class="hXdylP">조건에 맞는 방: <span id="count"></span> 개</a>
			</div>
			<!-- 방 리스트 영역 --> 
			<div class="cDzGDZ" >
				<ul class='fxRDHg' id="selectSearchRoomList">
				
				</ul>
				<!-- 페이징 영역 -->
				<div style="text-align:center;" class="dzQBoq" id="PAGE_NAVI">    </div>
				<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
			</div>
			
			
		</div>
		<button class="cHCsIX" onclick="divsize($(this));">
			<svg width="13" height="8" viewBox="0 0 11 7"><path fill="none" fill-rule="evenodd" stroke="#444" stroke-width="1.7" d="M.658 1.021l4.537 4.263 4.463-4.263"></path></svg>
		</button>
	</div>
	<!-- 지도 영역 -->
	<div class="gdoUVB" id="mapContainer">
		<!-- 지도 -->
		<div class="UmEWE" id="map" style="overflow: hidden; background: url("https://t1.daumcdn.net/mapjsapi/images/bg_tile.png");">
		</div>
		<!-- 축척 -->
		<div style="position: absolute;cursor: default;z-index: 1;margin: 0px 6px;height: 19px;line-height: 14px;left: 0px;bottom: 0px;color: rgb(0, 0, 0);"><div style="color: rgb(0, 0, 0); text-align: center; font-size: 10px; float: left;"><div style="float: left; margin: 2px 3px 0px 4px; height: 6px; transition: width 0.1s ease 0s; border-top: none rgb(0, 0, 0); border-right: 2px solid rgb(0, 0, 0); border-bottom: 2px solid rgb(0, 0, 0); border-left: 2px solid rgb(0, 0, 0); border-image: initial; width: 58px;"></div><div style="float: left; margin: 0px 4px 0px 0px; font-family: AppleSDGothicNeo-Regular, 돋움, dotum, sans-serif; font-weight: bold; color: rgb(0, 0, 0);">4km</div></div><div style="margin: 0px 4px; float: left;"><a target="_blank" href="http://map.kakao.com/" title="Kakao 지도로 보시려면 클릭하세요." style="float: left; width: 32px; height: 10px;"><img src="https://t1.daumcdn.net/mapjsapi/images/m_bi_b.png" alt="Kakao 지도로 이동" style="float: left; width: 32px; height: 10px; border: none;"></a><div style="font: 11px/11px Arial, Tahoma, Dotum, sans-serif; float: left;"></div></div></div>
		<!-- ?? -->
		<div style="cursor: auto;position: absolute;z-index: 2;left: 0px;top: 0px;"></div>
	</div>
	<!-- 방 리스트 영역 끝 -->
</div>
<!-- 방 정보 영역 긑 -->

</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e603a6f6c5db5707c8168383f3516651&libraries=services,clusterer,drawing"></script>
</div>

<%@ include file="/WEB-INF/include/include-body.jspf"%>

<script type="text/javascript">
$("#allChk").click(function(){
    if($("#allChk").is(":checked")){
        $("input[name='ROOM_FLOOR']").prop("checked", true);
    }
    else{
        $("input[name='ROOM_FLOOR']").prop("checked", false);
    }
});
    
// 한개의 체크박스 선택 해제시 전체선택 체크박스도 해제
$("input[name='ROOM_FLOOR']").click(function(){
    if($("input[name='ROOM_FLOOR']:checked").length >9){
        $("#allChk").prop("checked", true);
    }else{
        $("#allChk").prop("checked", false);
    }
});

$(document).ready(function(){
	fn_selectSearchRoomList(1);
});

$("input[type=checkbox]").on("change",function(){
	fn_search();
});
function fn_search(){
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/search/roomList'/>");
	comAjax.setCallback("fn_selectSearchRoomListCallback");

	var ROOM_TYPE = $("input[name=ROOM_TYPE]");
	var TRADE_TYPE = $("input[name=TRADE_TYPE]");
	var ROOM_FLOOR = $("input[name=ROOM_FLOOR]");
	var STRUCTURES = $("input[name=STRUCTURES]");
	var PARKING = $("input[name=PARKING]");
	var PET = $("input[name=PET]");
	var ELEVATOR = $("input[name=ELEVATOR]");
	var BALCONY = $("input[name=BALCONY]");
	var OPTIONS = $("input[name=OPTIONS]");
	var LOAN_ACCESS = $("input[name=LOAN_ACCESS]");
	var BUILT_IN = $("input[name=BUILT_IN]");
	var MONTHLY_DEPOSIT_MIN = $("input[name=MONTHLY_DEPOSIT_MIN]");
	var MONTHLY_DEPOSIT_MAX = $("input[name=MONTHLY_DEPOSIT_MAX]");
	var REAL_SIZE_MIN = $("input[name=REAL_SIZE_MIN]");
	var REAL_SIZE_MAX = $("input[name=REAL_SIZE_MAX]");
	var MONTHLY_PAYMENT_MIN = $("input[name=MONTHLY_PAYMENT_MIN]");
	var MONTHLY_PAYMENT_MAX = $("input[name=MONTHLY_PAYMENT_MAX]");
	var UTILITY_PRICE_MIN = $("input[name=UTILITY_PRICE_MIN]");
	var UTILITY_PRICE_MAX = $("input[name=UTILITY_PRICE_MAX]");
	
	fn_addParam(comAjax,ROOM_TYPE);
	fn_addParam(comAjax,TRADE_TYPE);
	fn_addParam(comAjax,ROOM_FLOOR);
	fn_addParam(comAjax,STRUCTURES);
	fn_addParam(comAjax,PARKING);
	fn_addParam(comAjax,PET);
	fn_addParam(comAjax,ELEVATOR);
	fn_addParam(comAjax,BALCONY);
	fn_addParam(comAjax,OPTIONS);
	fn_addParam(comAjax,LOAN_ACCESS);
	fn_addParam(comAjax,BUILT_IN);
	comAjax.addParam("MONTHLY_DEPOSIT_MIN",$("#MONTHLY_DEPOSIT_MIN").val());
	comAjax.addParam("MONTHLY_DEPOSIT_MAX",$("#MONTHLY_DEPOSIT_MAX").val());
	comAjax.addParam("MONTHLY_PAYMENT_MIN",$("#MONTHLY_PAYMENT_MIN").val());
	comAjax.addParam("MONTHLY_PAYMENT_MAX",$("#MONTHLY_PAYMENT_MAX").val());
	comAjax.addParam("UTILITY_PRICE_MIN",$("#UTILITY_PRICE_MIN").val());
	comAjax.addParam("UTILITY_PRICE_MAX",$("#UTILITY_PRICE_MAX").val());
	comAjax.addParam("REAL_SIZE_MIN",$("#REAL_SIZE_MIN").val());
	comAjax.addParam("REAL_SIZE_MAX",$("#REAL_SIZE_MAX").val());
	comAjax.addParam("address",$("#region").val());
	
	comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val()); 
	comAjax.addParam("PAGE_ROW", 15); 
	comAjax.ajax();
}

function fn_selectSearchRoomList(pageNo){
	var comAjax = new ComAjax(); 
	comAjax.setUrl("<c:url value='/search/roomList'/>"); 
	comAjax.setCallback("fn_selectSearchRoomListCallback"); 
	comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val()); 
	comAjax.addParam("PAGE_ROW", 15); 
	comAjax.ajax(); }

function fn_selectSearchRoomListCallback(data){ 
	var total = data.TOTAL; 
	var body = $("ul#selectSearchRoomList"); 
	body.empty(); 
	var count = data.count;
	$("#count").empty();
	$("#count").append(count);
	
	if(total == 0){ 
		var str = "<div class='roomList'>" + "조회된 결과가 없습니다. </div>"; 
		body.append(str); 
        	
	} else{ 
		var params = { 
			divId : "PAGE_NAVI", 
			pageIndex : "PAGE_INDEX", 
			totalCount : total, 
			eventName : "fn_selectSearchRoomList" 
			}; 
		
		gfn_renderPaging(params); 
			var str = "";
			
			//지도
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
             center: new kakao.maps.LatLng(37.502541, 127.024711), // 지도의 중심좌표
             level: 3 // 지도의 확대 레벨
            };
            var map = new kakao.maps.Map(mapContainer, mapOption); //지도를 미리 생성
            var geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표 변환 객체를 생성합니다
            
			$.each(data.list, function(key, room){ 
				str +=  "<li class='room hxpbDF'>"
							+ "<div class='OUJOU'>"
								+ "<div class='fav'>";
						
								if(room.ROOM_NUM in data.favRoom){
						str	+=		  "<div class='deleteFav' onclick='fn_deleteFav($(this))'>"
										+ "<div id='num' style='display:none;'>"
											+ room.ROOM_NUM
										+ "</div>"
									+ "</div>";
								}else{
						str	+=		  "<div class='insertFav' onclick='fn_addFav($(this))'>"
										+ "<div id='num' style='display:none;'>"
											+ room.ROOM_NUM
										+ "</div>"
									+ "</div>";
								}
								
						str	+=	  "</div>"
						+ "<a href='<c:url value='/room/roomDetail?ROOM_NUM="+ room.ROOM_NUM + "'/>' class='kpKjGs'>"
							+ "<div class='img jHIGoX'>"
								+"<img src='<c:url value='/roomImages/"+ room.THUMBNAIL +"'/>'>"
							+ "</div>"
							+ "<p class='kCTBqT jBkVAv'>" + room.ROOM_TYPE + "</p>"
							+ "<p class='glovZ jBkVAv'>"+"<span>"+ room.TRADE_TYPE + " ";
							if(room.TRADE_TYPE=='월세'){
								str+= room.MONTHLY_DEPOSIT+"/"+room.MONTHLY_PAYMENT;
							}else if(room.TRADE_TYPE=='전세'){
								if(room.JEONSE>=10000){
									room.JEONSE = parseInt(room.JEONSE/10000) + '억' + (room.JEONSE%10000==0?'':room.JEONSE%10000);
								}
								str+=room.JEONSE;
							}
							str	+= "</span>"
							+ "</p>"
							+ "<p class='jBkVAv'>";
						if(room.ROOM_FLOOR=='-1'){
							str	+=	"옥탑방, ";
						}else if(room.ROOM_FLOOR='0'){
							str +=	"반지하, ";
						}else{
							str	+=	room.ROOM_FLOOR +"층, ";
						}
							str	+=	room.REAL_SIZE + "㎡";
							if(room.UTILITY_PRICE!=null){
								str+=
								", 관리비" + room.UTILITY_PRICE + "만";
							}
							
						str	+= "</p>"
							+"<p class='jBkVAv'>" + room.DESC_TITLE + "</p>"
						+ "</a></div></li>" 
				
	            geocoder.addressSearch(room.ADDRESS1, function(result, status) { // 주소로 좌표를 검색합니다
	               // 정상적으로 검색이 완료됐으면 
	            if (status === kakao.maps.services.Status.OK) {
	            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	                // 결과값으로 받은 위치를 마커로 표시합니다
	            var marker = new kakao.maps.Marker({
	                  map: map,
	                  position: coords
	                });
	                map.setCenter(coords);
	              } 
	            });
        	}); 
        	body.append(str); 
		} 
}
</script>
<script type="text/javascript">
//슬라이드
$(function(){
	var sliders = document.getElementsByClassName('noUi-target');
	for(var i=0; i<sliders.length; i++){
		noUiSlider.create(sliders[i], {
			start: [0,100],
			step: 2,
	        connect: true,
	        margin: 2,
	        range: { 'min': 0, 'max': 100 }
		});
	}
	//보증금/전세가
	sliders[0].noUiSlider.on('update', function( values, handle ) {
		var input0 = $("#MONTHLY_DEPOSIT_MIN");
		var input1 = $("#MONTHLY_DEPOSIT_MAX");
		var input_value = [];
		if(values[0]<=10){
			input_value[0] = values[0]*50;
		}else if(values[0]<=48){
			input_value[0] = values[0]*250-2000;
		}else if(values[0]<=68){
			input_value[0] = values[0]*500-14000;
		}else if(values[0]==100){
			input_value[0] = '무제한';
		}
		else{
			input_value[0] = values[0]*2500-150000;
		}
		if(values[1]<=10){
			input_value[1] = values[1]*50;
		}else if(values[1]<=48){
			input_value[1] = values[1]*250-2000;
		}else if(values[1]<=68){
			input_value[1] = values[1]*500-14000;
		}else if(values[1]==100){
			input_value[1] = '무제한';
		}
		else{
			input_value[1] = values[1]*2500-150000;
		}
		input0.val(input_value[0]);
		input1.val(input_value[1]);
	    $('#p1').text('');
    	var str = '';
    	if(input_value[0]=='0'){
    		str += '0원';
    	}else if(input_value[0]>=10000){
    		str += parseInt(input_value[0]/10000) + '억' + (input_value[0]%10000==0?' 원':(input_value[0]%10000 + '만 원'));
    	}else{
    		str += input_value[0] + '만 원';
    	}
    	str += ' ~ '
   		if(input_value[1]=='무제한'){
   			str += '무제한';
   		}else if(input_value[1]>=10000){
    		str += parseInt(input_value[1]/10000) + '억' + (input_value[1]%10000==0?' 원':(input_value[1]%10000 + '만 원'));
    	}else{
    		str += input_value[1] + '만 원';
    	}
	    $('#p1').text(str);
	    $("#search").trigger('click');
	});
	//월세
	sliders[1].noUiSlider.on('update', function( values, handle ) {
		var input0 = $("#MONTHLY_PAYMENT_MIN");
		var input1 = $("#MONTHLY_PAYMENT_MAX");
		var input_value = [];
		if(values[0]<=40){
			input_value[0] = values[0]*2.5;
		}else if(values[0]<=60){
			input_value[0] = values[0]*5-100;
		}else if(values[0]==100){
			input_value[0] = '무제한';
		}
		else{
			input_value[0] = values[0]*25-1300;
		}
		if(values[1]<=40){
			input_value[1] = values[1]*2.5;
		}else if(values[1]<=60){
			input_value[1] = values[1]*5-100;
		}else if(values[1]==100){
			input_value[1] = '무제한';
		}
		else{
			input_value[1] = values[1]*25-1300;
		}
		input0.val(input_value[0]);
		input1.val(input_value[1]);
	    $('#p2').text('');
    	var str = '';
    	if(input_value[0]=='0'){
    		str += '0원';
    	}else{
    		str += input_value[0] + '만 원';
    	}
    	str += ' ~ '
   		if(input_value[1]=='무제한'){
   			str += '무제한';
    	}else{
    		str += input_value[1] + '만 원';
    	}
	    $('#p2').text(str);
	    $("#search").trigger('click');
	});
	//관리비
	sliders[2].noUiSlider.on('update', function( values, handle ) {
		var input0 = $("#UTILITY_PRICE_MIN");
		var input1 = $("#UTILITY_PRICE_MAX");
		var input_value = [];
		input_value[0] = values[0]/2;
		if(values[1]==100){
			input_value[1] = '무제한';
		}else{
			input_value[1] = values[1]/2;
		}
		input0.val(input_value[0]);
		input1.val(input_value[1]);
	    $('#p3').text('');
    	var str = '';
    	if(input_value[0]=='0'){
    		str += '0원';
    	}else{
    		str += input_value[0] + '만 원';
    	}
    	str += ' ~ '
   		if(input_value[1]=='무제한'){
   			str += '무제한';
    	}else{
    		str += input_value[1] + '만 원';
    	}
	    $('#p3').text(str);
	    $("#search").trigger('click');
	});
	//방크기
	sliders[3].noUiSlider.on('update', function( values, handle ) {
		var input0 = $("#REAL_SIZE_MIN");
		var input1 = $("#REAL_SIZE_MAX");
		var input_value = [];
		input_value[0] = values[0]*3/2+15;
		if(values[1]==100){
			input_value[1] = '무제한';
		}else{
			input_value[1] = values[1]*3/2+15;
		}
		input0.val(input_value[0]);
		input1.val(input_value[1]);
	    $('#p4').text('');
    	var str = '';
    	str += input_value[0] + '㎡ (' + (input_value[0]/3.3).toFixed(0) + '평)';
    	str += ' ~ '
   		if(input_value[1]=='무제한'){
   			str += '무제한';
    	}else{
    		str += input_value[1] + '㎡ (' + (input_value[1]/3.3).toFixed(0) + '평)';
    	}
	    $('#p4').text(str);
	    $("#search").trigger('click');
	});
});

function fn_addFav(obj){
	if(idChk == 'null'){
		alert('로그인하셔야 이용할 수 있는 기능입니다.');
	}
	else{
	var str = window.location.href;
	var url = "redirect:"+str.split("<%=request.getContextPath()%>")[1];
	var num = obj.children('#num').text();
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/search/addFavRoom'/>");
	comSubmit.addParam("check", 0);
	comSubmit.addParam("ROOM_NUM", num);
	comSubmit.addParam("MEM_ID", idChk);
	comSubmit.addParam("url", url);
	comSubmit.submit();
	}
}
function fn_deleteFav(obj){
	var str = window.location.href;
	var url = "redirect:"+str.split("<%=request.getContextPath()%>")[1];
	var num = obj.children('#num').text();
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/search/addFavRoom'/>");
	comSubmit.addParam("check", 1);
	comSubmit.addParam("ROOM_NUM", num);
	comSubmit.addParam("MEM_ID", idChk);
	comSubmit.addParam("url", url);
	comSubmit.submit();
}
</script>
<button type="button" onclick="fn_search();" id="search"></button>
</body>
</html>