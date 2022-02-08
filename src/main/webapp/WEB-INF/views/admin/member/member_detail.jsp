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
	       <h3 class="tit">회원상세</h3>
				<table class="tbl_comm">
	               <tbody>
	                   <tr>
	                       <th>아이디</th>
	                       <td>
                           		{{회원정보.user_id}}                          
	                       </td>
	                   </tr>
	                   <tr>
	                       <th>이름</th>
	                       <td>
	                       		{{회원정보.name}}                          
	                       </td>
	                   </tr>
	                   <tr>
	                       <th>이메일</th>
	                       <td>
	                       		{{회원정보.user_email}}                          
	                       </td>
	                   </tr>
	                   <tr>
	                       <th>주소</th>
	                       <td>
	                       		{{회원정보.user_address}} {{회원정보.user_address2}}   	                       		               
	                       </td>
	                   </tr>
	                   <tr>
	                       <th>연락처</th>
	                       <td>
	                       		{{회원정보.user_phone}}             
	                       </td>
	                   </tr>
	               </tbody>
	           </table>
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
			회원정보 : {
				user_id : '',
				name : '',
				user_email : ''
			}
		},	
		created(){
			this.회원정보가져오기();
		},
		methods : {		
			회원정보가져오기 : function(){
	             const params = new URLSearchParams();
	             params.append('user_id', '${param.user_id}');
	           
	             axios.post('/admin/selectMember',params, config)
	             .then(res=>{	             
	            	this.회원정보 = res.data;
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