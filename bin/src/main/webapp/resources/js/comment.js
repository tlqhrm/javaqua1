function delete_Check(){
	return confirm("정말 삭제 하시겠습니까?");
}

var comment_origin = new Array;
var btn_origin = new Array;
var row1;

function commentReg(board_writer, bd_num, bd_category2, comment_writer){
	const comment = document.getElementById("input_comment").value;
	console.log(comment);
	
	$.ajax({
		type:'post',
		url:'/commentRegist',
		datatype:'text',
		data:{user_id : comment_writer,
			  bd_num : bd_num,
			  bd_category2 : bd_category2,
			  comment : comment },
		success: function(data){
			console.log(data);
			if(data ==='OK'){
				const tbody = document.getElementById("content_body");
				const newRow = tbody.insertRow();
				const newCell1 = newRow.insertCell(0);
				  const newCell2 = newRow.insertCell(1);
				  const newCell3 = newRow.insertCell(2);
				  const button1 = document.createElement("button");
					  button1.innerText = "수정";	
				  const button2 = document.createElement("button");
					  button2.innerText = "삭제";
				const div = document.createElement("div");

				const today = new Date();
				let time = today.toLocaleTimeString();

				if(time.substring(4,5) === ":"){
					time = time.substring(0,3)+'0'+time.substring(3,time.length);
				} 
				
				const now = today.toLocaleDateString() +" "+time;
				
				if(comment_writer === board_writer){
					newCell1.innerHTML = "<b>"+comment_writer+"<br>\n(글쓴이)</b>";
				}else{
					newCell1.innerHTML = "<b>"+comment_writer+"</b>";
				}
				
				
				newCell2.append(div);
				newCell3.append(button1, button2);
				
				newRow.className = "comment";
				
				document.getElementById("input_comment").value = "";
				
				const top = newRow.offsetTop;
				
				window.scrollTo({top:top, behavior:'smooth'});
				
				const comment_count = document.getElementById("comment_count");
				const num = parseInt(comment_count.innerText.substring(3,comment_count.innerText.length-1)) + 1;
				comment_count.innerText = "댓글("+num+")";
				
				newCell2.id = 'comment'+num; 
				  newCell3.id = "Btn"+num;
				div.innerHTML = now +"<br><pre id='comment_text"+num+"' style='font-size:17px;'><b>"+comment+"</b></pre>";
				
				button1.addEventListener("click", function() {
						updateComment(num);
					  });
				button2.addEventListener("click", function() {
						deleteComment(num);
					  });
				
				
				
			}else{
				alert("내용을 입력하세요.");
			}
		},
		error: function(data, textStatus){
			console.log('error');
		}
	});
}


function updateComment(row, re_num, bd_num , bd_category2){
	let comment = document.getElementById("comment"+row);
	comment_origin[row] = comment.innerHTML;
	console.log(1);
	row1 = row;
	
	let	comment_text = document.getElementById("comment_text"+row);
	let text1 = comment_text.innerText;

	let btn = document.getElementById("btn"+row);
	btn_origin[row] = "<button onClick=\"updateComment("+row+","+re_num+","+bd_num+",\'"+bd_category2+"\')\">수정</button><button onClick=\"deleteComment("+row+","+re_num+","+bd_num+",\'"+bd_category2+"\')\">삭제</button></td>";
	
	comment.innerHTML = "<textarea id=\'update_comment"+row+"\' name = 'comment' rows='4' cols = '80' required style='max-width:fit-content; margin-top:5px; resize:none;'>"+text1+"</textarea>";
	btn.innerHTML = "<button onClick=\"updateReg("+row+","+re_num+","+bd_num+",\'"+bd_category2+"\')\">등록</button><button onClick=\"updateCancle("+row+","+re_num+","+bd_num+",\'"+bd_category2+"\')\">취소</button>";

	let box = document.getElementById("update_comment");
	
	comment = document.getElementById("comment"+row);
	let tr = comment.parentNode;
	
	box.focus();
	

}

function updateCancle(row){
	let comment = document.getElementById("comment"+row);	
	comment.innerHTML = comment_origin[row];
	
	let btn = document.getElementById("btn"+row);
	btn.innerHTML = btn_origin[row];
}

function deleteComment(row,re_num,bd_num,bd_category2){
	if(confirm("정말 삭제 하시겠습니까?")){
		let box = document.getElementById("comment"+row);
		
		let tr = box.parentNode
		
		
		$.ajax({
			type:'post',
			url:'/commentDelete',
			datatype:'text',
			data:{re_num : re_num,
				  bd_num : bd_num,
				  bd_category2 : bd_category2},
			success: function(data){
				console.log(data);
				if(data ==='OK'){
					tr.innerHTML="";
					
					const comment_count = document.getElementById("comment_count");
					const num = parseInt(comment_count.innerText.substring(3,comment_count.innerText.length-1)) - 1;
					comment_count.innerText = "댓글("+num+")";
					
				}else{
					alert("삭제 실패.");
				}
			},
			error: function(data, textStatus){
				console.log('error');
			}
		});
	}else{
		return;
	}
}



function updateReg(row,re_num,bd_num,bd_category2){
	

	let box = document.getElementById("update_comment"+row);
	let comment = box.value;
	
	let tr = box.parentNode.parentNode;
	
	
	$.ajax({
		type:'post',
		url:'/commentUpdate',
		datatype:'text',
		data:{re_num : re_num,
			  comment : comment,
			  bd_num : bd_num,
			  bd_category2 : bd_category2},
		success: function(data){
			console.log(data);
			if(data ==='OK'){
				const today = new Date();
				let time = today.toLocaleTimeString();

				if(time.substring(4,5) === ":"){
					time = time.substring(0,3)+'0'+time.substring(3,time.length);
				} 			
				const now = today.toLocaleDateString() +" "+time;	
									
				let box = document.getElementById("update_comment"+row);
				let comment = box.value;
				
				let text = document.getElementById("comment"+row);	
				text.innerHTML = "<div>(수정됨) "+now+"<br><pre id='comment_text"+row+"' style='font-size:17px;'><b>"+comment+"</b></pre><div>";
				
				
				let btn = document.getElementById("btn"+row);
				btn.innerHTML = btn_origin[row];
				
				console.log("성공");
				
			}else{
				alert("등록 실패.");
			}
		},
		error: function(data, textStatus){
			console.log('error');
		}
	});

	
}