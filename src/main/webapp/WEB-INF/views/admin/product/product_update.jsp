<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/resources/images/로고/자바쿠아 아이콘.jpg" rel="shortcut icon" type="image/x-icon">
    <title>상품수정</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="/resources/css/product_regist.css">
</head>

<body>
<h1 style="text-align:center">상품수정</h1>
<detail id="detail"> 
    <section id="detailmain">
        <div id="detail">
         	<div id="bg1">
         		<div id="bg2">     
         			<img id="main_img" src="">                  
	            </div>
	            <div id="bg3">        
	            	<span class="prev_img" style="display:none"></span> 
	            	<c:forEach items="${pvo.file1Arr}" var="file" varStatus="i">   
	            	    <c:if test="${i.index < 5 }">                                                      
                    	<span class="prev_img" id="prev_img_id_${i.index }" style="width:70px; height:70px; display:inline-block; border:1px solid gray">
	            			<img src="/resources/upload/product/${file }" data-file="${file }" class="selProductFile" style="">
	            		</span> 
	            		</c:if>
	            		<c:if test="${i.index >= 5 }">                                                      
                    	<span class="prev_img" id="prev_img_id_${i.index }" style="width:70px; height:70px; display:inline-block; border:1px solid gray; display:none;">
	            			<img src="/resources/upload/product/${file }" data-file="${file }" class="selProductFile" style="">
	            		</span> 
	            		</c:if>
			        </c:forEach>   
	            	              
	            </div>
       		</div>
                <div id="name">
                <div style="height:33px;"></div>
                    <form id="form1" action = "JavaquaServlet" name = "contact_write" method = "POST" enctype = "multipart/form-data" class="form">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    
                    <input type="hidden" name="command" value="product_update">
                    <input type="hidden" name="pd_num" value="${pvo.pd_num }">
                    <input type="hidden" name="file_names1" id="file_names1" value="">
                    <input type="hidden" name="index" id="index" value="">
                    <input type="hidden" name="file_names2" id="file_names2" value="">
                    <textarea id="hidden" name="content" style="display:none">${pvo.content }</textarea>
                   
               	 	제품명 : <input type="text" name="title" size="50" style="height:20px;font-size:15px;" value="${pvo.title }">
                    <div id="tmain">
                   	
                        <table class="info">
                            <tr class="info">
                                <th class="info1">판매가</th>
                                <td ><input type="text" size="5" name="price" style="height:20px;font-size:15px;" value="${pvo.price }">원 &nbsp&nbsp
                                 	할인율 <input type="text" size="2" name="discount" value="${pvo.discount }">% <span>&nbsp&nbsp&nbsp 할인 전 가격:<span></span></span></span> <br>&nbsp<br>
                                	  <input class="check_ca1" type="checkbox" name="category1" value="new" data-ca1="${pvo.category1}">신상품
      								  <input class="check_ca1" type="checkbox" name="category1" value="sale">세일
       								  <input class="check_ca1" type="checkbox" name="category1" value="best">베스트
       							</td> 				
       	                    </tr>
                            <tr>
                                <th class="info2">카테고리</th>
                                <td class="info2">
                                <select name="category2" id="category2" data-ca2="${pvo.category2 }">
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
                            </tr>
                            <tr>
                                <th class="info3">재고</th>
                                <td class="info3"><input type="text" size="2" name="stock" value="${pvo.stock }">개</td>
                            </tr>
                   	
                            <tr>
                            	<th></th>
                            	<td style="border-bottom: none;">
                            		<button type="button"  onClick="fileUploadAction();">이미지 등록</button>
                            		
                            	</td>
                            </tr>
                            <tr>
                                <th class="info4" style="width:80px;">이미지</th>
                                <td class="info4" id="img_controll" style="overflow:scroll;width:490px; height:300px; vertical-align: top; display:inline-block;">
                                <c:forEach items="${pvo.file1Arr}" var="file" varStatus="i">                                                             
                             		<div class="controll_div" id="img_controll_id_${i.index }" data-file1="${file }" data-file2="${file }">
						        	<span class="controll_span_1"><img src="/resources/upload/product/${file }" data-file="${file }" class="selProductFile" title="Click to remove" style="max-width:73px; max-height:73px;\"></span>
						        	<span class="controll_span_2">${file }</span>
						        	<span class="controll_span_3"><button type="button" onClick="deleteImageAction(${i.index})" id="removeImg_${i.index }" style="cursor:not-allowed">삭제</button></span>
						        	</div>
						        </c:forEach>
                                </td>
                            </tr>
                        </table>
                        
                    </div>
                    
                    
					</form>
                </div>
                
                <input id="files" multiple="multiple" type="file" name="files[]" accept="image/*" style="display:none;"/>
                <div class="clear"></div>

                <!-- 제품상세섹션 -->
			<p><br><br><br><br><br><br><br></p><button id="submit" onClick="submitAction()"style="float:right; width:80px; height:50px">등록</button>
            <section><hr>
            	<h2><br>-----------------------본문 입력-------------------------</h2><Br><hr>

                <div id="content_box" contentEditable="true" style="height:1000px; text-align:left; font-size: 15px; overflow:auto; border: solid 1px black; padding-left:5px;">${pvo.content }</div>
                <div id="content_box2" contentEditable="true" style="display:none;"></div>
            </section>
            
		
        </div>
    </section>
</detail>
<span class="target"></span>
<script>

var sel_files = [];
var sel_files2 = [];
var deleted_files = [];
var content_box = document.getElementById("content_box");
var content_box2 = document.getElementById("content_box2");
var files = document.getElementById("files");
var index=document.getElementsByClassName("controll_div").length;

var price = document.querySelector("#tmain > table > tbody > tr.info > td > input[type=text]:nth-child(1)");
var discount = document.querySelector("#tmain > table > tbody > tr.info > td > input[type=text]:nth-child(2)");
var price2 = document.querySelector("#tmain > table > tbody > tr.info > td > span > span");

var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";

function guid() {
	  function _s4() {
	    return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
	  }
	  return _s4() + _s4() + '-' + _s4() + '-' + _s4() + '-' + _s4() + '-' + _s4() + _s4() + _s4();
}

document.addEventListener('keydown', event => {
	  if (event.key === 'Enter') {
	    document.execCommand('insertLineBreak')
	    event.preventDefault()
	  }
	})


$(document).ready(function(){
	content_box2.innerHTML = content_box.innerHTML;
	
	$(document).keydown(function(e){
		var backspace = 8;
	    
	    if (e.keyCode == backspace) {
	    	var selection = window.getSelection();
	    	//alert(selection.focusNode.firstChild.nodeName +"\n"+ selection.anchorOffset);
	    	// INPUT, TEXTAREA, SELECT 가 아닌곳에서 backspace 키 누른경우  
	    	try{
		    	if(selection.anchorNode.previousSibling.nodeName == "SPAN" && selection.anchorOffset == 0){
		    		e.stopPropagation();
		    		e.preventDefault();	    		
		    	}else if(selection.focusNode.firstChild.nodeName == "IMG" && selection.anchorOffset == 1){
		    		e.stopPropagation();
		    		e.preventDefault();	    		
		    	}
		    }catch(e){
		    	
		    }
	    }
	});
	

	
	$("#main_img").attr("src",$("#prev_img_id_0 > img").attr("src"));

	for(var i=0; i<index; i++){
		var f = document.querySelector("#prev_img_id_"+i+" > img").getAttribute('data-file');
		
		sel_files.push(f+";");
	}
	
	var ca2 = document.querySelector("#category2").getAttribute('data-ca2');
	$('#category2').val(ca2).prop("selected",true);
	var ca1 = [];
	var check_ca1 = document.getElementsByClassName("check_ca1");
	var ca1 = check_ca1[0].getAttribute("data-ca1").split(";");
	for(var i=0; i<ca1.length; i++){
		if(ca1[i] === "new"){			
			check_ca1[0].checked = true;
		}else if(ca1[i] === "sale"){
			check_ca1[1].checked = true;
		}else if(ca1[i] === "best"){
			check_ca1[2].checked = true;
		}
	}

	price2.innerText = Math.ceil(((parseInt(price.value) / (1 - ((parseInt(discount.value)) / 100)))))+"원" ;
});		
		
		
		







files.addEventListener("change",handleImgFileSelect);
files.addEventListener("change",function(){
	//setTimeout($("#img_controll").trigger("click"),1000);
	setTimeout(function(){
		$("#img_controll").trigger("click");
		},1000);
});



price.addEventListener("change",function(){
	price2.innerText = Math.ceil(((parseInt(price.value) / (1 - ((parseInt(discount.value)) / 100)))))+"원" ;
});
discount.addEventListener("change",function(){
	price2.innerText = Math.ceil(((parseInt(price.value) / (1 - ((parseInt(discount.value)) / 100)))))+"원" ;
});


function fileUploadAction(){	
	
	files.value='';	
	$("#files").trigger("click");
}

var cnt=0;

function handleImgFileSelect(e){


	var filesArr = Array.prototype.slice.call(files.files);

	filesArr.forEach(function(f) {
		var nameArr = f.name.split(".");
		var date1 = new Date();
		var fileName = guid()+f.name;  
		cnt++

		for(var i=0; i<sel_files.length; i++){
			if(sel_files[i].name === f.name){
				alert("같은파일은 업로드 할 수 없습니다.");
				return;
			}
		} 
		sel_files2.push(f);
		var html;
		var reader = new FileReader();
		reader.onload = function(e){
					
			if(index <5){
				html = "<span class=\"prev_img\" id=\"prev_img_id_"+index+"\" style=\"width:78px; height:78px; display:inline-block; border:1px solid gray\"><img src=\""+e.target.result+"\" data-file=\""+fileName+"\" class=\"selProductFile\" style=\"\"></span>";
				document.getElementById("bg3").innerHTML = document.getElementById("bg3").innerHTML + html;	

			}else {
				html = "<span class=\"prev_img\" id=\"prev_img_id_"+index+"\" style=\"width:78px; height:78px; border:1px solid gray; display:none;\"><img src=\""+e.target.result+"\" data-file=\""+fileName+"\" class=\"selProductFile\"  style=\"\"></span>";
				document.getElementById("bg3").innerHTML = document.getElementById("bg3").innerHTML + html;	

			}
			html = "<div class=\"img_id_"+index+"\"><img src=\""+e.target.result+"\" data-file=\""+fileName+"\" class=\"selProductFile\" title=\"Click to remove\" style=\"max-width:900px; display:block;\"><span style=\"display:none\"></span><div class=\"place_h\" placeholder=\"내용을 입력하세요.\"></div></div>";
			content_box.innerHTML += html;
			content_box2.innerHTML += html;
			
			html = "<div class=\"controll_div\" id=\"img_controll_id_"+index+"\" data-file1=\""+f.name+"\" data-file2=\""+fileName+"\">"+
		        	"<span class=\"controll_span_1\"><img src=\""+e.target.result+"\" data-file=\""+fileName+"\" class=\"selProductFile\" title=\"Click to remove\" style=\"max-width:73px; max-height:73px;\"></span>"+
		        	"<span class=\"controll_span_2\">"+f.name+"</span>"+
		        	"<span class=\"controll_span_3\"><button type=\"button\" onClick=\"deleteImageAction("+index+")\" id=\"removeImg_"+index+"\" style=\"cursor:not-allowed\">삭제</button></span>"+
		        	"</div>";
		    document.getElementById("img_controll").innerHTML = document.getElementById("img_controll").innerHTML + html;  
		    if(index == 0){
		   		$("#main_img").attr("src",$("#prev_img_id_0 > img").attr("src"));
		    }
			index++;	
			console.log("after index"+index);
		}
		reader.readAsDataURL(f);	
		
		
		
	});
	
	
}

function deleteImageAction(index1){

	console.log("before index"+index);
	console.log("before index1"+index1);
	
	if(index1 < sel_files.length){
		//console.log("if");
		if(sel_files.length > 0 ){			
			let sp = sel_files.splice(index1, 1);
			//console.log("sp: "+sp);
			sp = sp[0].replace(";",'');
			deleted_files.push(sp);
			}
	}else{
		//console.log("else");
		var img_name = document.getElementsByClassName("controll_span_2");
		for(i=0; i<sel_files2.length; i++){
			//console.log(sel_files2[i].name);
			//console.log(img_name[index1].innerText);
			if(sel_files2[i].name == img_name[index1].innerText ){
				//console.log("ok");
				sel_files2.splice(i, 1);
			}
		}
	}

	var img_id = ".img_id_"+index1;
	$(img_id).remove();
	var prev_img_id = "#prev_img_id_"+index1;
	$(prev_img_id).remove();
	var img_controll_id = "#img_controll_id_"+index1;
	$(img_controll_id).remove();
	for( var i = index1+1; i < index; i++ ){
		document.getElementById("removeImg_"+i).setAttribute("onClick", "deleteImageAction("+(i-1)+")");
		document.getElementById("removeImg_"+i).id = "removeImg_"+(i-1);
		document.getElementById("prev_img_id_"+i).id = "prev_img_id_"+(i-1);

		let img_id_i = document.getElementsByClassName("img_id_"+i);
		img_id_i[0].className = "img_id_"+(i-1);
		document.getElementById("img_controll_id_"+i).id = "img_controll_id_"+(i-1);
		
		
	}
	if(index1 < 5 && index > 5){
		document.getElementById("prev_img_id_"+4).style.display = 'inline-block';
	}
	
	index--;
	
	if(index1 == 0){
   		$("#main_img").attr("src",$("#prev_img_id_0 > img").attr("src"));   
	}
	if(index == 0){
   		$("#main_img").attr("src","");   
	}

}

function submitAction(){
	
	
	if($("input[name=title]").val()==null || $("input[name=title]").val() == ''){
		alert("제목을 입력해 주세요.");
		return false;
	}
	if($("input[name=price]").val()==null || $("input[name=price]").val() == ''){
		alert("가격을 입력해 주세요.");
		return false;
	}
	if($("#category2").val()=='select'){
		alert("카테고리를 선택해 주세요.");
		return false;
	}
	if($("input[name=stock]").val()==null || $("input[name=stock]").val() == ''){
		alert("재고를 입력해 주세요.");
		return false;
	}

	
	content_box2.innerHTML = content_box.innerHTML;
	
	for(var i=0; i<index; i++){
		console.log(index);
		console.log(document.getElementsByClassName("img_id_0")[0]);
		console.log(document.getElementsByClassName("img_id_0")[1]);
		console.log(document.getElementsByClassName("img_id_0")[0].childNodes[0]);
		console.log(document.getElementsByClassName("img_id_0")[1].childNodes[0]);
		let img_id = document.getElementsByClassName("img_id_"+i);
		img_id[1].childNodes[0].src = "/resources/upload/product/"+img_id[1].childNodes[0].dataset.file;	
	}
	
	document.getElementById("hidden").value = content_box.innerHTML;
	
	document.getElementById("file_names1").value = "";
	document.getElementById("file_names2").value = "";
	for(var i=0; i<index; i++){
		document.getElementById("file_names2").value += document.getElementById("img_controll_id_"+i).dataset.file2 + ";";

	}
	
	console.log(document.getElementById("file_names2").value);
	
	

	let form1 = document.getElementById("form1");

	let formData = new FormData(form1);

	for(let i=0; i<sel_files.length ; i++){
		formData.append("files",sel_files[i]);		
		
	}
	for(let i=0; i<sel_files2.length; i++){
		formData.append("files2",sel_files2[i]);			
	}
	for(let i=0; i<deleted_files.length; i++){
		formData.append("deleted_files",deleted_files[i]);			
	}
	formData.append("files_length",sel_files.length);
	
	$.ajax({
		url : "/product/productUpdate",
		type : "post",
		data : formData,
		cache : false,
		contentType : false,
		processData : false,
		beforeSend: function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
		},
		dataType: "text",
		success : function(data){
			location.href = "/product/productDetail?pd_num="+data;
			console.log(data);
		},
		error : function(data){
			console.log("send formData error.");
		}
		
	})
}



</script>
</body>

</html>
