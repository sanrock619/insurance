<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="beans.Member"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<a class="navbar-brand" href="index.jsp">網路投保專區-修改密碼</a>
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
					<li class="nav-item active"><a class="nav-link"
						href="member.jsp"> <span class="oi oi-person" aria-hidden="true"></span>保戶園地
					</a></li>
					<li class="nav-item"><a class="nav-link" href="logout.jsp">
							<span class="oi oi-account-logout" aria-hidden="true"></span>登出會員
					</a></li>
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
					<div class="col-lg-6" style="margin: auto;">
						<h5 class="mt-5 text-center">請輸入以下資料，系統將發送新的密碼</h5>
						<div class="card">
							<div class="card-header form-header text-center">密碼驗證</div>
							<form action="MemberServlet" method="post" class="form">
								<input type="hidden" name="request_type" value="change">
								<div class="form-group" id="form-group">
									<label for="exampleInputPassword1">原密碼</label> <input
										type="password" class="form-control" name="oldPasswd"
										placeholder="請輸入原本的密碼" required> <label
										for="exampleInputPassword1">新密碼</label> <input type="password"
										class="form-control" id="passwd" name="passwd"
										placeholder="請輸入新密碼" required> <label
										for="exampleInputPassword1">密碼確認</label> <input
										type="password" class="form-control" id="passwdConfirm"
										name="passwdConfirm" placeholder="請再次輸入新密碼" required
										onmouseout="return Validate()"> <span
										id="checkPassResult"> </span>
								</div>
								<button type="submit" class="btn btn-success">確定修改</button>
							</form>
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
		</c:otherwise>
	</c:choose>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- 檢查兩次輸入密碼是否正確 -->
	<script src="vendor/js/checkID.js"></script>

</body>

</html>