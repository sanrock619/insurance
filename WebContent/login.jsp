<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

#form-group {
	padding-top: 54px;
	padding-left: 20%;
	padding-right: 20%;
}

.form {
	padding-left: 5%;
	padding-right: 5%;
	text-align: left;
}

.window {
	margin: auto;
}

.form-header {
	color: white;
	background-color: #6495ED;
}
</style>

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">網路投保專區-登入會員</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link"
						href="index.jsp"> <span class="oi oi-home" aria-hidden="true"></span>首頁
					</a></li>
					<li class="nav-item"><a class="nav-link" href="calculate.jsp">
							<span class="oi oi-calculator" aria-hidden="true"></span>試算保費
					</a></li>
					<li class="nav-item"><a class="nav-link" href="member.jsp">
							<span class="oi oi-file" aria-hidden="true"></span>保戶園地
					</a></li>
					<li class="nav-item"><a class="nav-link" href="register.jsp">
							<span class="oi oi-tag" aria-hidden="true"></span>註冊會員
					</a></li>
					<li class="nav-item"><a class="nav-link" href="login.jsp">
							<span class="oi oi-account-login" aria-hidden="true"></span>登入會員
					</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<c:choose>
		<c:when test="${member.id==null }">

			<!-- Page Content -->
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="container" style="margin-top: 5%">
							<div class="row">
								<div class="col-sm-8 window">
									<div class="card text-center">
										<div class="card-header form-header">登入會員</div>
										<div class="card-block">
											<div class="form">
												<form action="MemberServlet" method="post">
													<input type="hidden" name="request_type" value="verify">
													<div class="form-group" id="form-group">
														<label for="exampleInputEmail1">帳號</label> <input
															type="text" class="form-control" id="exampleInputEmail1"
															name="id" aria-describedby="emailHelp"
															placeholder="請輸入帳號"> <label
															for="exampleInputPassword1">密碼</label> <input
															type="password" class="form-control"
															id="exampleInputPassword1" name="passwd"
															placeholder="請輸入密碼">
													</div>
													<div class="text-center">
														<button type="submit" class="btn btn-success">確定送出</button>
														&nbsp;&nbsp; <a class="btn btn-warning" href="forget.jsp"
															role="button">忘記密碼</a>
													</div>
												</form>
											</div>
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
								<li><a class="text-muted yyy" href="#"><span
										class="oi oi-bullhorn" aria-hidden="true"></span>法令公告</a></li>
								<li><a class="text-muted" href="#"><span
										class="oi oi-document" aria-hidden="true"></span>隱私權聲明</a></li>
								<li><a class="text-muted" href="#"><span
										class="oi oi-eye" aria-hidden="true"></span>資訊公開</a></li>
								<li><a class="text-muted" href="#"><span
										class="oi oi-lock-locked" aria-hidden="true"></span>電子商務自律規範</a></li>
							</ul>
						</div>
						<div class="col-6 col-md">
							<ul class="list-unstyled text-small">
								<li><a class="text-muted" href="#"><span
										class="oi oi-question-mark" aria-hidden="true"></span>常見問題</a></li>
								<li><a class="text-muted" href="#"><span
										class="oi oi-location" aria-hidden="true"></span>服務據點</a></li>
								<li><a class="text-muted" href="#"><span
										class="oi oi-phone" aria-hidden="true"></span>網路投保服務專線
										0800-000-000</a></li>
								<li><a class="text-muted" href="#"><span
										class="oi oi-map-marker" aria-hidden="true"></span>台北市大安區敦化南路十段000號1樓</a></li>
							</ul>
						</div>
					</div>
				</footer>
			</div>

		</c:when>
		<c:otherwise>
			<c:redirect url="member.jsp" />
		</c:otherwise>
	</c:choose>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>