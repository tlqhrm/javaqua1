const target = document.querySelector('.target');
const links = document.querySelectorAll('.detail_info a');
const colors = ['deepskyblue','orange','black','green','gold','magenta','darkblue'];

for(let i = 0; i<links.length;i++){
    links[i].addEventListener('click',(e)=> e.preventDefault);
    links[i].addEventListener('mouseenter', mouseenterFunc);
} 
function mouseenterFunc(){
    if(!this.parentNode.classList.contains('active')){
        for(let i = 0; i<links.length;i++){
            if(links[i].parentNode.classList.contains('active')){
                links[i].parentNode.classList.remove('active');
            }
            links[i].style.opacity = '0.25';
        }
        this.parentNode.classList.add('active');
        this.style.opacity = '1';

        const width = this.getBoundingClientRect().width;
        const height = this.getBoundingClientRect().height;
        const left = this.getBoundingClientRect().left + window.pageXOffset;
        const top = this.getBoundingClientRect().top + window.pageYOffset;
        const color = colors[Math.floor(Math.random() * links.length)];

        // target.style.width = width + 'px';
        // target.style.height = height + 'px';
        // target.style.left = left + 'px';
        // target.style.top =  top + 'px';
        target.style.width =  `${width}px`;
        target.style.height =  `${height}px`;
        target.style.left =  `${left}px`;
        target.style.top =  `${top}px`;
        target.style.borderColor = color;
    }
}

function resizeFunc(){
    const active = document.querySelector('.detail_info li.active');

    if(active){
        const left = active.getBoundingClientRect().left + window.pageXOffset;
        const top = active.getBoundingClientRect().top + window.pageYOffset;

        target.style.width.left =  `${left}px`;
        target.style.width.top =  `${top}px`;
    }
}
window.addEventListener('resize',resizeFunc)

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
			if(id==null){alert("회원만 이용할수 있습니다.");return;}
			location.href="/direct_order.jsp?pd_num="+pd_num+"&title="+title+"&amount="+this.수량+"&price="+price;
		},
		장바구니담기: function(){

			if(id==null){alert("회원만 이용할수 있습니다.");return;}
             const params = new URLSearchParams();
             params.append('command', 'cart_add');
             params.append('pd_num', pd_num);
             params.append('title', title);
             params.append('price', price);
             params.append('amount', this.수량);
             params.append('file1', file1);
             params.append('user_id', id);
           
             axios.post('JavaquaServlet',params)
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

