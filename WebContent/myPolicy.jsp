<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<jsp:useBean id="member" class="beans.Member" scope="session" />
<jsp:setProperty name="member" property="*" />
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" http-equiv="Content-Type"
	content="text/html; charset=UTF-8; width=device-width; initial-scale=1">

<title>線上投保</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- open-iconic css -->
<link href="open-iconic/font/css/open-iconic-bootstrap.css"
	rel="stylesheet">

<!-- Custom styles for this project -->
<link href="vendor/bootstrap/css/ins.css" rel="stylesheet">
<link href="vendor/bootstrap/css/table.css" rel="stylesheet">

</head>

<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">網路投保專區-我的保單</a>
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
						<h6 class="mt-5" style="float: left">您好，以下為您目前有效保單之資料</h6>
						<!-- 讀取定期壽險保單 -->
						<sql:query var="result" dataSource="jdbc/InsDB"
							sql="SELECT * FROM policy_life WHERE id = '${member.id }'" />
						<c:forEach items="${result.rows }" var="policy">
							<c:choose>
								<c:when test="${policy.premium == null || policy.premium ==0}">
				很抱歉，您目前無有效之保單
			</c:when>
								<c:otherwise>

									<table class="table table-hover table-bordered text-center">
										<tbody id="table">
											<tr>
												<th scope="row">要保人</th>
												<th scope="row">被保險人</th>
												<th scope="row">保單險種及號碼</th>
												<th scope="row">保險金額</th>
												<th scope="row">保障期限</th>
												<th scope="row">保費</th>
											</tr>
											<tr>
												<td>${policy.proposer}</td>
												<td>${policy.insured}</td>
												<td><div>${policy.policyName}</div> <a
													href="myPolicyDetail.jsp?table=policy_life&policyNumber=${policy.policyNumber}">${policy.policyNumber}</a></td>
												<td>${policy.insAmount}萬元</td>
												<td>${policy.period.substring(20, 32)}</td>
												<td>${policy.premium}元</td>
											</tr>
										</tbody>
									</table>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<!-- 讀取旅平險保單 -->
						<sql:query var="tourResult" dataSource="jdbc/InsDB"
							sql="SELECT * FROM policy_tour WHERE id = '${member.id }'" />
						<c:forEach items="${tourResult.rows }" var="policy">
							<c:choose>
								<c:when test="${policy.premium == null || policy.premium ==0}">
				很抱歉，您目前無有效之保單
			</c:when>
								<c:otherwise>

									<table class="table table-hover table-bordered text-center">
										<tbody id="table">
											<tr>
												<th scope="row">要保人</th>
												<th scope="row">被保險人</th>
												<th scope="row">保單險種及號碼</th>
												<th scope="row">保險金額</th>
												<th scope="row">保障期限</th>
												<th scope="row">保費</th>
											</tr>
											<tr>
												<td>${policy.proposer}</td>
												<td>${policy.insured}</td>
												<td><div>${policy.policyName}</div> <a
													href="myPolicyDetail.jsp?table=policy_tour&policyNumber=${policy.policyNumber}">${policy.policyNumber}</a></td>
												<td>${policy.insAmount}萬元</td>
												<td>${policy.period.substring(20, 32)}</td>
												<td>${policy.premium}元</td>
											</tr>
										</tbody>
									</table>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<!-- 讀取意外傷害險保單 -->
						<sql:query var="accidentResult" dataSource="jdbc/InsDB"
							sql="SELECT * FROM policy_accident WHERE id = '${member.id }'" />
						<c:forEach items="${accidentResult.rows }" var="policy">
							<c:choose>
								<c:when test="${policy.premium == null || policy.premium ==0}">
				很抱歉，您目前無有效之保單
			</c:when>
								<c:otherwise>

									<table class="table table-hover table-bordered text-center">
										<tbody id="table">
											<tr>
												<th scope="row">要保人</th>
												<th scope="row">被保險人</th>
												<th scope="row">保單險種及號碼</th>
												<th scope="row">保險金額</th>
												<th scope="row">保障期限</th>
												<th scope="row">保費</th>
											</tr>
											<tr>
												<td>${policy.proposer}</td>
												<td>${policy.insured}</td>
												<td><div>${policy.policyName}</div> <a
													href="myPolicyDetail.jsp?table=policy_accident&policyNumber=${policy.policyNumber}">${policy.policyNumber}</a></td>
												<td>${policy.insAmount}萬元</td>
												<td>${policy.period.substring(19, 32)}</td>
												<td>${policy.premium}元</td>
											</tr>
										</tbody>
									</table>
								</c:otherwise>
							</c:choose>
						</c:forEach>
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