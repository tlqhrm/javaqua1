window.onload;

const v=new Vue({
    el : "#app",
    data : {		
		배송비 : 3500,
		회원정보 : {
			name : '',
			user_email : '',
			user_address : '',
			user_address2 : '',
			user_phone : ''
		}
	},	
	created : function(){
		if(!id){alert("회원만 이용할수 있습니다.");location.href="login.jsp"}
		this.회원정보가져오기();
	},	
	computed : {
		주문금액 : function(){
			return price * amount;
		},
		최종결제금액 : function(){
			return price*amount+this.배송비;
		}	
	},
	methods : {
		회원정보가져오기 : function(){
             const params = new URLSearchParams();
             params.append('user_id', id);
           
             axios.post('/member/selectMember',params)
             .then(res=>{
            	this.회원정보 = res.data;
             })
             .catch(err=>{
            	alert("오류가 발생했습니다.");
              	console.log(err);
             });
		},
		결제하기 : function(){
             const params = new URLSearchParams();
             params.append('user_id', id);
             params.append('pd_num', pd_num);
             params.append('amount', amount);
             params.append('price', price);
             params.append('totalprice', this.최종결제금액);
             params.append('title', title);
           
             axios.post('/order/directOrder',params)
             .then(res=>{
            	 if(res.data==1){	                	  
            		window.location.href="/order/order_ok";
            	 }else{
            		 alert("재고가 부족합니다.");
            	 }
             })
             .catch(err=>{
            	alert("오류가 발생했습니다.");
              	console.log(err);
             });
		}
	},
	filters : {
		콤마표시 : function(value){
			return numeral(value).format('0,0');
		}
	}
});