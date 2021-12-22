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



const v=new Vue({
    el : "#app",
    data : {		
		수량:1,
		금액:price,
		배송비:3500	
	},	
	computed : {
		합계금액 : function(){
			return this.수량 * this.금액;
		}	
	},
	methods : {
		즉시구매 : function(){
			if(!id){alert("회원만 이용할수 있습니다.");return;}
			location.href="/order/direct_order?pd_num="+pd_num+"&title="+title+"&amount="+this.수량+"&price="+price;
		},
		장바구니담기: function(){
			if(!id){alert("회원만 이용할수 있습니다.");return;}
             const params = new URLSearchParams();
             params.append('pd_num', pd_num);
             params.append('title', title);
             params.append('price', price);
             params.append('amount', this.수량);
             params.append('file1', file1);
             params.append('user_id', id);
           
             axios.post('/cart/cart_add',params)
             .then(res=>{
            	 alert(res.data);
             })
             .catch(err=>{
            	alert("오류가 발생했습니다.");
              	console.log(err);
             });				
		},
		문자제거 : function(val){			
			this.수량=val.replace(/[^0-9,]/g,"");			
			if(this.수량<1){
				this.수량=1;
			}
		},
	},			
	filters : {
		콤마표시 : function(value){
			return numeral(value).format('0,0');
		}
	}
});
