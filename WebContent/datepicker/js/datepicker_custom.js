//使用bootsrtap datepicker 限制無法選擇今天(不含)以前的日期
var date = new Date();
var hour = date.getHours();
if(hour==23){
	date.setDate(date.getDate()+1);
}else{
	date.setDate(date.getDate());
}

//使用bootsrtap datepicker id需與使用該功能div的id符合
$('#datepicker input').datepicker({
	startDate: date,
	endDate: '+179d',
	format: "yyyy-mm-dd", //日期格式
	language: "zh-TW",    //日期使用正體中文
	autoclose: true,      //選擇日期後自動關閉
	todayHighlight: true,  //自動focus今天
	orientation: "bottom auto"
});