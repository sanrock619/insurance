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
</style>
<script>
	function Validate() {
		var password = document.getElementById("passwd").value;
		var confirmPassword = document.getElementById("passwdConfirm").value;
		if (password != null && confirmPassword != null) {
			if (password != confirmPassword) {
				var alert = "密碼不一致，請重新確認";
				document.getElementById('ajax2').innerHTML = alert;
				return false;
			} else {
				document.getElementById('ajax2').innerHTML = "";
				return true;
			}
		}
	}
</script>
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
					<li class="nav-item active"><a class="nav-link"
						href="member.jsp"> <span class="oi oi-file" aria-hidden="true"></span>保戶園地
					</a></li>
					<li class="nav-item"><a class="nav-link" href="register.jsp">
							<span class="oi oi-tag" aria-hidden="true"></span>註冊會員
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
					<div class="col-lg-12 text-center">
						<form action="MemberServlet" method="post">
						<input type="hidden" name="request_type" value="change">
							<div class="form-group" id="form-group">
								<label for="exampleInputPassword1">請輸入原密碼</label> <input
									type="password" class="form-control" name="oldPasswd" required>
								<label for="exampleInputPassword1">請輸入新密碼</label> <input
									type="password" class="form-control" id="passwd" name="passwd"
									required> <label for="exampleInputPassword1">請再次輸入新密碼</label>
								<input type="password" class="form-control" id="passwdConfirm"
									name="passwdConfirm" required onmouseout="return Validate()">
								<font color="red"><span id="ajax2"> </span></font>
							</div>
							<button type="submit" class="btn btn-primary">確定修改</button>
						</form>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>