<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="beans.PolicyTour"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="policyLife" class="beans.PolicyLife" scope="session" />
<jsp:setProperty name="policy" property="*" />
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
			<a class="navbar-brand" href="index.jsp">網路投保專區-保單預覽</a>
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
							<span class="oi oi-calculator" aria-hidden="true"></span>試算保費
					</a></li>
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
					<div class="col-lg-12 text-center">
						<div class="container" style="margin-top: 5%">
							<div class="row">
								<div class="col-sm-8 window">
									<h4>以下為您的保單計畫預覽</h4>
									<div class="col-sm text-center table-responsive">
										<table class="table table-hover table-bordered">
											<tbody>
												<tr>
													<th scope="row" class="tablenavO">保險名稱</th>
													<td>${policyAccident.policyName}</td>
												</tr>
												<tr>
													<th scope="row" class="tablenavE">保單號碼</th>
													<td>${policyAccident.policyNumber}</td>
												</tr>
												<tr>
													<th scope="row" class="tablenavO">要保人</th>
													<td>${policyAccident.proposer}</td>
												</tr>
												<tr>
													<th scope="row" class="tablenavE">被保險人</th>
													<td>${policyAccident.insured}</td>
												</tr>
												<tr>
													<th scope="row" class="tablenavO">受益人</th>
													<td>${sessionScope.beneficiary}</td>
												</tr>
												<tr>
													<th scope="row" class="tablenavE">保險金額</th>
													<td>${policyAccident.insAmount}萬元</td>
												</tr>
												<tr>
													<th scope="row" class="tablenavO">保險期間</th>
													<td>${policyAccident.period}</td>
												</tr>
												<tr>
													<th scope="row" class="tablenavE">保險費</th>
													<td>新台幣${policyAccident.premium}元整</td>
												</tr>
												<tr>
													<th scope="row" class="tablenavO">自動續約</th>
													<td><c:if test="${policyAccident.auto.equals('Y')}">
											是
											</c:if> <c:if test="${policyAccident.auto.equals('N')}">
											否
											</c:if></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="col-sm text-center" style="margin-top: 5%">
										<a href="applyAccident.jsp" class="btn btn-warning"
											style="float: left"> <span class="oi oi-action-undo"
											aria-hidden="true"></span>重新填寫
										</a> <a href="Underwriter?policy=accident" class="btn btn-success"
											style="float: right"> <span class="oi oi-circle-check"
											aria-hidden="true"></span>確定投保
										</a><br>
										<br>
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
</body>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</html>