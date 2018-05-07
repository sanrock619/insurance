<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<jsp:useBean id="member" class="beans.Member" scope="session" />
<jsp:setProperty name="member" property="*" />
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
<link href="vendor/bootstrap/css/table.css" rel="stylesheet">

</head>

<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">網路投保專區-保單明細</a>
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
			<!-- 讀取保單 -->
			<sql:query var="result" dataSource="jdbc/InsDB"
				sql="SELECT * FROM ${param.table} WHERE policyNumber = '${param.policyNumber}'" />

			<!-- Page Content -->
			<div class="container">
				<div class="row">
					<div class="col-lg-12" style="padding-top: 2%">
						<div>
							<span class="oi oi-person" aria-hidden="true"></span>被保險人：${member.realname}
						</div>
						<br> <span class="oi oi-document" aria-hidden="true"></span>保單號碼：${param.policyNumber}
						<br> <br> 被保險人資料：
						<table class="table table-hover text-center table-bordered">
							<tbody>
								<tr>
									<th scope="row">姓名</th>
									<th scope="row">生日</th>
									<th scope="row">電話</th>
									<th scope="row">E-Mail</th>
								</tr>
								<tr>
									<td>${member.realname}</td>
									<td>${member.birthY-1911}/${member.birthM}/${member.birthD}</td>
									<td>${member.phone}</td>
									<td>${member.email}</td>
								</tr>
							</tbody>
						</table>
						保單資料：
						<c:forEach items="${result.rows }" var="policy">
							<table class="table table-hover text-center table-bordered">
								<tbody>
									<tr>
										<th scope="row">投保險種</th>
										<td>${policy.policyName}</td>
										<th scope="row">契約狀態</th>
										<td>有效</td>
									</tr>
									<tr>
										<th scope="row">繳別</th>
										<td>年繳</td>
										<th scope="row">契約開始日</th>
										<td>${policy.period.substring(3, 13)}</td>
									</tr>
									<tr>
										<th scope="row">繳法</th>
										<td>信用卡</td>
										<th scope="row">保險金額</th>
										<td>${policy.insAmount}萬元</td>
									</tr>
									<tr>
										<th scope="row">保障結束日</th>
										<td>${policy.period.substring(20, 32)}</td>
										<th scope="row">繳費期滿日</th>
										<td><c:if test="${param.table.equals('policy_life')}">
											${policy.period.substring(20, 29)}
											</c:if> <c:if test="${param.table.equals('policy_tour')}">
											--
											</c:if>
											<c:if test="${param.table.equals('policy_accident')}">
											--
											</c:if>
											</td>
									</tr>
									<tr>
										<th scope="row">保險費</th>
										<td>${policy.premium}</td>
										<th scope="row">身故受益人</th>
										<td>
										<c:if test="${!policy.beneficiary1.equals('')}">
											${policy.beneficiary1}
										</c:if>
										<c:if test="${!policy.beneficiary2.equals('')}">
											${policy.beneficiary2}
										</c:if>
										<c:if test="${!policy.beneficiary3.equals('')}">
											${policy.beneficiary3}
										</c:if>
										<c:if test="${!policy.beneficiary4.equals('')}">
											${policy.beneficiary4}
										</c:if>
										</td>
									</tr>
									<c:if test="${policy.auto!=null}">
										<tr>
											<th scope="row">自動續約</th>
											<td>${policy.auto}</td>
											<th></th>
											<td></td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</c:forEach>
						<div class="alert alert-primary text-center" role="alert">
							<span class="oi oi-info" aria-hidden="true"></span>
							以上資料僅供參考，實際內容以本公司所簽發之保險單為準
						</div>
						<div class="text-center">
							<a href="myPolicy.jsp" class="btn btn-info \"> <span
								class="oi oi-action-undo" aria-hidden="true"></span>回我的保單
							</a>
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