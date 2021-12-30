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
	<link href="/resources/images/로고/자바쿠아 아이콘.jpg" rel="shortcut icon" type="image/x-icon">
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
	       <h3 class="tit">리뷰작성 </h3>
	       <form>  
	           <table class="tbl_comm">
	               <tbody>
	                   <tr>
	                       <th><img width="80" src="/resources/upload/product/${pvo.file1}"/></th>
	                       <td>
	                       		${pvo.title}
	                       </td>
	                   </tr>  
	                   <tr>
	                       <th>상세리뷰 </th>
	                       <td>
	                       		<textarea v-model="상세리뷰" class="review_detail" cols="100%" rows="15" maxlength="800"></textarea>                             
	                       </td>
	                   </tr>  
	               </tbody>
	           </table>
	        <div style="text-align: center; margin-top: 30px;">
	           	<button type="button" class="btn" @click="리뷰등록(${param.pd_num})">등록하기</button>
	        </div> 
	       </form>	    	
	   </div>
	</div>
</div>
<!-- app 닫기 -->	

<script>
	const v=new Vue({
	    el : "#app",
	    data : {		
			상세리뷰 : ""
		},	
		created : function(){
	
		},	
		computed : {
		
		},
		methods : {
			
			리뷰등록(pd_num){
				if(!this.상세리뷰){alert("내용을 입력해주세요");return;}
	             const params = new URLSearchParams();
	             params.append('user_id', "${id}");
	             params.append('pd_num', pd_num);
	             params.append('content', this.상세리뷰);
	                 
	             axios.post('/review/write',params)
	             .then(res=>{
	            	 if(res.data==200){	                	  
	            		 alert("등록되었습니다.");
	            		 window.close();
	            		 window.opener.location.href="/order/order_list";
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