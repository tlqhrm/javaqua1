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
    <title>상품등록</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/product_regist.css">
</head>


<body>
<h1 style="text-align:center">상품등록</h1>
<detail id="detail"> 
    <section id="detailmain">
        <div id="detail">
         	<div id="bg1">
         		<div id="bg2">     
         			<img id="main_img" src="">                  
	            </div>
	            <div id="bg3">        
	            	<span class="prev_img" style="display:none"></span>     
	            	
	            	      
	            </div>
       		</div>
                <div id="name">
     				<div style="height:33px;"></div>
                    <form id="form1" action = "/product/productRegist" name = "contact_write" method = "POST" enctype = "multipart/form-data" class="form">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <input type="hidden" name="command" value="product_regist">
                    <input type="hidden" name="file_names1" id="file_names1" value="">
                    <input type="hidden" name="index" id="index" value="">
                    <input type="hidden" name="file_names2" id="file_names2" value="">
                    <textarea id="hidden" name="content" style="display:none"></textarea>
               	 	제품명 : <input type="text" name="title" size="50" style="height:20px;font-size:15px;">
                    <div id="tmain">
                   	
                        <table class="info">
                            <tr class="info">
                                <th class="info1">판매가</th>
                                <td ><input type="text" size="5" name="price" style="height:20px;font-size:15px;">원 &nbsp&nbsp
                                 	할인율 <input type="text" size="2" name="discount" value=0>% <span>&nbsp&nbsp&nbsp 할인 전 가격:<span></span></span></span> <br>&nbsp<br>
                                	<input class="check_ca1" type="checkbox" name="category1" value="new" data-ca1="${pvo.category1}">신상품
      								  <input class="check_ca1" type="checkbox" name="category1" value="sale">세일
       								  <input class="check_ca1" type="checkbox" name="category1" value="best">베스트
       							</td> 				
       	                    </tr>
                            <tr>
                                <th class="info2">분류</th>
                                <td class="info2">
                                <select name="category2" id="category2">
	                                <option value = "select" >선택해주세요</option>
				                    <option value = "랜덤 금붕어">랜덤 금붕어</option>
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
                                <td class="info3"><input type="text" size="2" name="stock">개</td>
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

                <div id="content_box" contentEditable="true" style="height:1000px; text-align:left; font-size: 15px; overflow:auto; border: solid 1px black; padding-left:5px;"><div id="placehloder" class="place_h" placeholder="내용을 입력하세요."></div></div>
                <div id="content_box2" contentEditable="true" style="display:none;"><div id="placehloder" class="place_h" placeholder="내용을 입력하세요."></div></div>
            </section>
            
		
        </div>
    </section>
</detail>
<span class="target"></span>
<script>


var sel_files = [];
var content_box = document.getElementById("content_box");
var content_box2 = document.getElementById("content_box2");
var files = document.getElementById("files");
var index=0;

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
});		
		
		



content_box.addEventListener("blur",function(){
	
});

document.getElementById("img_controll").addEventListener("click",function(){

});

document.getElementById("img_controll").addEventListener("click",function(){
	
});


files.addEventListener("change",handleImgFileSelect);
files.addEventListener("change",function(){
	//setTimeout($("#img_controll").trigger("click"),1000);
	setTimeout(function(){
		$("#img_controll").trigger("click");
		},1000);
});

var price = document.querySelector("#tmain > table > tbody > tr.info > td > input[type=text]:nth-child(1)");
var discount = document.querySelector("#tmain > table > tbody > tr.info > td > input[type=text]:nth-child(2)");
var price2 = document.querySelector("#tmain > table > tbody > tr.info > td > span > span");

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
		var fileName = guid()+(f.name.replace(/\s/gi,""));
		cnt++
		console.log(fileName);
		
		for(var i=0; i<sel_files.length; i++){
			if(sel_files[i].name === f.name){
				alert("같은파일은 업로드 할 수 없습니다.");
				return;
			}
		}
		sel_files.push(f);
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
		        	"<span class=\"controll_span_2\">&nbsp&nbsp"+f.name+"</span>"+
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
	sel_files.splice(index1, 1);

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
		let img_id = document.getElementsByClassName("img_id_"+i);
		img_id[1].childNodes[0].src = "/resources/upload/product/"+img_id[1].childNodes[0].dataset.file;	
	}
	document.getElementById("hidden").value = content_box2.innerHTML;
	document.getElementById("file_names1").value = "";
	document.getElementById("file_names2").value = "";
	for(var i=0; i<index; i++){
		document.getElementById("file_names1").value += document.getElementById("img_controll_id_"+i).dataset.file1 + ";";
		document.getElementById("file_names2").value += document.getElementById("img_controll_id_"+i).dataset.file2 + ";";

	}
	console.log(document.getElementById("file_names2").value);
	
	if($("#hidden").val()==null || $("#hidden").val() == ''){
		return false;
	}

	let form1 = document.getElementById("form1");

	let formData = new FormData(form1);

	for(let i=0, len=sel_files.length; i<len; i++){
		let name = "image_"+i;
		formData.append("files",sel_files[i]);		
		
	}
	formData.append("files_length",sel_files.length);
	
	$.ajax({
		url : "/product/productRegist",
		type : "post",
		data : formData,
		cache : false,
		contentType : false,
		beforeSend: function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
		},
		processData : false,
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
