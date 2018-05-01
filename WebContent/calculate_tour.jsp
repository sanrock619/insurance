<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" http-equiv="Content-Type"
	content="text/html; charset=UTF-8; width=device-width; initial-scale=1">

<title>線上投保</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- 使用bootsrtap datepicker套件所需css -->
<link href="datepicker/css/bootstrap-datepicker.standalone.min.css"
	rel="stylesheet">
<link href="datepicker/css/bootstrap-datepicker3.min.css"
	rel="stylesheet">
<link href="datepicker/css/bootstrap-datepicker3.standalone.min.css"
	rel="stylesheet">
<!-- open-iconic css -->
<link href="open-iconic/font/css/open-iconic-bootstrap.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<style>
body {
	padding-top: 54px;
}

@media ( min-width : 992px) {
	body {
		padding-top: 56px;
	}
}

.form {
	padding-top: 5%;
	padding-left: 5%;
	padding-right: 5%;
	text-align: left;
}

.window {
	margin: auto;
}

.product-header{
	color:white;
	background-color: #4682B4;
}
</style>

</head>

<body onload="selectTime(),setDefaultDate(),setBackTime(),sendInfo()">

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">網路投保專區-試算保費</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="index.jsp">
					<span class="oi oi-home" aria-hidden="true"></span>首頁
					</a></li>
					<li class="nav-item active"><a class="nav-link" href="calculate.jsp">
					<span class="oi oi-calculator" aria-hidden="true"></span>試算保費</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="member.jsp">
					<span class="oi oi-file" aria-hidden="true"></span>保戶園地</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="register.jsp">
					<span class="oi oi-tag" aria-hidden="true"></span>註冊會員</a>
					</li>
					<c:choose>
						<c:when test="${member.id==null }">
							<li class="nav-item"><a class="nav-link" href="login.jsp">
					<span class="oi oi-account-login" aria-hidden="true"></span>登入會員</a>
					</li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link" href="logout.jsp">
					<span class="oi oi-account-logout" aria-hidden="true"></span>登出會員</a>
					</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">

				<div class="container" style="margin-top: 5%">
					<div class="row">
						<div class="col-sm-8 window">
							<div class="card text-center">
								<div class="card-header product-header">旅遊平安險-保費試算</div>
								<div class="card-block">
									<div class="form">
										<div class="form-group row">
											<label for="location" class="col-sm-3 col-form-label">
												<span class="oi oi-globe" aria-hidden="true"></span>旅遊地點
											</label>
											<div class="form-group col-md-5">
												<select id="location" class="form-control">
													<option value="">日本</option>
													<option value="">中國大陸</option>
													<option value="">香港澳門</option>
													<option value="">韓國</option>
													<option value="">東南亞</option>
													<option value="">美加</option>
													<option value="">歐洲</option>
													<option value="">紐澳</option>
													<option value="">其他</option>
												</select>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-3 col-form-label"> <span
												class="oi oi-calendar" aria-hidden="true"></span>保障開始日
											</label>
											<div class="form-group col-md-3" id="datepicker">
												<input type="text" class="form-control" id="start_date"
													name="start_date" placeholder="請選擇日期" required
													onchange="resetEndDate()"> <span
													class="input-group-addon"> <span
													class="fa fa-calendar fa-fw"></span>
												</span>
											</div>
											<label for="goTime" class="col-sm-2 col-form-label">
												<span class="oi oi-clock" aria-hidden="true"></span>出發
											</label>
											<div class="form-group col-md-3">
												<select class="form-control" id="goTime"
													onchange="setBackTime()">
													<option id="h1" value="00:00">00:00</option>
													<option id="h2" value="01:00">01:00</option>
													<option id="h3" value="02:00">02:00</option>
													<option id="h4" value="03:00">03:00</option>
													<option id="h5" value="04:00">04:00</option>
													<option id="h6" value="05:00">05:00</option>
													<option id="h7" value="06:00">06:00</option>
													<option id="h8" value="07:00">07:00</option>
													<option id="h9" value="08:00">08:00</option>
													<option id="h10" value="09:00">09:00</option>
													<option id="h11" value="10:00">10:00</option>
													<option id="h12" value="11:00">11:00</option>
													<option id="h13" value="12:00">12:00</option>
													<option id="h14" value="13:00">13:00</option>
													<option id="h15" value="14:00">14:00</option>
													<option id="h16" value="15:00">15:00</option>
													<option id="h17" value="16:00">16:00</option>
													<option id="h18" value="17:00">17:00</option>
													<option id="h19" value="18:00">18:00</option>
													<option id="h20" value="19:00">19:00</option>
													<option id="h21" value="20:00">20:00</option>
													<option id="h22" value="21:00">21:00</option>
													<option id="h23" value="22:00">22:00</option>
													<option id="h24" value="23:00">23:00</option>
												</select>
											</div>
											<label class="col-sm-3 col-form-label"> <span
												class="oi oi-calendar" aria-hidden="true"></span>保障結束日
											</label>
											<div class="form-group col-md-3" id="datepicker">
												<input type="text" class="form-control" id="end_date"
													name="end_date" placeholder="請選擇日期" required
													onchange="checkEndDate()"> <span
													class="input-group-addon"> <span
													class="fa fa-calendar fa-fw"></span>
												</span>
											</div>

											<!-- 結束日期Modal -->
											<div class="modal fade" id="alertModal" tabindex="-1"
												role="dialog" aria-labelledby="exampleModalCenterTitle"
												aria-hidden="true">
												<div class="modal-dialog modal-dialog-centered"
													role="document">
													<div class="modal-content">
														<div class="modal-header"
															style="background-color: #0066FF; color: white;">
															<h5 class="modal-title">系統訊息</h5>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">保險期間開始日不得晚於保險期間結束日</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">關閉</button>
														</div>
													</div>
												</div>
											</div>

											<label for="backTime" class="col-sm-2 col-form-label">
												<span class="oi oi-clock" aria-hidden="true"></span>結束
											</label>
											<div class="form-group col-md-3">
												<select class="form-control" disabled>
													<option id="backTime"></option>
												</select>
											</div>
										</div>

										<div class="form-group row">
											<label for="insAmount" class="col-sm-3 col-form-label">
												<span class="oi oi-dollar" aria-hidden="true"></span>保險金額
											</label>
											<div class="form-group col-md-4">
												<select class="form-control" id="insAmount" name="insAmount"
													onchange="sendInfo()">
													<option value=100 selected>100萬</option>
													<option value=200>200萬</option>
													<option value=300>300萬</option>
													<option value=400>400萬</option>
													<option value=500>500萬</option>
													<option value=600>600萬</option>
													<option value=700>700萬</option>
													<option value=800>800萬</option>
													<option value=900>900萬</option>
													<option value=1000>1000萬</option>
												</select>
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm text-center">
												<button class="btn btn-info" id="cal" onclick="sendInfo()">
													<span class="oi oi-calculator" aria-hidden="true"></span>試算保費
												</button>
											</div>
										</div>
										<div class="text-right" style="font-weight: bold">
											保險費：<span id="result" style="color: red"></span>元
										</div>
									</div>
								</div>

							</div>
							<div class="col-sm text-center" style="margin-top: 5%">
								<a href="applyTour.jsp" class="btn btn-success"> <span
									class="oi oi-pencil" aria-hidden="true"></span>我要投保
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer class="pt-4 my-md-5 pt-md-5 border-top container-fluid">
			<div class="row">
				<div class="col-12 col-md">
					<span class="oi oi-cloud" aria-hidden="true"></span> <small
						class="d-block mb-3 text-muted">&copy; 雲端保險股份有限公司</small>
				</div>
				<div class="col-6 col-md">
					<ul class="list-unstyled text-small">
						<li><a class="text-muted yyy" href="#"><span class="oi oi-bullhorn" aria-hidden="true"></span>法令公告</a></li>
						<li><a class="text-muted" href="#"><span class="oi oi-document" aria-hidden="true"></span>隱私權聲明</a></li>
						<li><a class="text-muted" href="#"><span class="oi oi-eye" aria-hidden="true"></span>資訊公開</a></li>
						<li><a class="text-muted" href="#"><span class="oi oi-lock-locked" aria-hidden="true"></span>電子商務自律規範</a></li>
					</ul>
				</div>
				<div class="col-6 col-md">
					<ul class="list-unstyled text-small">
						<li><a class="text-muted" href="#"><span class="oi oi-question-mark" aria-hidden="true"></span>常見問題</a></li>
						<li><a class="text-muted" href="#"><span class="oi oi-location" aria-hidden="true"></span>服務據點</a></li>
						<li><a class="text-muted" href="#"><span class="oi oi-phone" aria-hidden="true"></span>網路投保服務專線 0800-000-000</a></li>
						<li><a class="text-muted" href="#"><span class="oi oi-map-marker" aria-hidden="true"></span>台北市大安區敦化南路十段000號1樓</a></li>
					</ul>
				</div>
			</div>
		</footer>
	</div>
</body>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- 使用bootsrtap datepicker套件所需js -->
<script src="datepicker/js/bootstrap-datepicker.js"></script>
<!-- bootsrtap datepicker套件正體中文js -->
<script src="datepicker/locales/bootstrap-datepicker.zh-TW.min.js"></script>
<!-- bootsrtap datepicker設定 -->
<script src="datepicker/js/datepicker_custom.js"></script>
<!-- 選擇時間js -->
<script src="vendor/js/selectTime.js"></script>
<!-- 計算旅平險保費專用js -->
<script src="vendor/js/calculateTour.js"></script>

</html>