$(function(){   
    var x_value = 0;         
    var count = 0;
    var ul_name = '.list';
    var img_width = 1050;
    $(ul_name).css('transform', 'translate3d(0px,0,0)');
    $(ul_name).css('transition-timing-function', 'ease-in-out');
    $(ul_name).parent('div').siblings('div').find('.bx-prev_3 img').css('display','none')
    $(ul_name).parent('div').siblings('div').find('.bx-prev_3 img').on('click',function(){              
        if (count == 0){
            x_value += img_width;
            count += 1;
            $(this).parent('a').parent('div').siblings('div').find('ul').css('transition-duration', '0.3s');
            $(this).parent('a').parent('div').siblings('div').find('ul').css('transform','translate3d('+x_value+'px,0,0)'); 
            if(x_value == 0){
                $(this).css('display','none')
            }
            if(x_value != -1050){
                $(this).parent('a').siblings('a').find('img').css('display','inline-block');
            }
            setTimeout(function(){count = 0},500);
            }
    });
    $(ul_name).parent('div').siblings('div').find('.bx-next_3 img').click(function(){
        if (count == 0){
           count += 1;
           x_value -= img_width;
           $(this).parent('a').parent('div').siblings('div').find('ul').css('transition-duration', '0.3s');
           $(this).parent('a').parent('div').siblings('div').find('ul').css('transform','translate3d('+x_value+'px,0,0)');
           $(this).parent('a').siblings('a').find('img').css('display','inline-block');
           
           if(x_value == -1050){        
                $(this).css('display','none');
           }
           setTimeout(function(){count = 0},500);
        }
    });   
});     