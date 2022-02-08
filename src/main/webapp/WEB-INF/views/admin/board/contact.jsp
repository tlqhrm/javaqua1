<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
	    <title>JavaQua</title>
	   	<link href="/resources/images/로고/자바쿠아 아이콘.jpg" rel="shortcut icon" type="image/x-icon">
	    <link href="/resources/css/admin.css" rel="stylesheet" type="text/css"> 		
	   	<!-- axios 추가 -->
	    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>	   		    	    
	    <!-- vuejs 추가 -->
	   	<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
	</head>

	<body>
		<!-- 헤더 -->'
		<%@include file="../header.jsp"%>
			
		<div id="wrap">
			<div id="snb">
				<h2>게시판관리</h2>
			    <ul>
			    	<a href="/admin/board/notice"><li>공지사항</li></a>
			    	<a href="/admin/board/faq"><li>자주하는질문</li></a>
			    	<a href="/admin/board/contact"><li id="now">1:1문의</li></a>
			    	<a href="/admin/board/review"><li>리뷰</li></a>
			    	<a href="/admin/board/qna"><li>상품문의</li></a>
			    </ul>
			</div> 
		                 	
			<!-- app 열기 -->
			<div id="app" v-cloak>
				<div id="contents">
					<div class="sub">										
				        <div class="tb_tit">
				        	1:1문의 
				        </div>
				        <div style="float:right">
				        <button @click="전체보기()">전체보기</button><button @click="답변대기()">답변대기만 보기</button>
				        </div><br>
						<table width="100%" border="0" cellpadding="0" cellspacing="0">	
						
					        <thead>
					            <tr>
					                <th width="50">번호</th>
					                <th width="100">분류</th>
					                <th>제목</th>
					                <th width="100">작성자</th>
					                <th width="100">작성일</th>
					                <th width="100"></th>
					            </tr>
					        </thead>	
					        <tbody>	
								<tr v-for="(item,i) in 데이터" :key="i">
									<td>{{item.bd_num}}</td>
									<td>{{item.bd_category1}}</td>
									<td>{{item.title}}</td>
									<td>{{item.user_id}}</td>
									<td>{{item.updateDate}}</td>
									<td style="text-align:right">
										<button v-if="item.status == '[답변대기]'" style="cursor:pointer" @click="답변(item.bd_id)">답변</button>
										<span v-else>답변완료</span>
									</td>	
								</tr>
							</tbody>	
						</table>    
						
						<div v-if="!데이터.length" class="no_data" style="padding:150px 0 148px;border-top:1px solid #e6e6e6;border-bottom:1px solid #e6e6e6;color:#4c4c4c;font-size:12px;">
							데이터가 존재하지 않습니다.
						</div>
											
						<!-- 페이징 -->							
					    <div id="page_div">
						    <div id="page_select">					
						        <a class="first" @click="페이징(1)"></a>													     				
						        	<a class="prev" @click="페이징(현재페이지-1)"></a>													        					
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
						        <a class="next" @click="페이징(현재페이지+1)"></a>						        			     				
						        <a class="last" @click="페이징(페이징정보.startEnd[2])"></a>
						    </div>  
					    </div>  
					    <!-- //페이징 -->						    					    			
					</div>
				</div>
			</div>
			<!-- //app-->		
		</div>  
		<!--//wrap -->
				

		<script>
		var config = {
				headers:{
					"${_csrf.headerName}":"${_csrf.token}"
				}	
		}
			const v=new Vue({
			    el : "#app",
			    data : {	
					데이터 : [{

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
					pagePerList : 20, //한 화면에 보여줄 데이터 수
					현재페이지 : 1,
					상태 : ""
				},	
				
				created : function(){
					this.데이터가져오기(this.상태);
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
					데이터가져오기 : function(status){
						 const params = new URLSearchParams();
			             params.append('page', this.현재페이지);  
			             params.append('pagePerList', this.pagePerList);
			             params.append("status", status)
			           
			             axios.post('/admin/contact_list',params,config)
			             .then(res=>{
			             	this.데이터 = res.data[0];
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
					답변(bd_id){
						var popup = window.open('/admin/readBoard?bd_category2=contact&bd_id='+bd_id,'open','height=900 , width=900, left=400');
						
						popup.addEventListener('beforeunload', function() {

					   		v.데이터가져오기(v.상태);
						});
					},
					답변대기(){
						this.상태 = "[답변대기]"
						this.데이터가져오기(this.상태);
					},
					전체보기(){
						this.상태  =""
						this.데이터가져오기(this.상태);
					}
				},		
				watch : {
					현재페이지(){
						this.데이터가져오기(this.상태);
					}
				}
			});
		</script>

	</body>
</html>
