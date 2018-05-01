//計算意外傷害險保費
function calculateAccident() {
	// 取得生日參數birthY
	var birthY = document.getElementById('birthY').value;
	var birthM = document.getElementById('birthM').value;
	var birthD = document.getElementById('birthD').value;

	// 設定每10萬元保額的費率
	var rate = 101.4;

	// 取得保額參數
	var insAmount = document.getElementById('insAmount').value;

	// 算出保費 回傳結果
	var premium = insAmount * rate;
	document.getElementById('result').innerHTML = premium;
}