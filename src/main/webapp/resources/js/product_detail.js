


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
			location.href="/order/direct_order?pd_num="+pd_num+"&title="+title+"&amount="+this.수량+"&price="+price+"&file1="+file1;
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
			if(this.수량 >stock){
				alert("최대수량 초과입니다");
				this.수량 = stock;
			}
		},
		수량업 : function(){
			if(this.수량 >stock-1){
				alert("최대수량 초과입니다");
				this.수량 = stock;
			}else{
				this.수량 ++;
			}
		},
		수량다운 : function(){
			if(this.수량 > 1){
				this.수량 --;
			}
		},
		미리보기 : function(i){
		let bg3=$("#bg3 span img")[i].src;
		$("#main_img img").attr("src",bg3);
		}	
	},			
	filters : {
		콤마표시 : function(value){
			return numeral(value).format('0,0');
		}
	}
});
