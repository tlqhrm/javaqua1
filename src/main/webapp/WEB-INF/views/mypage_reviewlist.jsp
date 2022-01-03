<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   

<!DOCTYPE html>
<html lang="ko">

	<head>
	    <title>JavaQua</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	   	<link href="/resources/images/로고/자바쿠아 아이콘.jpg" rel="shortcut icon" type="image/x-icon">
	    <link rel="stylesheet" type="text/css" href="/resources/css/mypage_orderlist.css">
	    <link href="/resources/css/suport_page.css" rel="stylesheet" type="text/css">
	   	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	   		
	   	<!-- axios 추가 -->
	    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>	   		    	    
	    <!-- vuejs 추가 -->
	   	<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
	</head>

	<body>
		<!-- 헤더 -->
		<%@include file="header.jsp"%>
			
		<div id="wrap">
			<div style="padding-top:65px;">
				<div id="snb">
					<h2>마이페이지</h2>
				    <ul>
						<a href="/order/order_list"><li>주문내역</li></a>
						<a href="/review/review_list"><li id="now">리뷰내역</li></a>
						<a href="/qna/qna_list"><li>Q&A내역</li></a>
				        <a href="/member/passwordCheckForm"><li>개인정보수정</li></a>
				    </ul>
				</div> 
		                 
			    <div class="contents">
					<!-- app 열기 -->
					<div id="app" >
						<div id="contents">
							<div class="sub">										
						        <div class="tb_tit" style="border-bottom:skyblue solid 2px;">
						        	리뷰 ({{페이징정보.totalContent}})
						        </div>
						        
								<table width="100%" border="0" cellpadding="0" cellspacing="0" class="mem_table">				
									<tr height="100" v-for="(item,i) in 리뷰데이터" :key="i">
										<td width="100">{{item.user_id}}</td>
										<td class="txtb" width="800"><span style="white-space: pre-line;">{{item.content}}</span></td>
										<td width="150">{{item.writedate.substr(0,10)}}</td>
									</tr>
								</table>    
								
								<div v-if="!리뷰데이터.length" class="no_data" style="padding:150px 0 148px;border-top:1px solid #e6e6e6;border-bottom:1px solid #e6e6e6;color:#4c4c4c;font-size:12px;">
									리뷰가 존재하지 않습니다.
								</div>
													
								<!--리뷰 page_div-->			
							    <div id="page_div">
								    <div id="page_select">
								    	<!-- << 버튼 -->
								        <a class="first" @click="페이징(1)"></a>
								        <!-- // -->
								        
								        <!-- < 버튼 -->
								        	<a class="prev" @click="페이징(현재페이지-1)"></a>
								        <!-- // -->
								        
								        <!-- 페이징 -->		
								        <span v-for="item in 페이징리스트">    
								        	<span> 	
										        <a v-if="현재페이지 ==item" class="number" @click="페이징(item)" id="now_num">
										        	{{item}}
										        </a>
										        <a v-else class="number" @click="페이징(item)">
										        	{{item}}
										        </a>
									        </span>  
										</span>
								        <!-- // -->
								        			        
								        <!-- > 버튼 -->
								        	<a class="next" @click="페이징(현재페이지+1)"></a>
								        <!-- // -->
								        			     					
										<!-- >> 버튼 -->
								        <a class="last" @click="페이징(페이징정보.startEnd[2])"></a>
								        <!-- // -->
								    </div>  
							    </div>  
							    <!--//리뷰 page_div-->
								
							</div>
						</div>
					</div>
					<!-- app 닫기 -->	
			    </div>  
		    </div>  <!--main-->
		</div>  <!--wrap -->
				
		<!-- 푸터 -->
		<%@include file="footer.jsp"%>	
		
		<script>
			const v=new Vue({
			    el : "#app",
			    data : {	
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
			             params.append('user_id', '${id}');
			             params.append('page', this.현재페이지);      
			             params.append('pagePerList', this.pagePerList);
			           
			             axios.post('/review/myreview',params)
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
					}
				},		
				watch : {
					현재페이지(){
						this.리뷰데이터가져오기();
					}
				}
			});
		</script>

	</body>
</html>
