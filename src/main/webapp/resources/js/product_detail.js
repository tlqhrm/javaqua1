function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

var cnt = 1;
function changeCount(x){
	if(x === 'up'){
		if(cnt == parseInt($("#stock").text()) && parseInt($("#stock").text()) != 0){
			alert("최대수량입니다.");
			return false;
		}
		$("#count").val(parseInt($("#count").val())+1)
		cnt++;
	}else if(x === 'down'){
		if($("#count").val() != 1)
		$("#count").val(parseInt($("#count").val())-1)
		if(cnt != 1){
			cnt--;
		}
	}
}

$(document).ready(function(){
	console.log($(".price").text());
	$(".price").text(numberWithCommas($(".price").text()));
	$(".cost").text(numberWithCommas($(".cost").text()));
	$("#price").text(numberWithCommas($(".price").text()));
});

$("#count").on("change",function(){
	$("#price").text(numberWithCommas($("#ori_price").text()*$("#count").val()));
});
$("#up").on("click",function(){
	$("#price").text(numberWithCommas($("#ori_price").text()*$("#count").val()));
});
$("#down").on("click",function(){
	$("#price").text(numberWithCommas($("#ori_price").text()*$("#count").val()));
});
$(".prev_img").on("mouseover",function(){
	$("#main_img img").attr("src",$(this).children("img").attr("src"));
});