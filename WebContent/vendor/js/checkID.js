function checkID() {
	var id = document.getElementById('id').value;
	var url = "MemberServlet?request_type=check&id=" + id;

	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	if (id != "") {
		try {
			request.onreadystatechange = checkResult;
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("無法連接伺服器");
		}
	} else {
		document.getElementById('checkIDResult').innerHTML = "";
		var idDiv = document.getElementById("id");
		idDiv.className = "form-control";
	}
}

function checkResult() {
	if (request.readyState == 4) {
		var result = request.responseText;
		document.getElementById('checkIDResult').innerHTML = result;

		if (result == "請輸入正確身分證字號" || result == "此帳號已被註冊") {
			var idDiv = document.getElementById("id");
			idDiv.className = "form-control is-invalid";
		} else {
			var idDiv = document.getElementById("id");
			idDiv.className = "form-control is-valid";
		}
		Validate();
	}
}

function Validate() {
	var password = document.getElementById("passwd").value;
	var confirmPassword = document.getElementById("passwdConfirm").value;
	var confirmDiv = document.getElementById("passwdConfirm");

	if (password != "" && confirmPassword != "") {
		if (password != confirmPassword) {
			var alert = "密碼不一致，請重新確認";
			document.getElementById('checkPassResult').innerHTML = alert;
			confirmDiv.className = "form-control is-invalid";
			return false;
		} else {
			document.getElementById('checkPassResult').innerHTML = "";
			confirmDiv.className = "form-control is-valid";
			return true;
		}
	} else {
		document.getElementById('checkPassResult').innerHTML = "";
		confirmDiv.className = "form-control";
	}
}