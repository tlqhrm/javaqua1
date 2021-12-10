$(function(){   
    var y_value = -350;         
    var count = 0;
    var ul_name = '#second_banner';
    var img_height = 350;
    var li_length = $(''+ul_name+' li').length;
    var moving = function(){
        if (y_value > (-350)*($(''+ul_name+' li').length - 1)){
            y_value -= 350;
            $(ul_name).css('transition-duration', '0.3s');                  
            $(ul_name).css('transform','translate3d(0,'+y_value+'px,0)'); 
            if (y_value <= (-350)*($(''+ul_name+' li').length - 1)){
                setTimeout(function(){
                    y_value = -350
                $(ul_name).css('transition-duration', '0s'); 
                $(ul_name).css('transform','translate3d(0,'+y_value+'px,0)');     
                    },300)
            }                                     
        } 
        else{
            y_value = -1050;
            $(ul_name).css('transition-duration', '0s'); 
            $(ul_name).css('transform','translate3d(0,'+y_value+'px,0)');
            setTimeout(moving,10);                        
        }
        if (y_value < (-350)*($('#main_banner li').length - 1)) y_value = -350;
    } 
    var myVar = setInterval(moving,4000); 
    
    var prev = function(){
        if (count == 0){
            count += 1;
            y_value +=img_height;
            $(ul_name).css('transition-duration', '0.3s');
            $(ul_name).css('transform','translate3d(0,'+y_value+'px,0)');
            if(y_value ==0){
                setTimeout(function(){
                    y_value = (-img_height)*(li_length-2)
                    $(ul_name).css('transition-duration', '0s'); 
                    $(ul_name).css('transform','translate3d(0,'+y_value+'px,0)');     
                },300)
            }
            setTimeout(function(){count = 0},500);
            }
    };
    $(ul_name).parent('div').parent('div').find('.bx-prev_2 img').on('click',function(){
        prev();
        
    });
    $(ul_name).parent('div').parent('div').find('.bx-next_2 img').click(function(){
        if (count == 0){
           count += 1;
           y_value -=img_height;
           $(ul_name).css('transition-duration', '0.3s');
           $(ul_name).css('transform','translate3d(0,'+y_value+'px,0)');
           if(y_value <= (-img_height)*($(''+ul_name+' li').length - 1)){        
               setTimeout(function(){      
                y_value = -img_height;
                $(ul_name).css('transition-duration', '0s'); 
                $(ul_name).css('transform','translate3d(0,'+y_value+'px,0)');     
            },300)  
           }
           setTimeout(function(){count = 0},500);
    }});   
    $(ul_name).hover(function(){
        clearInterval(myVar);
    },function(){               
        myVar = setInterval(moving,4000);
    });
    $(ul_name).parent('div').parent('div').find('.bx-prev_2 img').hover(function(){
        clearInterval(myVar);
    },function(){               
        myVar = setInterval(moving,4000);
    });
    $(ul_name).parent('div').parent('div').find('.bx-next_2 img').hover(function(){
        clearInterval(myVar);
    },function(){               
        myVar = setInterval(moving,4000);
    });
});     