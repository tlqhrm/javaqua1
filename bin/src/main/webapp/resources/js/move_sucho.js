$(function(){   
    var x_value = -350;         
    var count = 0;
    var ul_name = '#link';
    var img_width = 350;    
    $(ul_name).css('transform', 'translate3d(-350px,0,0)');
    $(ul_name).css('transition-timing-function', 'ease-in-out'); 

    
    $(ul_name).parent('div').siblings('div').find('.bx-prev_4 img').click(function(){
        if (count == 0){
           count += 1;
           x_value +=img_width;
           $(ul_name).css('transition-duration', '0.3s');
           $(ul_name).css('transform','translate3d('+x_value+'px,0,0)');
           if(x_value >= 0){        
               setTimeout(function(){      
                x_value = -1750;
                $(ul_name).css('transition-duration', '0s'); 
                $(ul_name).css('transform','translate3d('+x_value+'px,0,0)');     
            },300)  
           }
           setTimeout(function(){count = 0},500);
    }}); 
    $(ul_name).parent('div').siblings('div').find('.bx-next_4 img').click(function(){
        if (count == 0){
           count += 1;
           x_value -=img_width;
           $(ul_name).css('transition-duration', '0.3s');
           $(ul_name).css('transform','translate3d('+x_value+'px,0,0)');
           if(x_value <= -2100){        
               setTimeout(function(){      
                x_value = -img_width;
                $(ul_name).css('transition-duration', '0s'); 
                $(ul_name).css('transform','translate3d('+x_value+'px,0,0)');     
            },300)  
           }
           setTimeout(function(){count = 0},500);
    }}); 
});     