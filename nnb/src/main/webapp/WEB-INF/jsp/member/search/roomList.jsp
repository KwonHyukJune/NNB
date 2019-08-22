<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/search.css'/>"/>
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
		<input class="keOJyH" type="text" name="region" class="search" id="region" placeholder="잠실동 아파트">
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
					<h1 class="lmqlXb">보증금/전세가<p class="eavwzc">무제한</p></h1>
					<div class="jqwYlT">
						<input type="hidden" name="MONTHLY_DEPOSIT_MIN" id="MONTHLY_DEPOSIT_MIN">
						<input type="hidden" name="MONTHLY_DEPOSIT_MAX" id="MONTHLY_DEPOSIT_MAX">
						<input type="hidden" name="JEONSE_MIN" id="JEONSE_MIN">
						<input type="hidden" name="JEONSE_MAX" id="JEONSE_MAX">
						<div class="noUi-target noUi-ltr noUi-horizontal">
							<div class="noUi-base">
								<div class="noUi-connects">
									<div class="noUi-connect noUi-draggable" style="transform: translate(0%, 0px) scale(1, 1);"></div>
								</div>
								<div class="noUi-origin" style="transform: translate(-100%, 0px) z-index:5;">
									<div class="noUi-handle noUi-handle-lower" data-handle="0" tabindex="0" role="slider" aria-orientation="horizontal" aria-valuemin="0.0" aria-valuemax="100.0" aria-valuenow="0.0" aria-valuetext="0.00"></div>
								</div>
								<div class="noUi-origin" style="transform: translate(0%, 0px); z-index: 4;">
									<div class="noUi-handle noUi-handle-upper" data-handle="1" tabindex="0" role="slider" aria-orientation="horizontal" aria-valuemin="0.0" aria-valuemax="100.0" aria-valuenow="100.0" aria-valuetext="999999.00"></div>
								</div>
							</div>
						</div>
					</div>
					<ul class="ghXquW">
						<li>0</li>
						<li>1억 2000만 원</li>
						<li>무제한</li>
					</ul>
				</div>
				<div class="fBFAQm">
					<h1 class="lmqlXb">월세<p class="eavwzc">무제한</p></h1>
					<div class="jqwYlT">
						<input type="hidden" name="MONTHLY_PAYMENT_MIN" id="MONTHLY_PAYMENT_MIN">
						<input type="hidden" name="MONTHLY_PAYMENT_MAX" id="MONTHLY_PAYMENT_MAX">
						<div class="noUi-target noUi-ltr noUi-horizontal">
							<div class="noUi-base">
								<div class="noUi-connects">
									<div class="noUi-connect noUi-draggable" style="transform: translate(0%, 0px) scale(1, 1);"></div>
								</div>
								<div class="noUi-origin" style="transform: translate(-100%, 0px) z-index:5;">
									<div class="noUi-handle noUi-handle-lower" data-handle="0" tabindex="0" role="slider" aria-orientation="horizontal" aria-valuemin="0.0" aria-valuemax="100.0" aria-valuenow="0.0" aria-valuetext="0.00"></div>
								</div>
								<div class="noUi-origin" style="transform: translate(0%, 0px); z-index: 4;">
									<div class="noUi-handle noUi-handle-upper" data-handle="1" tabindex="0" role="slider" aria-orientation="horizontal" aria-valuemin="0.0" aria-valuemax="100.0" aria-valuenow="100.0" aria-valuetext="999999.00"></div>
								</div>
							</div>
						</div>
					</div>
					<ul class="ghXquW">
						<li>0</li>
						<li>60만 원</li>
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
					<h1 class="lmqlXb">관리비<p class="eavwzc">무제한</p></h1>
					<div class="jqwYlT">
						<input type="hidden" name="UTILITY_PRICE_MIN" id="UTILITY_PRICE_MIN">
						<input type="hidden" name="UTILITY_PRICE_MAX" id="UTILITY_PRICE_MAX">
						<div class="noUi-target noUi-ltr noUi-horizontal">
							<div class="noUi-base">
								<div class="noUi-connects">
									<div class="noUi-connect noUi-draggable" style="transform: translate(0%, 0px) scale(1, 1);"></div>
								</div>
								<div class="noUi-origin" style="transform: translate(-100%, 0px) z-index:5;">
									<div class="noUi-handle noUi-handle-lower" data-handle="0" tabindex="0" role="slider" aria-orientation="horizontal" aria-valuemin="0.0" aria-valuemax="100.0" aria-valuenow="0.0" aria-valuetext="0.00"></div>
								</div>
								<div class="noUi-origin" style="transform: translate(0%, 0px); z-index: 4;">
									<div class="noUi-handle noUi-handle-upper" data-handle="1" tabindex="0" role="slider" aria-orientation="horizontal" aria-valuemin="0.0" aria-valuemax="100.0" aria-valuenow="100.0" aria-valuetext="999999.00"></div>
								</div>
							</div>
						</div>
					</div>
					<ul class="ghXquW">
						<li>0</li>
						<li>20만 원</li>
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
					<h1 class="lmqlXb">방크기<p class="eavwzc">무제한</p></h1>
					<input type="hidden" name="REAL_SIZE_MIN" id="REAL_SIZE_MIN">
					<input type="hidden" name="REAL_SIZE_MAX" id="REAL_SIZE_MAX">
					<div class="jqwYlT">
						<div class="noUi-target noUi-ltr noUi-horizontal">
							<div class="noUi-base">
								<div class="noUi-connects">
									<div class="noUi-connect noUi-draggable" style="transform: translate(0%, 0px) scale(1, 1);"></div>
								</div>
								<div class="noUi-origin" style="transform: translate(-100%, 0px) z-index:5;">
									<div class="noUi-handle noUi-handle-lower" data-handle="0" tabindex="0" role="slider" aria-orientation="horizontal" aria-valuemin="0.0" aria-valuemax="100.0" aria-valuenow="0.0" aria-valuetext="0.00"></div>
								</div>
								<div class="noUi-origin" style="transform: translate(0%, 0px); z-index: 4;">
									<div class="noUi-handle noUi-handle-upper" data-handle="1" tabindex="0" role="slider" aria-orientation="horizontal" aria-valuemin="0.0" aria-valuemax="100.0" aria-valuenow="100.0" aria-valuetext="999999.00"></div>
								</div>
							</div>
						</div>
					</div>
					<ul class="ghXquW">
						<li>0m²(0평)</li>
						<li>33m²(10평)</li>
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
									<p class="styled__Desc-gzb3pm-4 diBSwb">풀옵션 항목은 세탁기, 냉장고, 에어컨, 가스레인지입니다.</p>
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
				<div class="dzQBoq" id="PAGE_NAVI">    </div>
				<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
			</div>
			<!-- 페이징 영역 -->
			
		</div>
		<button class="cHCsIX">
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
	<c:forEach var="address" items="${list}">
		<script>
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
             center: new kakao.maps.LatLng(37.502541, 127.024711), // 지도의 중심좌표
             level: 3 // 지도의 확대 레벨
            };
            var map = new kakao.maps.Map(mapContainer, mapOption); //지도를 미리 생성
            var geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표 변환 객체를 생성합니다
            
            geocoder.addressSearch('${address.ADDRESS1}', function(result, status) { // 주소로 좌표를 검색합니다
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
         </script>
	</c:forEach>
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

$("input").on("change",function(){
	fn_search();
});
function fn_addParam(ajax,param){
	var key = param.attr("name");
	var value = [];
	$('input[name='+key+']').each(function(){
		if(this.checked){
			value.push(this.value);
		}
	});
	ajax.addParam(key,value);
}
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
	
	fn_addParam(comAjax,ROOM_TYPE);
	fn_addParam(comAjax,TRADE_TYPE);
	fn_addParam(comAjax,ROOM_FLOOR);
	fn_addParam(comAjax,STRUCTURES);
	fn_addParam(comAjax,PARKING);
	fn_addParam(comAjax,PET);
	fn_addParam(comAjax,ELEVATOR);
	fn_addParam(comAjax,BALCONY);
	fn_addParam(comAjax,BUILT_IN);
	fn_addParam(comAjax,OPTIONS);
	fn_addParam(comAjax,LOAN_ACCESS);
	
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
			var count = data.count;
			$("#count").empty();
			$("#count").append(count);
			$.each(data.list, function(key, room){ 
				str +=  "<li class='room hxpbDF'>"
							+ "<div class='OUJOU'>"
						+ "<div class='fav'>"
							+ "<div class='insertFav'></div>"
						+ "</div>"
						+ "<a href='<c:url value='/room/roomDetail?ROOM_NUM="+ room.ROOM_NUM + "'/>' class='kpKjGs'>"
							+ "<div class='img jHIGoX'>"
								+"<img src='<c:url value='/roomImages/"+ room.THUMBNAIL +"'/>'>"
							+ "</div>"
							+ "<p class='kCTBqT jBkVAv'>" + room.ROOM_TYPE + "</p>"
							+ "<p class='glovZ jBkVAv'>"+"<span>"+ room.TRADE_TYPE;
							if(room.TRADE_TYPE=='월세'){
								str+= room.MONTHLY_DEPOSIT+"/"+room.MONTHLY_PAYMENT;
							}else if(room.TRADE_TYPE=='전세'){
								str+=room.JEONSE;
							}
							str	+= "</span>"
							+ "</p>"
							+ "<p class='jBkVAv'>"
								+ room.ROOM_FLOOR +"층, " + room.REAL_SIZE + "m2";
							if(room.UTILITY_PRICE!=null){
								str+=
								", 관리비" + room.UTILITY_PRICE + "만";
							}
							
						str	+= "</p>"
							+"<p class='jBkVAv'>" + room.DESC_TITLE + "</p>"
						+ "</a></div></li>"
					
						
				
        	}); 
        	body.append(str); 
		} 
}
     
</script>

</body>
</html>