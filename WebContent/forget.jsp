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
	padding-left: 20%;
	padding-right: 20%;
}

#submit {
	padding-left: 20%;
	text-align: left;
}
</style>

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">網路投保專區-找回密碼</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link"
						href="index.jsp">首頁 <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">商品查詢</a></li>
					<li class="nav-item"><a class="nav-link" href="calculate.jsp">試算保費</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="member.jsp">保戶園地</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="register.jsp">註冊會員</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="login.jsp">登入會員</a>
					</li>
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
						<h5 class="mt-5">請輸入會員帳號及註冊時所留之Email</h5>
						<p class="lead">系統將發送新的密碼至您的Email</p>
						<form action="MemberServlet" method="post">
							<input type="hidden" name="request_type" value="forget">
							<div class="form-group" id="form-group">
								<label>帳號</label> <input type="text" class="form-control"
									name="id" placeholder="請輸入帳號" required> <label
									for="exampleInputPassword1">Email</label> <input type="email"
									class="form-control" name="email" placeholder="請輸入Email"
									required>
							</div>
							<div id="submit">
								<button type="submit" class="btn btn-primary">確定送出</button>
							</div>
						</form>
					</div>
				</div>
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