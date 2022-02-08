$(function(){   
    var x_value = -1050;         
    var count = 0;
    var ul_name = '#main_banner';
    var img_width = 1050;
    var moving = function(){
        if (x_value > (-1050)*($(''+ul_name+' li').length - 1)){
            x_value -= 1050;
            $(ul_name).css('transition-duration', '0.3s');                  
            $(ul_name).css('transform','translate3d('+x_value+'px,0,0)'); 
            if (x_value <= (-1050)*($(''+ul_name+' li').length - 1)){
                setTimeout(function(){
                x_value = -1050
                $(ul_name).css('transition-duration', '0s'); 
                $(ul_name).css('transform','translate3d('+x_value+'px,0,0)');     
                    },300)
            }                                     
        } 
        else{
            x_value = -1050;
            $(ul_name).css('transition-duration', '0s'); 
            $(ul_name).css('transform','translate3d('+x_value+'px,0,0)');
            setTimeout(moving,10);                        
        }
        if (x_value < (-1050)*($(''+ul_name+' li').length - 1)) x_value = -1050;
    }   
    var myVar = setInterval(moving,4000); 
    var prev = function(){
        if (count == 0){
            count += 1;
            x_value +=img_width;
            $(ul_name).css('transition-duration', '0.3s');
            $(ul_name).css('transform','translate3d('+x_value+'px,0,0)');
            if(x_value ==0){
                setTimeout(function(){
                    x_value = (-img_width)*3
                    $(ul_name).css('transition-duration', '0s'); 
                    $(ul_name).css('transform','translate3d('+x_value+'px,0,0)');     
                },300)
            }
            setTimeout(function(){count = 0},500);
            }
    };

    $(ul_name).parent('div').find('.bx-prev_2 img').on('click',function(){
        prev();
    });
    $(ul_name).parent('div').find('.bx-next_2 img').click(function(){
        if (count == 0){
           count += 1;
           x_value -=img_width;
           $(ul_name).css('transition-duration', '0.3s');
           $(ul_name).css('transform','translate3d('+x_value+'px,0,0)');
           if(x_value <= (-img_width)*($(''+ul_name+' li').length - 1)){        
               setTimeout(function(){      
                x_value = -img_width;
                $(ul_name).css('transition-duration', '0s'); 
                $(ul_name).css('transform','translate3d('+x_value+'px,0,0)');     
            },300)  
           }
           setTimeout(function(){count = 0},500);
    }});   
    $(ul_name).hover(function(){
        clearInterval(myVar);
    },function(){               
        myVar = setInterval(moving,4000);
    });
    $(ul_name).parent('div').find('.bx-prev_2 img').mouseover(function(){
        clearInterval(myVar);
    });
    $(ul_name).parent('div').find('.bx-next_2 img').mouseover(function(){
        clearInterval(myVar);
    });
});     