//查詢保費ajax
function calculateLife() {
	// 取得性別參數
	var gender = document.getElementById('gender').value;

	// 取得繳費年期參數
	var years = document.getElementById('years').value;

	// 取得生日參數birthY
	var birthY = document.getElementById('birthY').value;
	var birthM = document.getElementById('birthM').value;
	var birthD = document.getElementById('birthD').value;

	// 取得保額參數
	var insAmount = document.getElementById('insAmount').value;

	var url = "Life?gender=" + gender + "&years=" + years + "&birthY=" + birthY
			+ "&birthM=" + birthM + "&birthD=" + birthD + "&insAmount="
			+ insAmount + "&requestType=cal";

	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = getLifePremium;
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("無法連接伺服器");
	}
}

function getLifePremium() {
	if (request.readyState == 4) {
		var result = request.responseText;
		document.getElementById('result').innerHTML = result;
	}
}

// 將性別參數設為male
function setGenderMale() {
	document.getElementById('gender').value = document.getElementById('male').value;
	calculateLife();
}

// 將性別參數設為female
function setGenderFemale() {
	document.getElementById('gender').value = document.getElementById('female').value;
	calculateLife();
}

// 將年期參數設為10年
function setYears10() {
	document.getElementById('years').value = document.getElementById('y10').value;
	calculateLife();
}

// 將年期參數設為20年
function setYears20() {
	document.getElementById('years').value = document.getElementById('y20').value;
	calculateLife();
}

//
//function setBirthY(){
//	document.getElementById('birthY').value = document.getElementById('y').value;
//	document.getElementById('birthM').value = document.getElementById('m').value;
//	document.getElementById('birthD').value = document.getElementById('d').value;
//	calculateLife();
//}
//
//function setBirthM(){
//	document.getElementById('birthY').value = document.getElementById('y').value;
//	document.getElementById('birthM').value = document.getElementById('m').value;
//	document.getElementById('birthD').value = document.getElementById('d').value;
//	calculateLife();
//}
//
//function setBirthD(){
//	document.getElementById('birthY').value = document.getElementById('y').value;
//	document.getElementById('birthM').value = document.getElementById('m').value;
//	document.getElementById('birthD').value = document.getElementById('d').value;
//	calculateLife();
//}
// 按試算保費時 如果年齡不在承保範圍就跳警告視窗
// $("#cal").click(function() {
// var start_date = document.getElementById('start_date').value;
// var end_date = document.getElementById('end_date').value;
// var start = new Date(start_date);
// var end = new Date(end_date);
// if (end < start) {
// $('#alertModal').modal('show');
// }
//
// });
