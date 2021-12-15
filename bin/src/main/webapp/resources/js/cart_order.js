const v=new Vue({
    el : "#app",
    data : {		
		회원정보 : {
			name : '',
			user_email : '',
			user_address : '',
			user_phone : ''
		}
	},	
	created : function(){
		if(id==null){alert("회원만 이용할수 있습니다.");location.href="login.jsp"}
		this.회원정보가져오기();
	},	
	methods : {
		회원정보가져오기 : function(){
		alert(id);
			const params = new URLSearchParams();
			params.append('command', 'member_info');
			params.append('user_id', id);
			
			axios.post('JavaquaServlet',params)
			.then(res=>{
				this.회원정보 = res.data;
				console.log(res.date);
			})
			.catch(err=>{
			alert("오류가 발생했습니다.");
			 	console.log(err);
			});
		},
		결제하기 : function(){
             const params = new URLSearchParams();
             params.append('command', 'cart_order');
             params.append('user_id', id);
             params.append('totalprice', total+3500);
           
             axios.post('JavaquaServlet',params)
             .then(res=>{
            	 if(res.data==1){	                	  
            		location.href="order_ok.jsp";
            	 }else{
            		 alert("재고가 부족합니다.");
            	 }
             })
             .catch(err=>{
            	alert("오류가 발생했습니다.");
              	console.log(err);
             });
		}
	}
});