// 숫자 3자리 콤마찍기
Number.prototype.formatNumber = function(){
    if(this==0) return 0;
    let regex = /(^[+-]?\d+)(\d{3})/;
    let nstr = (this + '');
    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
    return nstr;
};
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

var classes = document.getElementsByClassName("p_num");
var sum1 = document.getElementsByClassName("sum1");
var total = document.getElementsByClassName("bigtext right-align box blue summoney");
var price1 = document.getElementsByClassName("p_price1");

const v=new Vue({
    el : "#app",
    data : {
    	checkbox :[],
    },
    created(){
    	

    },
    mounted(){
    	$("input:checkbox[name='cart_num']").prop("checked", true);
    	console.log(this.checkbox);
    },
	methods : {
		주문하기: function(){	
			location.href="/cart/cart_order";				 		
		},
		수량업: function(cart_num,index,price){	
			
			const params = new URLSearchParams();
			params.append('cart_num', cart_num);
			params.append('mode', 'up');
			params.append('user_id', id);
			
			axios.post('/cart/cart_modify',params,config)
			.then(res=>{
				if(res.data==200){

					classes[index].value ++;
					sum1[index].textContent = numberWithCommas(classes[index].value * price)+"원";
					
					totalPrice = totalPrice + price;
					
					total[0].textContent = "합계금액 " +numberWithCommas(totalPrice)+"원";

				}else{
					alert("오류가 발생했습니다.");
				}		
			})
			.catch(err=>{
				alert("오류가 발생했습니다.");
			 	console.log(err);
			});				
		},
		수량다운: function(cart_num,index,price){	
				
			if(classes[index].value<=1)return;
		
			const params = new URLSearchParams();
			params.append('cart_num', cart_num);
			params.append('mode', 'down');
			params.append('user_id', id);
			
			axios.post('/cart/cart_modify',params,config)
			.then(res=>{
				if(res.data==200){

					classes[index].value --;
					sum1[index].textContent = numberWithCommas(classes[index].value * price)+"원";

					totalPrice = totalPrice - price;

					total[0].textContent = "합계금액 " +numberWithCommas(totalPrice)+"원";
				}else{
					alert("오류가 발생했씁니다.");
				}	
			})
			.catch(err=>{
				alert("오류가 발생했습니다.");
			 	console.log(err);
			});				
		},
		상품삭제: function(cart_num){	
			
             const params = new URLSearchParams();
             params.append('cart_num', cart_num);
             params.append('mode', 'one_del');
             params.append('user_id', id);
           
             axios.post('/cart/cart_modify',params,config)
             .then(res=>{
				if(res.data==200){
					history.go(0);
				}else{
					alert("오류가 발생했씁니다.");
				}	
             })
             .catch(err=>{
            	alert("오류가 발생했습니다.");
              	console.log(err);
             });				
		},
		전체삭제: function(){	
			if(confirm("장바구니를 비우시겠습니까?")){							
                 const params = new URLSearchParams();   
                 params.append('cart_num', 0);         
                 params.append('mode', 'all_del');
                 params.append('user_id', id);
               
                 axios.post('/cart/cart_modify',params,config)
                 .then(res=>{
					if(res.data==200){
						history.go(0);
					}else{
						alert("오류가 발생했씁니다..");
					}	
                 })
                 .catch(err=>{
                	alert("오류가 발생했습니다.");
                  	console.log(err);
                 });				
			}
		},
		change : function(){
			console.log(this.checkbox);
		}
	}			
});