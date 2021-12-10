$(function(){
    $('.bx-prev img').hover(function(){
        $(this).attr("src","images/화살표/이전버튼호버.png")},
        function(){
        $(this).attr("src","images/화살표/이전버튼.png")});
    $('.bx-next img').mouseover(function(){
        $(this).attr("src","images/화살표/다음버튼호버.png")
    });
    $('.bx-next img').mouseout(function(){
        $(this).attr("src","images/화살표/다음버튼.png")
    })

    $('.bx-prev_3 img').mouseover(function(){
        $(this).attr("src","images/화살표/이전버튼호버.png")
    });
    $('.bx-prev_3 img').mouseout(function(){
        $(this).attr("src","images/화살표/이전버튼.png")
    });
    $('.bx-next_3 img').mouseover(function(){
        $(this).attr("src","images/화살표/다음버튼호버.png")
    });
    $('.bx-next_3 img').mouseout(function(){
        $(this).attr("src","images/화살표/다음버튼.png")
    })

    $('.bx-prev_4 img').mouseover(function(){
        $(this).attr("src","images/화살표/이전버튼호버.png")
    });
    $('.bx-prev_4 img').mouseout(function(){
        $(this).attr("src","images/화살표/이전버튼.png")
    });
    $('.bx-next_4 img').mouseover(function(){
        $(this).attr("src","images/화살표/다음버튼호버.png")
    });
    $('.bx-next_4 img').mouseout(function(){
        $(this).attr("src","images/화살표/다음버튼.png")
    })

    $('.bx-sale a').mouseover(function(){
        $('.bx-controls .bx-prev_2 img').css("opacity","0.7");
        $('.bx-controls .bx-next_2 img').css("opacity","0.7");
    })
    $('.bx-sale a').mouseout(function(){
        $('.bx-controls .bx-prev_2 img').css("opacity","0");
        $('.bx-controls .bx-next_2 img').css("opacity","0");
    })

    $('#sucho').hover(function(){
        $('#sucho span').css('opacity','0.9')},
        function(){$('#sucho span').css('opacity','0')}
    );
    $('.list_category li').mouseover(function(){
        // $(this).css("color",'rgb(220, 244, 255)');
        if($(this).css("background-color")!='rgb(222, 241, 243)'){
            $(this).css("background-color",'rgb(220, 244, 255)')}
        $(this).children('a').css("font-weight",'700')
    });
     
    $('.list_category li').mouseout(function(){
        // $(this).css("color",'rgb(220, 244, 255)');
        if ($(this).css("background-color")!='rgb(222, 241, 243)'){
            $(this).css("background-color",'rgb(252, 245, 245)');
            $(this).children('a').css("font-weight",'400');}
            
    });
    
    $('.list_category li').click(function(){
        // $(this).css("color",'rgb(220, 244, 255)');
        $('.list_category li').each(function(){
            $(this).css("background-color",'rgb(252, 245, 245)');
            $(this).children('a').css("font-weight",'400')
        });
        $(this).css("background-color",'#def1f3');
        // $(this).css("border",'1px solid #def1f3');
        $(this).children('a').css("font-weight",'700')              
    })
    $(function(){            
    $('.cut').mouseover(function(){
        $(this).find('img').css('transform','scale(1.1)');
        $(this).find('.md span').css('visibility', 'visible');
        });
        
    $('.cut').mouseout(function(){          
        $(this).find('img').css('transform','scale(1.0)');
        $(this).find('.md span').css('visibility', 'hidden');
        });
    $('.cut').hover(function(){
        $(this).find('.under a').css('opacity','1');
        },function(){
            $(this).find('.under a').css('opacity','0');
    });
    $('.under a').css('transition-duration','0.2s');
    });
});