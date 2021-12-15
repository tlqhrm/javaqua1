
var sel_files = [];
var content_box = document.getElementById("content_box");
var files = document.getElementById("files");
var index=0;

console.log(document.getElementsByClassName('prev_img'));

content_box.addEventListener("blur",function(){
	document.getElementById("hidden").value = content_box.innerHTML;
	console.log(document.getElementById("hidden").value);
	console.log("3");
});

files.addEventListener("change",handleImgFileSelect);


function fileUploadAction(){	
	
	files.value='';	
	console.log(files.files); 
	console.log("fileUploadAction");
	$("#files").trigger("click");
}



function handleImgFileSelect(e){
	
	console.log("handleImgFileSelect");
	console.log(files.files); 
	
	var filesArr = Array.prototype.slice.call(files.files);
	console.log("filesArr.length" + filesArr.length);

	
	filesArr.forEach(function(f) {

		sel_files.push(f);
		var html;
		var reader = new FileReader();
		reader.onload = function(e){
					
			if(index <5){
				html = "<span class=\"prev_img\" id=\"prev_img_id_"+index+"\" style=\"width:78px; height:78px; display:inline-block; border:1px solid gray\"><img src=\""+e.target.result+"\" data-file=\""+f.name+"\" class=\"selProductFile\" style=\"\"></span>";
				document.getElementById("bg3").innerHTML = document.getElementById("bg3").innerHTML + html;	

			}else {
				html = "<span class=\"prev_img\" id=\"prev_img_id_"+index+"\" style=\"width:78px; height:78px; border:1px solid gray; display:none;\"><img src=\""+e.target.result+"\" data-file=\""+f.name+"\" class=\"selProductFile\"  style=\"\"></span>";
				document.getElementById("bg3").innerHTML = document.getElementById("bg3").innerHTML + html;	

			}
			
			html = "<div id=\"img_id_"+index+"\" style=\"\"><img src=\""+e.target.result+"\" data-file=\""+f.name+"\" class=\"selProductFile\" title=\"Click to remove\" style=\"width:900px;\"></div>";
			content_box.innerHTML = content_box.innerHTML + html;	
			
			html = "<div class=\"controll_div\" id=\"img_controll_id_"+index+"\">"+
		        	"<span class=\"controll_span_1\"><img src=\""+e.target.result+"\" data-file=\""+f.name+"\" class=\"selProductFile\" title=\"Click to remove\" style=\"max-width:73px; max-height:73px;\"></span>"+
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
		
		
		
		console.log(index);
		console.log(sel_files);
	});
	
	
}

function deleteImageAction(index1){
	console.log("index : " +index);
	console.log("index1 : " +index1);
	
	
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
	console.log("index : " + index + " : after");
	

	console.log(files.files); 
	console.log(sel_files);
	
	
}

function submitAction(){
	let form1 = document.getElementById("form1");

	let formData = new FormData(form1);

	for(let i=0, len=sel_files.length; i<len; i++){
		let name = "image_"+i;
		formData.append("files",sel_files[i]);		
	}
	formData.append("files_length",sel_files.length);

	let xhr = new XMLHttpRequest();
	xhr.open("POST","JavaquaServlet");
	xhr.onload = function(e){
		if(this.status == 200){
			console.log("Result : " + e.currentTarget.responseText);
		}
	}
	xhr.send(formData);
}

