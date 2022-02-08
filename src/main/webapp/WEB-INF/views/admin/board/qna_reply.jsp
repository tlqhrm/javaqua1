<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JavaQua</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/review_write.css" />
	<!-- axios 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>	
    <!-- vuejs 추가 -->
  	<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
</head>
<body>
<!-- app 열기 -->
<div id="app" >
   <div id="wrap">
	   <div class="container">
	       <h3 class="tit">상품문의 답변 </h3>
	       <form>  
	       		<table class="tbl_comm">
	               <tbody>
	                   <tr>
	                       <th><img width="80" :src="'/resources/upload/product/'+상품정보.file1.split(';')[0]"/></th>
	                       <td>
	                       		{{상품정보.title}}
	                       </td>
	                   </tr>  
	                   <tr>
	                       <th>답변</th>
	                       <td>
	                       		<textarea v-model="답변" class="review_detail" cols="100%" rows="15" maxlength="800"></textarea>                              
	                       </td>
	                   </tr>  
	               </tbody>
	           </table>
	       
		        <div style="text-align: center; margin-top: 30px;">
		           	<button type="button" class="btn" @click="답변하기()">답변하기</button>
		        </div> 
	       </form>	    	
	   </div>
	</div>
</div>
<!-- app 닫기 -->	

<script>
config = {
		headers:{
			"${_csrf.headerName}":"${_csrf.token}"
		}	
}
	const v=new Vue({
	    el : "#app",
	    data : {	
	    	상품정보 : {
	    		
	    	},
			답변 : ""
		},	
		created(){
			this.상품정보가져오기();
		},
		methods : {		
			상품정보가져오기(){
	             const params = new URLSearchParams();
	             params.append('pd_num', ${param.pd_num});
	                 
	             axios.post('/admin/product_detail',params,config)
	             .then(res=>{
	            	 this.상품정보=res.data;              	 
	             })
	             .catch(err=>{
	            	alert("오류가 발생했습니다.");
	              	console.log(err);
	             });
			},
			답변하기(){
				if(!this.답변){alert("답변을 입력해주세요");return;}
	             const params = new URLSearchParams();
	             params.append('qna_num', ${param.qna_num});
	             params.append('reply', this.답변);
	                 
	             axios.post('/admin/qnaReply',params,config)
	             .then(res=>{
	            	 if(res.data==200){	                	  
	            		 alert("답변을 등록했습니다.");
	            		 window.close();
	            		 window.opener.location.href="/admin/board/qna";
	            	 }else{
	            		 alert("오류가 발생했습니다");
	            	 }
	             })
	             .catch(err=>{
	            	alert("오류가 발생했습니다.");
	              	console.log(err);
	             });
			}
		}
	});
</script> 
</body>
</html>