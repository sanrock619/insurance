//設定預設出發日期及結束日期
function setDefaultDate(){
var d1 = new Date();
var d2 = new Date();
var h = d1.getHours();

if(h==23){
	d1.setDate(d1.getDate() + 1);
	d2.setDate(d2.getDate() + 4);
}else{
	d2.setDate(d2.getDate() + 3);
}

var year = d1.getFullYear();
var month = d1.getMonth()+1;
if(month<10){
	month="0"+month;
}
var date = d1.getDate();
if(date<10){
	date="0"+date;
}

var endYear = d2.getFullYear();
var endMonth = d2.getMonth()+1;
if(endMonth<10){
	endMonth="0"+endMonth;
}
var endDate = d2.getDate();
if(endDate<10){
	endDate="0"+endDate;
}

document.getElementById("start_date").value = year+"-"+month+"-"+date;
document.getElementById("end_date").value = endYear+"-"+endMonth+"-"+endDate;
//document.getElementById("end_date").value = document.getElementById("start_date").value;
}

//當開始日期調整過 檢查結束日期是否比出發日期早 如果有就把結束日期調整為=出發日期
function resetEndDate(){
	var start = document.getElementById("start_date").value;
	var end = document.getElementById("end_date").value;
	var startDate = new Date(start);
	var endDate = new Date(end);

	if(endDate < startDate){
		document.getElementById("end_date").value = start;
	}
}

//將結束時間與出發時間綁定
function setBackTime(){
	document.getElementById("backTime").innerHTML = document.getElementById("goTime").value;
}

//查詢保費ajax
var request;
function sendInfo() {
	var start_date = document.getElementById('start_date').value;
	var end_date = document.getElementById('end_date').value;
	var insAmount = document.getElementById('insAmount').value;
	var url = "Tour?start_date=" + start_date + "&end_date=" + end_date + "&insAmount=" + insAmount + "&requestType=cal";

	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = getInfo;
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("無法連接伺服器");
	}
}

function getInfo() {
	if (request.readyState == 4) {
		var result = request.responseText;
		document.getElementById('result').innerHTML = result;
	}
}

//檢查結束日期 如果合格 就自動呼叫算保費方法
function checkEndDate(){
	var start_date = document.getElementById('start_date').value;
	var end_date = document.getElementById('end_date').value;
	var start = new Date(start_date);
	var end = new Date(end_date);
	
	if(end >= start){
		sendInfo();
	}
}

//按試算保費時 如果結束日期不合理就跳警告視窗
$("#cal").click(function() {
	var start_date = document.getElementById('start_date').value;
	var end_date = document.getElementById('end_date').value;
	var start = new Date(start_date);
	var end = new Date(end_date);
	if(end < start){
		$('#alertModal').modal('show');
	}
	  
});