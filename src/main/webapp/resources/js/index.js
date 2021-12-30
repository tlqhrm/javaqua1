const v_pdList = new Vue({
	el:"#main",
	data:{
		
		pdList1 : JSON.parse(pdList1),
		pdList2 : JSON.parse(pdList2),
		pdList3 : JSON.parse(pdList3),
		pdList4 : JSON.parse(pdList4),
		pdListMd : JSON.parse(pdListMd),
		category2 : '금붕어',	
		id : '${id}'
	},
	methods : {
		엠디 : function(category2){

			const params = new URLSearchParams();
			params.append("category2", category2);
			axios.post('/pdListMd',params)
			.then(res=>{
				this.pdListMd = res.data;		
				this.category2 = category2;
			})
			.catch(err=>{
				console.log("md리스트 에러");
				console.log(err);
			});		
			
		},
		장바구니담기: function(pd_num, title, price, file1, id){
			console.log(id);
			if(!id){alert("회원만 이용할수 있습니다.");return;}
             const params = new URLSearchParams();
             params.append('pd_num', pd_num);
             params.append('title', title);
             params.append('price', price);
             params.append('amount', 1);
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
		}
		
	}
})