<%@ page import="beans.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="member" class="beans.Member" scope="session" />
<jsp:setProperty name="member" property="*" />
<html>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>線上投保</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- open-iconic css -->
<link href="open-iconic/font/css/open-iconic-bootstrap.css"
	rel="stylesheet">

<!-- Custom styles for this project -->
<link href="vendor/bootstrap/css/ins.css" rel="stylesheet">

</head>

<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">網路投保專區-保戶專區</a>
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
					<li class="nav-item"><a class="nav-link" href="calculate.jsp">
					<span class="oi oi-calculator" aria-hidden="true"></span>試算保費</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="apply.jsp">
					<span class="oi oi-cart" aria-hidden="true"></span>保險商品</a>
					</li>
					<li class="nav-item active"><a class="nav-link" href="member.jsp">
					<span class="oi oi-person" aria-hidden="true"></span>保戶園地</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="logout.jsp">
					<span class="oi oi-account-logout" aria-hidden="true"></span>登出會員</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<c:choose>
			<c:when test="${member.id==null }">
				<c:redirect url="login.jsp" />
			</c:when>
			<c:otherwise>
	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div>
					<h5 class="mt-5">保戶&nbsp;${member.realname}&nbsp;您好</h5>
				</div>

				<div style="float: left; margin-left: 2%;">
					<span class="oi oi-person" aria-hidden="true"
						style="font-size: 15px;"></span><font style="font-weight: bold;">保戶專區</font>
				</div>
				<br> <br>

				<div class="container text-center">
					<div class="row">
						<div class="col-sm-4">
							<div class="card text-center">
								<div class="card-header panelHeader">我的保單</div>
								<div class="card-block product">
									<h5 class="card-title">查詢保單明細狀況</h5>
									<p class="card-text">提供線上查詢會員本人</p>
									<p class="card-text">目前有效保單的詳細資訊</p>
									<a href="myPolicy.jsp" class="btn btn-primary"> <span
										class="oi oi-magnifying-glass" aria-hidden="true"></span>查詢保單
									</a>
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="card text-center">
								<div class="card-header panelHeader">保險商品</div>
								<div class="card-block product">
									<h5 class="card-title">線上投保</h5>
									<p class="card-text">目前提供旅遊平安險、定期壽險</p>
									<p class="card-text">以及意外傷害險線上投保的服務</p>
									<a href="apply.jsp" class="btn btn-info"> <span
										class="oi oi-cart" aria-hidden="true"></span>我要投保
									</a>
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="card text-center">
								<div class="card-header panelHeader">個人資料</div>
								<div class="card-block product">
									<h5 class="card-title">修改會員資料</h5>
									<p class="card-text">提供會員相關資訊的變更</p>
									<p class="card-text">(聯絡方式及密碼)</p>
									<a href="edit.jsp" class="btn btn-warning"> <span
										class="oi oi-pencil" aria-hidden="true"></span>修改資料
									</a>
								</div>
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
	</c:otherwise>
	</c:choose>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>