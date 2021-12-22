<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="images/로고/자바쿠아 아이콘.jpg" rel="shortcut icon" type="/resources/image/x-icon">  
    <title>JavaQua</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="/resources/css/product_regist.css">
</head>

<body>

     <!---header-->
        <jsp:include page="header.jsp"></jsp:include>
        <!--//header-->


<body>
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
                    
                    <input type="hidden" name="command" value="product_update">
                    <input type="hidden" name="pd_num" value="${pvo.pd_num }">
                    <input type="hidden" name="file_names1" id="file_names1" value="">
                    <input type="hidden" name="index" id="index" value="">
                    <input type="hidden" name="file_names2" id="file_names2" value="">
                    <textarea id="hidden" name="content" style="display:none">${pvo.content }</textarea>
                    <span id="hidden2" style="display:none;">${pvo.content2 }</span>
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
				                    <option value = "랜덤베타">랜덤베타</option>
				                    <option value = "실물베타">실물베타</option>
				                    <option value = "야생베타">야생베타</option>
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
						        	<span class="controll_span_2">&nbsp;&nbsp;${file }</span>
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

                <div id="content_box" contentEditable="true" style="height:1000px; text-align:left; font-size: 15px; overflow:auto; border: solid 1px black; padding-left:5px;">${pvo.content}</div>
            </section>
            
		
        </div>
    </section>
</detail>
<span class="target"></span>
<script>

var sel_files = [];
var sel_files2 = [];
var content_box = document.getElementById("content_box");
var files = document.getElementById("files");
var index=document.getElementsByClassName("controll_div").length;


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
	var first_text = $(".first_text");
//	first_text.innerHTML = "<xmp class=\"first_text\" style=\"display:none\"></xmp>";
	
	first_text.after("<xmp class=\"first_text\" style=\"display:none;\"></xmp>");
	
	var modicon = [];
	modicon = document.getElementById("hidden").value.split("<span id=\"split\"></span>");

	
	for(var i=0; i<index; i++){
		console.log(modicon[0]);
		console.log(modicon[1]);
		console.log(modicon.length);
		document.querySelector("#img_id_"+i+" > span").innerHTML += "<xmp id='xmp_"+i+"'>" +modicon[i+1] + "<span id=\"split\"></span></xmp>";
	}

	
	$(document).keydown(function(e){
		var backspace = 8;
	    
	    if (e.keyCode == backspace) {
	    	console.log($('#hidden').val());
	    	console.log(content_box.textContent);
	    	console.log($('#hidden2').val());
	    	var selection = window.getSelection();
	    	alert(selection.anchorNode.previousSibling.nodeName +"\n"+ selection.anchorOffset);
	    	// INPUT, TEXTAREA, SELECT 가 아닌곳에서 backspace 키 누른경우  
	    	if(selection.anchorNode.previousSibling.nodeName == "SPAN" && selection.anchorOffset == 0){
	    		e.stopPropagation();
	    		e.preventDefault();	    		
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
	
	document.getElementById("file_names1").value = "";
	document.getElementById("file_names2").value = "";
	for(var i=0; i<index; i++){
		document.getElementById("file_names1").value += document.getElementById("img_controll_id_"+i).dataset.file1 + ";";
		document.getElementById("file_names2").value += document.getElementById("img_controll_id_"+i).dataset.file2 + ";";
	}
});		
		
		
		


content_box.addEventListener("blur",function(){
	document.getElementById("hidden").value = content_box.textContent;
	document.getElementById("hidden2").value = content_box.innerHTML;
});

document.getElementById("img_controll").addEventListener("click",function(){
	document.getElementById("hidden").value = content_box.textContent;
});

document.getElementById("img_controll").addEventListener("click",function(){
	document.getElementById("file_names1").value = "";
	document.getElementById("file_names2").value = "";
	for(var i=0; i<index; i++){
		document.getElementById("file_names1").value += document.getElementById("img_controll_id_"+i).dataset.file1 + ";";
		document.getElementById("file_names2").value += document.getElementById("img_controll_id_"+i).dataset.file2 + ";";
	}
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
	price2.innerText = (parseInt(price.value) + (parseInt(price.value) * parseInt(discount.value)) / 100)+"원" ;
});
discount.addEventListener("change",function(){
	price2.innerText = (parseInt(price.value) + (parseInt(price.value) * parseInt(discount.value)) / 100)+"원" ;
});


function fileUploadAction(){	
	
	files.value='';	
	$("#files").trigger("click");
}

var cnt=0;

function handleImgFileSelect(e){
	
	/*
	var first_text = $(".first_text");
	
	first_text[1].innerHTML = "<span class=\"first_text\">"+first_text[0].innerHTML;
	first_text[1].after("<xmp class=\"first_text\" style=\"display:none;\"></xmp>");
	
	first_text[0].innerHTML = "";
	document.getElementById("hidden").value = content_box.textContent;
	
	console.log(first_text[1].innerHTML);
	console.log(first_text[1].text);
	console.log(first_text[1].textContent);
	console.log(first_text[1].innerText);
	console.log($("#hidden").val());
	console.log(content_box.textContent);
	*/
	
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
			var text = "<div id=\"img_id_"+index+"\"><img src=\"/resources/upload/product/"+fileName+"\" style='max-width:900px; display:block'><span style=\"display:none\"></span><div class=\"place_h\" placeholder=\"내용을 입력하세요.\" style=\"font-size:20px;\"></div></div><span id=\"split\"></span>";
			
		//	html = "<div id=\"img_id_"+index+"\" style=\"\"><img src=\""+e.target.result+"\" data-file=\""+f.name+"\" class=\"selProductFile\" title=\"Click to remove\" style=\"max-width:900px; display:block;\"><span style=\"display:none\"><xmp>"+text+"<br></xmp></span></div><div>&nbsp</div>";
		//	html = "<input type=\"image\" src=\""+e.target.result+"\" data-file=\""+f.name+"\" class=\"selProductFile\" readonly width=\"900px\"><br><span style=\"display:none\">"+f.name+"</span><div placeholder=\"여기에 글자를 입력해주세요.\" style=\"font-size:12px;\"></div>"
		//	html = "<img src=\""+e.target.result+"\" data-file=\""+f.name+"\" class=\"selProductFile\" width=\"900px\">"
		//	html = "<div id=\"img_id_"+index+"\" style=\"background-image:url(\""+e.target.result+"\"); background-repeat:no-repeat; background-size:cover;\"><span style=\"display:none\">"+f.name+"</span></div><div><br></div>";
			html = "<div id=\"img_id_"+index+"\"><img  src=\""+e.target.result+"\" data-file=\""+fileName+"\" class=\"selProductFile\" title=\"Click to remove\" style=\"max-width:900px; display:block;\"><span style=\"display:none\"><xmp id='xmp_"+index+"'>"+text+"</xmp></span><div class=\"place_h\" placeholder=\"내용을 입력하세요.\"></div></div>";
			content_box.innerHTML = content_box.innerHTML + html;	
			
			
			
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
		}
		reader.readAsDataURL(f);	

	});
	
	
}

function deleteImageAction(index1){

	sel_files.splice(index1, 1);

	var img_id = "#img_id_"+index1;
	$(img_id).remove();
	var prev_img_id = "#prev_img_id_"+index1;
	$(prev_img_id).remove();
	var img_controll_id = "#img_controll_id_"+index1;
	$(img_controll_id).remove();
	for( var i = index1+1; i < index; i++ ){
		document.getElementById("removeImg_"+i).setAttribute("onClick", "deleteImageAction("+(i-1)+")");
		document.getElementById("removeImg_"+i).id = "removeImg_"+(i-1);
		
		document.getElementById("img_id_"+i).id = "img_id_"+(i-1);
		
		document.getElementById("prev_img_id_"+i).id = "prev_img_id_"+(i-1);
		document.getElementById("xmp_"+i).innerText = document.getElementById("xmp_"+i).innerText.replace("img_id_"+i,"img_id_"+(i-1));
		document.getElementById("xmp_"+i).id = "xmp_"+(i-1);
		
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
	if($("#hidden").val()==null || $("#hidden").val() == ''){
		alert("내용을 입력해 주세요.");
		return false;
	}
	
	var first_text = $(".first_text");
	
	first_text[1].innerHTML = "<span class=\"first_text\">"+first_text[0].innerHTML+"</span>";

	
	first_text[0].innerHTML = "";
	document.getElementById("hidden").value = content_box.textContent;		
	
	
	let form1 = document.getElementById("form1");

	let formData = new FormData(form1);

	for(let i=0; i<sel_files.length ; i++){
		formData.append("files",sel_files[i]);		
		
	}
	for(let i=0; i<sel_files2.length; i++){
		formData.append("files2",sel_files2[i]);		
		
	}
	formData.append("files_length",sel_files.length);
	
	$.ajax({
		url : "/product/productUpdate",
		type : "post",
		data : formData,
		cache : false,
		contentType : false,
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

<!-- 푸터 -->

<jsp:include page="footer.jsp"></jsp:include>

</html>
