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
	   	<!-- numeral 추가 -->
		<script src="//cdnjs.cloudflare.com/ajax/libs/numeral.js/2.0.6/numeral.min.js"></script>
		
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	</head>

	<body>
		<!-- 헤더 -->'
		<%@include file="../header.jsp"%>
			
		<div id="wrap">
			<div id="snb">
				<h2>상품관리</h2>
			    <ul>
			    	<a href="/admin/product"><li id="now">상품정보</li></a>
			    	<a href="/admin/product"><li>상품등록</li></a>
			    </ul>
			</div> 
		                 	
			<!-- app 열기 -->
			<div id="app" v-cloak>
				<div id="contents">
					<div class="sub">										
				        <div class="tb_tit">상품정보</div>
				        
						<table width="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed">	
						
					        <thead>
					            <tr>
					                <th width="3%">번호</th>
					                <th width="15%">카테고리1</th>
					                <th width="11%">카테고리2</th>
					                <th width="45%">이름</th>
					                <th width=7%>가격</th>
					                <th width="5%">재고</th>
					                <th width="10%"></th>
					            </tr>
					        </thead>	
					        <tbody>	
								<tr v-for="(item,i) in 데이터"  >
									<td>{{item.pd_num}}</td>
									<td class="check_ca1" @change="(수정(i,$event.target,'category1Arr'))">
									<span>
									  <input  v-model="item.category1Arr" type="checkbox" name="category1" value="new" :data-ca1="item.category1">신상품
      								  <input  v-model="item.category1Arr" type="checkbox" name="category1" value="sale">세일
       								  <input  v-model="item.category1Arr" type="checkbox" name="category1" value="best">베스트
       								 </span> 
       								 </td>
									<td >
									<select @blur="(수정(i,$event.target,'category2'))" v-model="item.category2" class="category2" name="category2" id="category2" :data-ca2="item.category2">
	                                <option value = "select" selected >선택해주세요</option>
				                    <option value = "랜덤금붕어" >랜덤금붕어</option>
				                    <option value = "최상급 금붕어">최상급 금붕어</option>
				                    <option value = "오란다">오란다</option>
				                    <option value = "난주">난주</option>
				                    <option value = "점보">점보</option>
				                    <option value = "진주린">진주린</option>
				                    <option value = "구피">구피</option>
				                    <option value = "플래티/몰리">플래티/몰리</option>
				                    <option value = "테트라">테트라</option>
				                    <option value = "랜덤 베타">랜덤 베타</option>
				                    <option value = "실물 베타">실물 베타</option>
				                    <option value = "야생 베타">야생 베타</option>
				                    <option value = "구라미">구라미</option>
				                    <option value = "라스보라/레인보우">라스보라/레인보우</option>
				                    <option value = "코리/플레코/캣">코리/플레코/캣</option>
				                    <option value = "엔젤/디스커스">엔젤/디스커스</option>
				                    <option value = "라미네지/시클리드">라미네지/시클리드</option>
				                    <option value = "생이새우">생이새우</option>
				                    <option value = "비쉬림프">비쉬림프</option>
				                    <option value = "패각류">패각류</option>
				                    <option value = "전경수초">전경수초</option>
				                    <option value = "중경수초">중경수초</option>
				                    <option value = "후경수초">후경수초</option>
				                    <option value = "씨앗수초">씨앗수초</option>
				                    <option value = "부상수초">부상수초</option>
				                    <option value = "음성수초">음성수초</option>
			                    </select>
			                    </td>
									<td @blur="(수정(i,$event.target,'title'))"  v-on:dblclick="에디트($event.target)"  contenteditable="false">{{item.title}}</td>
									<td @change="(수정(i,$event.target,'price'))"><input @change="콤마제거(i,$event.target.value)" :value="item.price | 콤마표시"  size="6"></td>
									<td @change="(수정(i,$event.target,'stock'))"><input v-model="item.stock" size="3"></td>	
									<td width="100" style="color:blue">
										<span style="cursor:pointer">수정</span> &nbsp;&nbsp;&nbsp;
										<span style="cursor:pointer">삭제</span>
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
		
		var updateIndex = [];
		var config = {
				headers:{
					"${_csrf.headerName}":"${_csrf.token}"
				}	
		}
			const v=new Vue({
			    el : "#app",
			    data : {	
					데이터 : [{
						pd_num:0,
						category1:"",
						category1Arr:[],
						category2:"",
						title:"",
						price:"",
						stock:0
					}],
					데이터원본 : [{
						pd_num:0,
						category1:"",
						category1Arr:[],
						category2:"",
						title:"",
						price:"",
						stock:0
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
					
				
				},	
				
				created : function(){
					this.데이터가져오기();
				},
				updated : function(){
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
					데이터가져오기 : function(){
						console.log("??????????????")
						 const params = new URLSearchParams();
			             params.append('page', this.현재페이지);  
			             params.append('pagePerList', this.pagePerList);
			           
			             axios.post('/admin/product_list',params,config)
			             .then(res=>{
			             	this.데이터 = res.data[0];
			             	this.페이징정보 = res.data[1];  

			             	var ca2 = $(".category2");
							for(i=0; i<ca2.length; i++ ){			
								for(j=0; j<ca2[i].children.length; j++) {
									if(ca2[i].children[j].value == ca2[i].getAttribute("data-ca2")) {
										ca2[i].children[j].setAttribute('selected', true)
									}
								}
							}	
			             })
			             .catch(err=>{
			            	alert("오류가 발생했습니다.");
			              	console.log(err)             	
			             });
			             axios.post('/admin/product_list',params,config)
			             .then(res=>{
			             	this.데이터원본 = res.data[0];
             	
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
					콤마제거  : function(i,value){
						this.데이터[i].price = value.replace(/,/g, "");

					},
					수정 : function(i,target,category){
						console.log(this.데이터원본[i][category]);
						console.log(this.데이터[i][category]);
						if(category == 'category1Arr'){
							if(JSON.stringify(this.데이터원본[i][category].sort()) != JSON.stringify(this.데이터[i][category].sort())){
								target.parentNode.style.border = "2px red solid";
								updateIndex.push(i);
								
							}else{
								target.parentNode.style.border = "0px";
								updateIndex.splice(i,1);
							}
						
						}else if(category == 'title'){
							if(this.데이터원본[i][category] != target.textContent)	{
								target.style.color = "red";
								updateIndex.push(i);
							}else{
								target.style.color = "#727272";
								updateIndex.splice(i,1);
							}
							target.contentEditable = false;
						}else{
							if(this.데이터원본[i][category] != this.데이터[i][category]){
								target.style.border = "2px red solid";
								updateIndex.push(i);
								
							}else{
								target.style.border = "1px rgb(118, 118, 118) solid";
								updateIndex.splice(i,1);
							}
						}
						console.log(updateIndex);
						
					},
					에디트 : function(target){

						
						if(target.isContentEditable == false) {

			                // @details 편집 가능 상태로 변경
			                target.contentEditable = true;
			                // @details 포커스 지정
			                target.focus();
			            }
			            else {

			                // 편집 불가 상태로 변경
			                target.contentEditable = false;
			            }
					},
					에디트x : function(target){
						target.contentEditable = false;
						
						
					},
					테스트 : function(target){
						target.style.border = "1px solid red";
						console.log(123);
					}
					
				},		
				watch : {
					
					현재페이지(){
						this.데이터가져오기();
					}
				},
				filters : {
					콤마표시 : function(value){
						return numeral(value).format('0,0');
					}
				}
			});
		</script>

	</body>
</html>
