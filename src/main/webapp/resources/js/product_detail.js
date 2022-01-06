$(window).scroll(function(){
	if( $(window).scrollTop()>=600 ){
		$('#btfTab').addClass('add_fixed');
	}
	else{
		$('#btfTab').removeClass('add_fixed');			
	}
});

$(function(){
	 $(".li1").click(function(){ 
	 
		let offset = $("#target1").offset();
		offset.top = offset.top - 140;
        $('html, body').animate({scrollTop : offset.top}, 300);

        $('.li1').addClass('add_active');
        $('.li2').removeClass('add_active');	
        $('.li3').removeClass('add_active');	
        $('.li4').removeClass('add_active');	
    });
 	$(".li2").click(function(){ 
		
		let offset = $("#target2").offset();
		offset.top = offset.top - 110;
        $('html, body').animate({scrollTop : offset.top}, 300);
		
        $('.li1').removeClass('add_active');
        $('.li2').addClass('add_active');
        $('.li3').removeClass('add_active');	
        $('.li4').removeClass('add_active');	
    });
 	$(".li3").click(function(){ 
 	
 		let offset = $("#target3").offset();
		offset.top = offset.top - 110 ;
        $('html, body').animate({scrollTop : offset.top}, 300);
 	
        $('.li1').removeClass('add_active');
        $('.li2').removeClass('add_active');	
        $('.li3').addClass('add_active');
        $('.li4').removeClass('add_active');	
    });
 	$(".li4").click(function(){ 
 	
 		let offset = $("#target3").offset();
		offset.top = offset.top + 550 ;
        $('html, body').animate({scrollTop : offset.top}, 300);
 	
        $('.li1').removeClass('add_active');
        $('.li2').removeClass('add_active');	
        $('.li3').removeClass('add_active');	
        $('.li4').addClass('add_active');	
    });
});

const v=new Vue({
    el : "#app",
    data : {	
		수량:1,
		금액:price,
		배송비:3500,
		재고:stock,
		리뷰데이터 : [{
			rv_num : 0,
			pd_num : 0,
			user_id : "",
			content : "",
			writedate : ""	
		}],
		페이징정보 : {
			endPage:0,
			page:0,
			pagePerList:0,
			pagingCount:0,
			startEnd:[],
			startPage:0,
			totalContent:0,
			totalPage:0
		},		
		pagePerList : 5, //한 화면에 보여줄 데이터 수
		현재페이지 : 1
	},	
	
	created : function(){

		this.리뷰데이터가져오기();
	},
	computed : {
		합계금액 : function(){
			return this.수량 * this.금액;
		},
		페이징리스트(){
			let list = [];
			for (let i = this.페이징정보.startEnd[0]; i <= this.페이징정보.startEnd[1]; i++) {
				list.push(i);
			}
			return list;
		}
	},
	methods : {
		리뷰데이터가져오기 : function(){
			 const params = new URLSearchParams();
             params.append('pd_num', pd_num);
             params.append('page', this.현재페이지);      
             params.append('pagePerList', this.pagePerList);
           
             axios.post('/review/review_list',params, config)
             .then(res=>{
             	this.리뷰데이터 = res.data[0];
             	this.페이징정보 = res.data[1];                   	
             })
             .catch(err=>{
            	alert("오류가 발생했습니다.");
              	console.log(err);
             });
		},
		페이징(val){
			if(val <=0 || val > this.페이징정보.startEnd[2]){return;}
			this.현재페이지 = val;
		},
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
           
             axios.post('/cart/cart_add',params, config)
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
			if(this.재고  < 1){
				alert("품절 상품입니다.");
			}else if(this.수량 >stock-1){
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
	watch : {
		현재페이지(){
			this.리뷰데이터가져오기();
		}
	},	
	filters : {
		콤마표시 : function(value){
			return numeral(value).format('0,0');
		}
	}
});

const qna = new Vue({
    el : "#qapp",
    data : {	
		문의데이터 : [{
			qna_num : 0,
			pd_num : 0,
			user_id : "",
			subject : "",
			content : "",
			status : "",
			reply : "",
			writedate : ""	
		}],
		페이징정보 : {
			endPage:0,
			page:0,
			pagePerList:0,
			pagingCount:0,
			startEnd:[],
			startPage:0,
			totalContent:0,
			totalPage:0
		},		
		pagePerList : 5, //한 화면에 보여줄 데이터 수
		현재페이지 : 1
	},	
	
	created : function(){
		this.문의데이터가져오기();
	},
	computed : {
		페이징리스트(){
			let list = [];
			for (let i = this.페이징정보.startEnd[0]; i <= this.페이징정보.startEnd[1]; i++) {
				list.push(i);
			}
			return list;
		}
	},
	methods : {
		문의하기새창(pd_num){
			window.open("/qna/qna_write?pd_num="+pd_num,"open","height=750 , width=1100");
		},
		문의데이터가져오기 : function(){
			 const params = new URLSearchParams();
             params.append('pd_num', pd_num);
             params.append('page', this.현재페이지);      
             params.append('pagePerList', this.pagePerList);
           
             axios.post('/qna/qna_list',params, config)
             .then(res=>{
             	this.문의데이터 = res.data[0];
             	this.페이징정보 = res.data[1];                   	
             })
             .catch(err=>{
            	alert("오류가 발생했습니다.");
              	console.log(err);
             });
		},
		페이징(val){
			if(val <=0 || val > this.페이징정보.startEnd[2]){return;}
			this.현재페이지 = val;
		}
	},		
	watch : {
		현재페이지(){
			this.문의데이터가져오기();
		}
	}
});
