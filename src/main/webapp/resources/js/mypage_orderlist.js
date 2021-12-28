const v=new Vue({
    el : "#app",
	methods : {
		리뷰작성새창(pd_num){
			window.open("/review/review_write?pd_num="+pd_num,width=100,height=200);
		}
	}
});