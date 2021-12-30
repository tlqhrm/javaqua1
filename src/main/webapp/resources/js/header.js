$(function(){   
    var y_value = -16;         
    var ul_name = '#notice_list';
    var moving = function(){
        // if (y_value > (img_height)*($(''+ul_name+' li').length - 1)){
            y_value -= 16;
            $(ul_name).css('transition-duration', '0.2s');                  
            $(ul_name).css('transform','translate3d(0,'+y_value+'px,0)'); 
            if (y_value <= -96){
                setTimeout(function(){
                    y_value = 0
                $(ul_name).css('transition-duration', '0s'); 
                $(ul_name).css('transform','translate3d(0,'+y_value+'px,0)');     
                    },200);
            };                                  
        // };
    };
    var myVar = setInterval(moving,4000); 
    
    $(ul_name).hover(function(){
        clearInterval(myVar);
    },function(){               
        myVar = setInterval(moving,4000);
    });

    $(window).scroll(function(){
		
		if( $(window).scrollTop()>=140 ){
			$('#header3').addClass('add_fixed_140');
		}
		else{
			$('#header3').removeClass('add_fixed_140');			
		}
		
	});

    $(window).scroll(function(){
		
		if( $(window).scrollTop()>=200 ){
			$('#header4').css('position','fixed')
            $('#header4').css('top','60px')
		}
		else{
			$('#header4').css('position','absolute')
            $('#header4').css('top','200px')		
		}
		
	});

    $('#header .text_btn').keyup(function(){
        $(this).css('background-color','white');
        if($('#header .text_btn').val() != ""){
            $('#header .del_btn').css('visibility','visible')
        } else $('#header .del_btn').css('visibility','hidden')
        
    });
    $('#header .text_btn').focus(function(){
        $(this).css('background-color','white');
        if($('#header .text_btn').val() != ""){
            $('#header .del_btn').css('visibility','visible')
        };
    });
    $('#header .text_btn').blur(function(){
        $(this).css('background-color','rgb(247, 241, 241)'),
        $('#header .del_btn').css('visibility','hidden')

    });

    $('#header .del_btn').on('mousedown',function(){
        $('#header .text_btn').val('');      
    });
    

    $('#header .menu li').hover(function(){
        $(this).css('background-color','rgb(252, 245, 245)');
        $(this).find('a').css('color','rgb(3, 140, 232)');
        $(this).find('span').css('background-color','rgb(3, 140, 232)');
    },function(){
        $(this).css('background-color','rgb(3, 140, 232)');
        $(this).find('a').css('color','rgb(252, 245, 245)');
        $(this).find('span').css('background-color','rgb(252, 245, 245)');
    });
    $('#header #view_all').hover(function(){
        $('#view_all div').css('transform', 'rotate(90deg)')
        $(this).css('border-left', 'black 1px solid');
        $(this).css('border-top', 'black 1px solid');
        $(this).css('border-right', 'black 1px solid');
        $(this).css('border-bottom', 'rgb(252, 245, 245) 1px solid');
        $(this).css('height', '59px');
        $(this).css('transition-duration', '0s')
        $(this).css('width', '138px');
        

        $('#header #header4 ').css('visibility','visible');
        $('#header #header4 .h_menu').css('opacity','1');
    },function(){
        $(this).css('transition-duration', '0.2s')
        $('#view_all div').css('transform', 'rotate(0deg)');
        $(this).css('border', 'none');
        $('#header #header4 ').css('visibility','hidden');
        $(this).css('height', '60px');
        $('#header #header4 .h_menu').css('opacity','0');
        $(this).css('transition-duration', '0s')
        $(this).css('width', '140px');
    });

    $('#header4 .h_menu').hover(function(){
        $('#view_all div').css('transition-duration', '0s')
        $('#view_all div').css('transform', 'rotate(90deg)')
        $('#view_all').css('border-left', 'black 1px solid');
        $('#view_all').css('border-top', 'black 1px solid');
        $('#view_all').css('border-right', 'black 1px solid');
        $('#view_all').css('border-bottom', 'rgb(252, 245, 245) 1px solid');
        $('#view_all').css('height', '59px');
        $('#view_all').css('background-color','rgb(252, 245, 245)');
        $('#view_all').find('a').css('color','rgb(3, 140, 232)');
        $('#view_all').find('span').css('background-color','rgb(3, 140, 232)');
        $('#header #header4 ').css('visibility','visible');
        $('#header #header4 .h_menu').css('opacity','1');
        $('#view_all').css('width', '138px');
        
    },function(){
        $('#view_all div').css('transition-duration', '0.2s')
        $('#view_all div').css('transform', 'rotate(0deg)');
        $('#view_all').css('border', 'none');
        $('#header #header4 ').css('visibility','hidden');
        $('#view_all').css('height', '60px');
        $('#header #header4 .h_menu').css('opacity','0');
        $('#view_all').css('background-color','rgb(3, 140, 232)');
        $('#view_all').find('a').css('color','rgb(252, 245, 245)');
        $('#view_all').find('span').css('background-color','rgb(252, 245, 245)');
        $('#view_all').css('transition-duration', '0s')
        $('#view_all').css('width', '140px');
    });
   
    // $('#h_menu_gold').pa.hover(function(){
    //     $('#h_menu_gold').css('visibility','visible') 
    // },function(){
    //     $('#h_menu_gold').css('visibility','hidden');
    // })
    $('.h_menu li').hover(function(){
        $(this).css('color','black');
        $(this).css('background-color','rgb(228, 232, 238)')
        $(this).css('font-weight','600');
    },function(){
        $(this).css('color','rgb(43, 43, 43)');
        $(this).css('background-color','rgb(252, 245, 245)')
        $(this).css('font-weight','500');
    })
    
    $('#h_menu_gold').parent('li').hover(function(){
        $(this).css('color','black');
        $(this).css('background-color','rgb(228, 232, 238)')
        $(this).css('font-weight','600');
        $('#h_menu_gold li').css('font-weight','500');
        $('#h_menu_gold').css('visibility','visible')
    },function(){
        $(this).css('color','rgb(43, 43, 43)');
        $(this).css('background-color','rgb(252, 245, 245)')
        $(this).css('font-weight','500');
        $('#h_menu_gold').css('visibility','hidden');
    })
    
    $('#h_menu_gold li').hover(function(){
        $(this).css('color','black');
        $(this).css('background-color','rgb(228, 232, 238)')
        $(this).css('font-weight','600');
    },function(){
        $(this).css('color','rgb(43, 43, 43)');
        $(this).css('background-color','rgb(252, 245, 245)')
        $(this).css('font-weight','500');
    })
    $('#h_menu_beta').parent('li').hover(function(){
        $(this).css('color','black');
        $(this).css('background-color','rgb(228, 232, 238)')
        $(this).css('font-weight','600');
        $('#h_menu_beta li').css('font-weight','500');
        $('#h_menu_beta').css('visibility','visible')
    },function(){
        $(this).css('color','rgb(43, 43, 43)');
        $(this).css('background-color','rgb(252, 245, 245)')
        $(this).css('font-weight','500');
        $('#h_menu_beta').css('visibility','hidden');
    })
    
    $('#h_menu_beta li').hover(function(){
        $(this).css('color','black');
        $(this).css('background-color','rgb(228, 232, 238)')
        $(this).css('font-weight','600');
    },function(){
        $(this).css('color','rgb(43, 43, 43)');
        $(this).css('background-color','rgb(252, 245, 245)')
        $(this).css('font-weight','500');
    })
    $('#h_menu_shirimp').parent('li').hover(function(){
        $(this).css('color','black');
        $(this).css('background-color','rgb(228, 232, 238)')
        $(this).css('font-weight','600');
        $('#h_menu_shirimp li').css('font-weight','500');
        $('#h_menu_shirimp ').css('visibility','visible')
    },function(){
        $(this).css('color','rgb(43, 43, 43)');
        $(this).css('background-color','rgb(252, 245, 245)')
        $(this).css('font-weight','500');
        $('#h_menu_shirimp ').css('visibility','hidden');
    })
    
    $('#h_menu_shirimp li').hover(function(){
        $(this).css('color','black');
        $(this).css('background-color','rgb(228, 232, 238)')
        $(this).css('font-weight','600');
    },function(){f
        $(this).css('color','rgb(43, 43, 43)');
        $(this).css('background-color','rgb(252, 245, 245)')
        $(this).css('font-weight','500');
    })

    $('#consumer_center').hover(function(){
        $(this).find("ul").css('visibility','visible');
    }, function(){
        $(this).find("ul").css('visibility','hidden');
    })
    $('#consumer_center ul').hover()
    
    $('#mypage').hover(function(){
        $('#mypage').find("ul").css('visibility','visible');
    }, function(){
        $('#mypage').find("ul").css('visibility','hidden');
    })
    $('#mypage ul').hover()
});     

$(function(){   
    var y_value = 0;
    var img_height = 160;
    var ul_name = "#recent_ul";
    var count = 0;
	var cookieArr = [];
	
	(function () {
	    var theCookies = document.cookie.split(';');
	    for (var i = 1 ; i <= theCookies.length; i++) {
	        var pd_num = theCookies[i-1].split("=")[0];
	      
	        if(pd_num.includes("pd_num")){
	        	cookieArr.push(JSON.parse(Cookies.get(pd_num.replace(" ",""))));

	        }
	        
	    }
	    cookieArr.reverse();
	})();
	
	const v_recent = new Vue({
		el:"#recent_div_1",
		data:{
			cookieArr : cookieArr
		},
		methods:{
			품명 : function(t){
				return t.replace(/\+/gi," ");
			},
			상세페이지:function(pd_num){
				location.href ="/product/productDetail?pd_num="+pd_num;
			},
			위로 : function(){
				if(y_value != 0){
	            y_value +=img_height;
	            $(ul_name).css('transition-duration', '0.2s');
	            $(ul_name).css('transform','translate3d(0,'+y_value+'px,0)');
	            count--;
                }
            },
            아래로 : function(){
                if(cookieArr.length>3 && count < cookieArr.length-3){		
                    y_value -=img_height;
                   $(ul_name).css('transition-duration', '0.2s');
                   $(ul_name).css('transform','translate3d(0,'+y_value+'px,0)');
                   count++;
                }
            }
                      
        
			
		}
	})
	

	
	$("#recent_ul").css("height",cookieArr.length * 160);
	if(cookieArr.length > 3){
		$("#recent_div_1").css("height",(3*160) + 91);
	}else if(cookieArr.length == 0){
        $("#recent_div_1").css("height",111);
    }
    else{
		$("#recent_div_1").css("height",(cookieArr.length*160) + 92);
	}
	if(cookieArr.length > 3){
		$("#recent_div_2").css("height",(3*160) + 91);
	}else{
		$("#recent_div_2").css("height",(cookieArr.length*160) -1);
	}
	if(cookieArr.length > 3){
		$("#recent_div_1-2").css("height",(3*160)-5);
	}else{
		$("#recent_div_1-2").css("height",(cookieArr.length*160)-5);
	}


});
