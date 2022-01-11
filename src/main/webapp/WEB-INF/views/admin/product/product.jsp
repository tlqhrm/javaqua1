<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
	    <title>상품정보</title>
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
			
		
		                 	
			<!-- app 열기 -->
		<div id="app" v-cloak v-on:keyup.enter="페이지1()">
			<div id="wrap">
			<div id="snb">
				<h2>상품관리</h2>
			    <ul>
			    	<a href="/admin/product"><li id="now">상품정보</li></a>
			    	<a href="#none" @click="상품등록()"><li>상품등록</li></a>
			    </ul>
			</div> 
				<div id="contents">
					<div class="sub">										
				        <div class="tb_tit">상품정보</div>
				        <div style="line-height:35px"><b> 검색필터</b><br>
				        			<input v-model="검색조건.category1Arr" type="checkbox" name="category1" value="new">신상품
      								<input v-model="검색조건.category1Arr" type="checkbox" name="category1" value="sale" >세일
       								<input v-model="검색조건.category1Arr" type="checkbox" name="category1" value="best">베스트
       								<select v-model="검색조건.category2" class="category2" name="category2" id="category2" >
	                                <option value = "select" selected >선택안함</option>
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
			                   	&nbsp;&nbsp;가격 <input @change="콤마제거2('minPrice',$event.target.value)" :value="검색조건.minPrice| 콤마표시"  size="6"> ~ 
			                    <input @change="콤마제거2('maxPrice',$event.target.value)"  :value="검색조건.maxPrice| 콤마표시"  size="6">
			                    &nbsp;&nbsp; 재고 <input @change="콤마제거2('minStock',$event.target.value)" :value="검색조건.minStock| 콤마표시" size="3"> ~ <input @change="콤마제거2('maxStock',$event.target.value)" :value="검색조건.maxStock| 콤마표시" size="3">&nbsp;&nbsp; 검색어 <input v-model="검색조건.serTitle" size="7">
			                   &nbsp;&nbsp;  <button type="button" @click="페이지1()">검색</button>
			                   <br>정렬 <input v-model="검색조건.order" type="radio" value="registdate" checked>신상품순<input v-model="검색조건.order" type="radio" value="price">높은가격순<input v-model="검색조건.order" type="radio"value="salescount">판매량순</div>
			                   <button type="button" style="float:right" @click="전체업데이트()">변경사항 저장</button> <button type="button" style="float:right" @click="원본으로()">변경취소</button><br><br>
				        		
				        
						<table width="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed">	
						
					        <thead>
					            <tr>
					                <th width="3%">번호</th>
					                <th width="15%">카테고리1</th>
					                <th width="11%">카테고리2</th>
					                <th width="35%">이름</th>
					                <th width="7%">가격</th>
					                <th width="7%">할인율(%)</th> 
					                <th width="5%">재고</th>
					                <th width="5%">판매량</th>
					                <th width="8%"></th>
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
									<td @blur="(수정(i,$event.target,'title'))"  v-on:dblclick="에디트($event.target)"  contenteditable="false" style="text-overflow:clip">{{item.title}}</td>
									<td @change="(수정(i,$event.target,'price'))"><input @change="콤마제거(i,$event.target.value)" :value="item.price | 콤마표시"  size="6"></td>
									<td @change="(수정(i,$event.target,'discount'))"><input v-model="item.discount" size="3"></td>	
									<td @change="(수정(i,$event.target,'stock'))"><input v-model="item.stock" size="3"></td>	
									<td>{{item.salescount}}</td>	
									<td width="100" style="color:blue">
										<span style="cursor:pointer" @click="상품수정(item.pd_num)">수정</span> &nbsp;&nbsp;&nbsp;
										<span style="cursor:pointer" @click="상품삭제(item.pd_num,item.title)">삭제</span>
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
						        	<a class="prev" @click="페이징(검색조건.page-1)"></a>													        					
						        <span v-for="item in 페이징리스트">    
						        	<span> 	
								        <a v-if="검색조건.page ==item" class="number" @click="페이징(item)" id="now_num">
								        	{{item}}
								        </a>
								        <a v-else class="number" @click="페이징(item)">
								        	{{item}}
								        </a>
							        </span>  
								</span>							        			     
						        <a class="next" @click="페이징(검색조건.page+1)"></a>						        			     				
						        <a class="last" @click="페이징(페이징정보[2])"></a>
						    </div>  
					    </div><br><br>  
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
						stock:0,
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
					검색조건 : {
						category1Arr:[],
						category2:"select",
						serTitle:"",
						minPrice:0,
						maxPrice:0,
						minStock:0,
						maxStock:0,
						order:"",
						pagePerList : 20,
						page : 1
					},
					페이징정보 : [],	
					check : [],
					현재페이지 : 0,
					original: true
		

					
				
				},	
				
				created : function(){
					if(localStorage.getItem("page")){
						this.검색조건.page = localStorage.getItem("page");
						 localStorage.removeItem("page");
					}else{

						this.데이터가져오기();
					}
					
				},
				updated : function(){
				},
				computed : {
					페이징리스트(){
						let list = [];
						for (let i = this.페이징정보[0]; i <= this.페이징정보[1]; i++) {
							list.push(i);
						}
						return list;
					}
				},

				methods : {
					페이지1 : function(){
						if(this.검색조건.page == 1){
							this.수정확인()
						}else {
							this.검색조건.page = 1;
						}
						
						
					},
					데이터가져오기 : function(){												
						 const params = new URLSearchParams();
			             params.append('pagePerList', this.pagePerList);
			             params.append("cri", JSON.stringify(this.검색조건));
			             			             
			             axios.post('/admin/product_list',params,config)
			             .then(res=>{
			            	 
			             	this.데이터 = res.data[0];
			             	this.페이징정보 = res.data[1];  
							this.검색조건 = res.data[2];
			             	var ca2 = $(".category2");
							for(i=0; i<ca2.length; i++ ){			
								for(j=0; j<ca2[i].children.length; j++) {
									if(ca2[i].children[j].value == ca2[i].getAttribute("data-ca2")) {
										ca2[i].children[j].setAttribute('selected', true)
									}
								}
							}
							for(i=0; i<this.데이터.length; i++){
								this.check.push(false);
							}
							//this.검색조건.page = localStorage.getItem("productPage");

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
						if(val <=0 || val > this.페이징정보[2]){return;}
						this.검색조건.page = val;
					},
					콤마제거  : function(i,value){
						this.데이터[i].price = value.replace(/,/g, "");

					},
					콤마제거2 : function(target,value){
						this.검색조건[target] = value.replace(/,/g, "");
					},
					수정 : function(i,target,category){
						let idx = updateIndex.indexOf(i);
						if(category == 'category1Arr'){
							if(JSON.stringify(this.데이터원본[i][category].sort()) != JSON.stringify(this.데이터[i][category].sort())){
								if(this.check[i] == false){
									target.parentNode.style.border = "2px red solid";
									updateIndex.push(i);
									this.check[i] = true;
								}
							}else{
								target.parentNode.style.border = "0px";
								updateIndex.splice(idx,1);
								this.check[i] = false;
							}
						
						}else if(category == 'title'){
							if(this.데이터원본[i][category] != target.textContent)	{
								target.style.color = "red";
								updateIndex.push(i);
							}else{
								target.style.color = "#727272";
								updateIndex.splice(idx,1);
							}
							target.contentEditable = false;
							this.데이터[i][category] = target.textContent;
						}else{
							if(this.데이터원본[i][category] != this.데이터[i][category]){
								target.style.border = "2px red solid";
								updateIndex.push(i);
								
								
							}else{
								target.style.border = "1px rgb(118, 118, 118) solid";
								updateIndex.splice(idx,1);
							}
						}
						
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
					상품수정 :function(pd_num){
						let popup;
						popup = window.open("/product/productUpdateForm?pd_num="+pd_num ,"open" ,"height=900 , width=1300")
						popup.addEventListener('beforeunload', function() {
							setTimeout(() => {v.데이터가져오기()},1000);
						});
					},
					상품삭제 :function(pd_num,title){
						if ( confirm(title+" 을 정말 삭제하시겠습니까?") ) { 
							const params = new URLSearchParams();
							params.append("pd_num",pd_num);
							axios.post('/product/productDelete',params,config)
				             .then(res=>{
				             	alert(title + "이 삭제되었습니다.");
				             	this.수정확인()
				             })
				             .catch(err=>{
				            	alert("오류가 발생했습니다.");
				              	console.log(err);
				             });
						}
					},
					상품등록(){
						let popup;
						popup = window.open('/product/productRegistForm','open','height=1000 , width=1300, left=200');
						

						popup.addEventListener('beforeunload', function() {
							setTimeout(() => {v.데이터가져오기()},1000);
						});
					},
					전체업데이트 : function(){
						if(updateIndex.length > 0){
							const params = new URLSearchParams();
							let list = [];
							updateIndex = Array.from(new Set(updateIndex));
							for(i=0; i<updateIndex.length; i++){
								list.push(this.데이터[updateIndex[i]]);
							}
							params.append("list",JSON.stringify(list));
							axios.post('/product/productUpdateAll',params,config)
				             .then(res=>{
				             	alert(res.data);
				            	this.새로고침();
				             })
				             .catch(err=>{
				            	alert("오류가 발생했습니다.");
				              	console.log(err);
				             });							
						}
					},
					원본으로 : function(){
						if(updateIndex.length > 0){
							if(confirm("변경사항을 전부 되돌리시겠습니까?")){
								this.original = false;
								this.새로고침();

								this.original = true;
							}
						}
						else{
							alert("변경사항이 없습니다.");
						}
						
					},
					수정확인 : function(){
						if(this.original == true){
							if(updateIndex.length > 0){
								if(confirm("변경사항이 있습니다. 저장 하시겠습니까?")){
									this.전체업데이트();
								}else{
									this.새로고침();
									
								}
							}else{
								this.데이터가져오기();								
							}	
							updateIndex = [];
						}
						
					},
					새로고침 : function(){
						localStorage.setItem("page",this.검색조건.page);
						window.location.reload();
					}
			
				},
				
				watch : {
					'검색조건.page': function(){
						this.수정확인();						
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
