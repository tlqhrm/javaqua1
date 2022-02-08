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
		최종결제금액 : function(){
			return (total*1)+this.배송비;
		}	
	},
	methods : {
		회원정보가져오기 : function(){
             const params = new URLSearchParams();
             params.append('user_id', id);
           
             axios.post('/member/selectMember',params, config)
             .then(res=>{
            	this.회원정보 = res.data;
             })
             .catch(err=>{
            	alert("오류가 발생했습니다.");
              	console.log(err);
             });
		},
		결제하기 : function(){
			//product 리스트 받아와서 cart리스트랑 비교 후 재고 체크 해야함
		
             const params = new URLSearchParams();
             params.append('user_id', id);
             params.append('totalprice', this.최종결제금액);
           
             axios.post('/cart/cartOrder',params, config)
             .then(res=>{
            	 if(res.data==200){	         	  
            		location.href="/order/order_ok";
            	 }else{
            		 alert("재고가 부족합니다. 재고 수량을 확인해 주세요.");
            	 }
             })
             .catch(err=>{
            	alert("오류가 발생했습니다.");
              	console.log(err);
             });
		}
	}
});