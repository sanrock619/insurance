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
<!-- Alertify CSS -->
<link rel="stylesheet" href="alertify/alertify.min.css" />
<!-- Alertify Default theme -->
<link rel="stylesheet" href="alertify/default.min.css" />
<!-- Alertify Semantic UI theme -->
<link rel="stylesheet" href="alertify/semantic.min.css" />
<!-- Alertify Bootstrap theme -->
<link rel="stylesheet" href="alertify/bootstrap.min.css" />

<!-- Custom styles for this project -->
<link href="vendor/bootstrap/css/ins.css" rel="stylesheet">

</head>

<body onload="calculateLife(),setGenderMale(),setYears10()">

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
					<li class="nav-item active"><a class="nav-link"
						href="calculate.jsp"> <span class="oi oi-calculator"
							aria-hidden="true"></span>試算保費
					</a></li>
					<li class="nav-item"><a class="nav-link" href="apply.jsp">
					<span class="oi oi-cart" aria-hidden="true"></span>保險商品</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="member.jsp">
							<span class="oi oi-person" aria-hidden="true"></span>保戶園地
					</a></li>
					<li class="nav-item"><a class="nav-link" href="register.jsp">
							<span class="oi oi-tag" aria-hidden="true"></span>註冊會員
					</a></li>
					<c:choose>
						<c:when test="${member.id==null }">
							<li class="nav-item"><a class="nav-link" href="login.jsp">
									<span class="oi oi-account-login" aria-hidden="true"></span>登入會員
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link" href="logout.jsp">
									<span class="oi oi-account-logout" aria-hidden="true"></span>登出會員
							</a></li>
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
								<div class="card-header product-header">定期壽險-保費試算</div>
								<div class="card-block">
									<div class="form">
										<div class="form-group row">
											<label class="col-sm-3 col-form-label"> <span
												class="oi oi-person" aria-hidden="true"></span>性別
											</label>
											<div class="col-sm-2 form-check form-check-inline"
												style="padding-left: 2%">
												<input class="form-check-input" type="radio" name="gender"
													id="male" value="male" checked onchange="setGenderMale()">
												<label class="form-check-label" for="male">男</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="gender"
													id="female" value="female" onchange="setGenderFemale()">
												<label class="form-check-label" for="female">女</label>
											</div>
											<input type="hidden" id="gender">
										</div>

										<div class="form-group row">
											<label class="col-sm-3 col-form-label"> <span
												class="oi oi-calendar" aria-hidden="true"></span>繳費年期
											</label>
											<div class="col-sm-2 form-check form-check-inline"
												style="padding-left: 2%">
												<input class="form-check-input" type="radio" name="years"
													id="y10" value="10" checked onchange="setYears10()">
												<label class="form-check-label" for="y10">10年期</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="years"
													id="y20" value="20" onchange="setYears20()"> <label
													class="form-check-label" for="y20">20年期</label>
											</div>
											<input type="hidden" id="years">
										</div>

										<div class="form-group row">
											<label class="col-sm-3 col-form-label"> <span
												class="oi oi-calendar" aria-hidden="true"></span>生日
											</label>
											<div class="form-group col-md-3">
												<select class="form-control" id="birthY" name="birthY"
													onchange="calculateLife()">
													<option value='1967'>1967</option>
													<option value='1968'>1968</option>
													<option value='1969'>1969</option>
													<option value='1970'>1970</option>
													<option value='1971'>1971</option>
													<option value='1972'>1972</option>
													<option value='1973'>1973</option>
													<option value='1974'>1974</option>
													<option value='1975'>1975</option>
													<option value='1976'>1976</option>
													<option value='1977'>1977</option>
													<option value='1978'>1978</option>
													<option value='1979'>1979</option>
													<option value='1980'>1980</option>
													<option value='1981'>1981</option>
													<option value='1982'>1982</option>
													<option value='1983'>1983</option>
													<option value='1984'>1984</option>
													<option value='1985'>1985</option>
													<option value='1986'>1986</option>
													<option value='1987'>1987</option>
													<option value='1988' SELECTED>1988</option>
													<option value='1989'>1989</option>
													<option value='1990'>1990</option>
													<option value='1991'>1991</option>
													<option value='1992'>1992</option>
													<option value='1993'>1993</option>
													<option value='1994'>1994</option>
													<option value='1995'>1995</option>
													<option value='1996'>1996</option>
													<option value='1997'>1997</option>
													<option value='1998'>1998</option>
												</select>
											</div>

											<div class="form-group col-md-2">
												<select class="form-control" id="birthM" name="birthM"
													onchange="calculateLife()">
													<option value='01'>01</option>
													<option value='02'>02</option>
													<option value='03'>03</option>
													<option value='04'>04</option>
													<option value='05'>05</option>
													<option value='06'>06</option>
													<option value='07'>07</option>
													<option value='08'>08</option>
													<option value='09'>09</option>
													<option value='10'>10</option>
													<option value='11'>11</option>
													<option value='12'>12</option>
												</select>
											</div>

											<div class="form-group col-md-2">
												<select class="form-control" id="birthD" name="birthD"
													onchange="calculateLife()">
													<option value='01'>01</option>
													<option value='02'>02</option>
													<option value='03'>03</option>
													<option value='04'>04</option>
													<option value='05'>05</option>
													<option value='06'>06</option>
													<option value='07'>07</option>
													<option value='08'>08</option>
													<option value='09'>09</option>
													<option value='10'>10</option>
													<option value='11'>11</option>
													<option value='12'>12</option>
													<option value='13'>13</option>
													<option value='14'>14</option>
													<option value='15'>15</option>
													<option value='16'>16</option>
													<option value='17'>17</option>
													<option value='18'>18</option>
													<option value='19'>19</option>
													<option value='20'>20</option>
													<option value='21'>21</option>
													<option value='22'>22</option>
													<option value='23'>23</option>
													<option value='24'>24</option>
													<option value='25'>25</option>
													<option value='26'>26</option>
													<option value='27'>27</option>
													<option value='28'>28</option>
													<option value='29'>29</option>
													<option value='30'>30</option>
													<option value='31'>31</option>
												</select>
											</div>

										</div>

										<div class="form-group row">
											<label for="insAmount" class="col-sm-3 col-form-label">
												<span class="oi oi-dollar" aria-hidden="true"></span>保險金額
											</label>
											<div class="form-group col-md-4">
												<select class="form-control" id="insAmount" name="insAmount"
													onchange="calculateLife()">
													<option value=5 selected>50萬</option>
													<option value=10>100萬</option>
													<option value=15>150萬</option>
													<option value=20>200萬</option>
													<option value=25>250萬</option>
													<option value=30>300萬</option>
													<option value=35>350萬</option>
													<option value=40>400萬</option>
													<option value=45>450萬</option>
													<option value=50>500萬</option>
													<option value=55>550萬</option>
													<option value=60>600萬</option>
												</select>
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm text-center">
												<button class="btn btn-info" id="cal"
													onclick="calculateLife()">
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
								<a href="applyLife.jsp" class="btn btn-success"> <span
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
<!-- 計算定期壽險保費專用js -->
<script src="vendor/js/calculateLife.js"></script>
<!-- Alertify JavaScript -->
<script src="alertify/alertify.min.js"></script>

<script>
	$(document).ready(function() {
		$("#male").click(function() {
			calculateLife();
		});

		$("#female").click(function() {
			calculateLife();
		});
	});
</script>

</html>