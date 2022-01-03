<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/resources/images/로고/자바쿠아 아이콘.jpg" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" href="/resources/css/index.css">
    <title>JavaQua</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>	
    <!-- <script type="text/javascript" src="/resources/js/jquery.js"></script> -->
    <script src="/resources/js/mouse.js"></script>
    <script src="/resources/js/move_new.js"></script>
    <script src="/resources/js/move_secondbanner.js"></script>
    <script src="/resources/js/move_md.js"></script>
    <script src="/resources/js/move_beta.js"></script>
    <script src="/resources/js/move_oranda.js"></script>
    <script src="/resources/js/move_sucho.js"></script>
    <script src="/resources/js/move_best.js"></script>
    <script src="/resources/js/move_mainbanner.js"></script>

    

</head>
<body>
  <jsp:include page="header.jsp"></jsp:include>
  
    <div id="main">
        <div class=" bx-sale" id="b-wrapper" style="max-width: 1050px; height: auto; ">
            <div id="bx-viewport" style="width: 1050px; position: relative; overflow: hidden; margin-left: auto; margin-right: auto; height: 242px; margin-bottom: 90px;">
                <span class="bx-controls" style="width: 1050px; margin-top: 90px; height: 0px; z-index:1;">
                    <a class="bx-prev_2" href="#none" ><img src="/resources/images/화살표/이전버튼.png" style="margin-left: 40px; opacity: 0;"></a>
                    <a class="bx-next_2" href="#none" ><img src="/resources/images/화살표/다음버튼.png" style="margin-right: 40px; opacity: 0; float: right"></a>
                </span>
                <ul id="main_banner">
                    <li class="moving sale" id="mb3"><a href='/product/productList?page=1&category2=베타/구라미'><img src="/resources/images/배너/배너03.png"></a></li>
                    <li class="moving sale" id="mb1"><a href='/product/productList?page=1&category2=구피'><img src="/resources/images/배너/배너02.png"></a></li>
                    <li class="moving sale" id="mb2"><a href='/product/productList?page=1&category2=난주'><img src="/resources/images/배너/배너01.png"></a></li>
                    <li class="moving sale" id="mb3"><a href='/product/productList?page=1&category2=베타/구라미'><img src="/resources/images/배너/배너03.png"></a></li>
                    <li class="moving sale" id="mb2"><a href='/product/productList?page=1&category2=구피'><img src="/resources/images/배너/배너02.png"></a></li>
                </ul>
            </div>          
        </div>
        <div class = "product_list">
        	
            <div class = "tit_goods"><h3><a class="list_name" href="/product/productList?page=1&category1=new">&nbsp;&nbsp; NEW 열대어 &nbsp;></a></h3></div>
            <div class = "list_goods">
                <div class="bx-wrapper">
                    <div class="bx-viewport">                    
                        <ul class="list_1" style="width: 3204px; position:relative; list-style: none; margin: 0px; float: left; padding: 0px;">
                            <li v-for="(item,index) in pdList1" class="cut" id=list_1><a :href="'/product/productDetail?pd_num='+item.pd_num"><img :src="'/resources/upload/product/'+item.file1Arr[0]"></a>
                                <div class="info_goods" >
                                    <span class="name">
                                        <a class="txt" href='detail.html'>{{item.title}}</a>
                                    </span><br>
                                    <span v-if="item.discount != 0" class="discount">{{item.discount }}%</span>
                                    <span class="price">
                                        	{{item.strPrice}}원
                                    </span>  
                                    <span v-if="item.category1Arr[0] == 'new'" class="icon_new"></span>
                                    <span v-if="item.category1Arr[1] == 'sale'" class="icon_sale"></span>  
                                    <span v-if="item.category1Arr[2] == 'best'" class="icon_best"></span> 
                                    <span v-if="item.category1Arr[0] == 'sale'" class="icon_sale"></span>
                                    <span v-if="item.category1Arr[1] == 'best'" class="icon_best"></span>
                                    <span v-if="item.category1Arr[0] == 'best'" class="icon_best"></span>   
                                    <span v-if="item.discount !=0" class="cost" style="display:block;">{{item.strPrice2}}원</span>
                                    
                                    <span class="under">
                                        <a href='#none' @click="장바구니담기(item.pd_num, item.title, item.price, item.file1Arr[0], id)" class=under_cart></a>
                                        
                                    </span>                                                                                                             
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="bx-controls">
                        <a class="bx-prev" href='#none' ><img src="/resources/images/화살표/이전버튼.png"></a>
                        <a class="bx-next" href='#none' ><img src="/resources/images/화살표/다음버튼.png"></a>
                    </div>
                </div>
            </div>
        </div>       
        <div class = "product_list">
            <div class = "tit_goods"><h3><a class="list_name" href='/product/productList?page=1&category1=best'> &nbsp;&nbsp;&nbsp; 인기상품 &nbsp;> </a></div>
            <div class = "list_goods">
                <div class="bx-wrapper">
                    <div class="bx-viewport">                    
                        <ul class="list_2" style="width: 3204px; position:relative; list-style: none; margin: 0px; float: left; padding: 0px;">
                            <li v-for="(item,index) in pdList2" class="cut" id=list_1><a :href="'/product/productDetail?pd_num='+item.pd_num"><img :src="'/resources/upload/product/'+item.file1Arr[0]"></a>
                                <div class="info_goods" >
                                    <span class="name">
                                        <a class="txt" href='detail.html'>{{item.title}}</a>
                                    </span><br>
                                    <span v-if="item.discount != 0" class="discount">{{item.discount }}%</span>
                                    <span class="price">
                                        	{{item.strPrice}}원
                                    </span>  
                                    <span v-if="item.category1Arr[0] == 'new'" class="icon_new"></span>
                                    <span v-if="item.category1Arr[1] == 'sale'" class="icon_sale"></span>  
                                    <span v-if="item.category1Arr[2] == 'best'" class="icon_best"></span> 
                                    <span v-if="item.category1Arr[0] == 'sale'" class="icon_sale"></span>
                                    <span v-if="item.category1Arr[1] == 'best'" class="icon_best"></span>
                                    <span v-if="item.category1Arr[0] == 'best'" class="icon_best"></span>   
                                    <span v-if="item.discount !=0" class="cost" style="display:block;">{{item.strPrice2}}원</span>
                                    
                                    <span class="under">
										<a href='#none' @click="장바구니담기(item.pd_num, item.title, item.price, item.file1Arr[0], id)" class=under_cart></a>
                                        
                                    </span>                                                                                                             
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="bx-controls">
                        <a class="bx-prev" href='#none' ><img src="/resources/images/화살표/이전버튼.png"></a>
                        <a class="bx-next" href='#none' ><img src="/resources/images/화살표/다음버튼.png"></a>
                    </div>
                </div>
            </div>
        </div>    
        <div class = "product_list_color" style="margin-bottom: -24px;">
            <div class = "tit_goods"><h3>이달의 할인</div>
            <div class = "list_goods">
                <div class="bx-wrapper bx-sale" style="max-height:350px ;">
                    <span class="bx-controls" style="width: 1200px; margin-top: 150px; height: 0px; z-index:2; overflow: visible;">
                        <a class="bx-prev_2" href="#none" style="position:absolute; right: 90px; bottom: -25px;"><img src="/resources/images/화살표/위에버튼.jpg" style=" opacity: 0;  float: right"></a>
                        <a class="bx-next_2" href="#none" style="position:absolute; right: 90px; bottom: -85px;"><img src="/resources/images/화살표/아래버튼.jpg" style=" opacity: 0; float: right"></a>
                    </span>
                    <div class="bx-viewport">
                        
                        <ul id="second_banner" style="width: 1050px; height:350px ;position:relative; list-style: none; margin: 0px; float: left; padding: 0px;">
                            <li class="sale"><a href="#none"><img src="/resources/images/스페셜/month04.jpg"></a>
                            </li>
                            <li class="sale"><a href="#none"><img src="/resources/images/스페셜/month01.png"></a>
                            </li>
                            <li class="sale"><a href="#none"><img src="/resources/images/스페셜/month02.png"></a>
                            </li>
                            <li class="sale"><a href="#none"><img src="/resources/images/스페셜/month03.jpg"></a>
                            </li>
                            <li class="sale"><a href="#none"><img src="/resources/images/스페셜/month04.jpg"></a>
                            </li>
                            <li class="sale"><a href="#none"><img src="/resources/images/스페셜/month01.png"></a>
                            </li>
                        </ul>
                    </div>
                    
                </div>
            </div>
        </div>     
        <div class = "product_list">
            <div class = "tit_goods" style="padding-bottom: 0px; margin-top: 10px;"><h3> MD 추천상품 </h3></div>
            <div class = "category" style="position: relative; height: 80px; margin-right: auto; margin-left: auto; width: 1050px;">
                <ul class="list_category" style="width: 1050px; margin-left: 40px; margin-right: auto; list-style: none; padding: 0px 0px 0px 0px; position: relative;">
                    <li style=" background-color: #def1f3; "><a href='#none' @click="엠디('금붕어')" style="padding: 5px 70px 5px 70px; font-weight: 700;">금붕어</a></li>
                    <li><a href='#none' @click="엠디('구피')" style="padding: 5px 73px 5px 73px;">구피</a></li>
                    <li><a href='#none' @click="엠디('플래티/몰리')" style="padding: 5px 55px 5px 55px;">플래티/몰리</a></li>
                    <li><a href='#none' @click="엠디('테트라')" style="padding: 5px 70px 5px 70px;">테트라</a></li>
                    <li><a href='#none' @click="엠디('베타/구라미')" style="padding: 5px 55px 5px 55px;">베타/구라미</a></li>
                    <li><a href='#none' @click="엠디('라스보라/레인보우')" >라스보라/레인보우</a></li>
                    <li><a href='#none' @click="엠디('코리/플레코/캣')" style="padding: 5px 40px 5px 40px;">코리/플레코/캣</a></li>
                    <li><a href='#none' @click="엠디('엔젤/디스커스')" style="padding: 5px 40px 5px 40px;">엔젤/디스커스</a></li>
                    <li><a href='#none' @click="엠디('라미네지/시클리드')" >라미네지/시클리드</a></li>
                    <li><a href='#none' @click="엠디('애완새우/달팽이')" >애완새우/달팽이</a></li>
                </ul>
            </div>
            <div class = "list_goods">
                <div class="bx-wrapper" style="margin-bottom: 120px;">
                    <div class="bx-viewport">                    
                        <ul class="list" id="list_md" style="width: 1050px; position:relative; list-style: none; margin: auto; float: left; padding: 0px; height: 550px;">
                            <li v-for="item in pdListMd" class="cut">
                            	<a class="md" :href="'/product/productDetail?pd_num='+item.pd_num">
									<span></span>
                            		<span style="top:65px;">{{item.title}}</span>
                            		<span style="top:165px;">{{item.strPrice}}원</span>
                            	 	<img :src="'/resources/upload/product/'+item.file1Arr[0]">

                            	</a>
                            </li>  
                        </ul>                    
                    </div>
                                            
                    <h4 style="width: 1050px; height: 60px; margin-left: auto; margin-right: auto; float: none; text-align: center; font-size: 30px; line-height: 40px; margin-top: 12px; margin-bottom: 50px;">
                        <a :href="'/product/productList?page=1&category2='+category2" style="border: #d3d8da 1px solid; background-color: #e5e8e9; color: #000000; padding: 10px 30px 10px 30px; "> {{category2}} 더보기 ></a>
                       </h4> 
                       
                </div>
            </div>
        </div>
        <div class = "product_list">
            <div class = "tit_goods"><h3><a class="list_name" href='/product/productList?page=1&category2=실물 베타'> &nbsp;&nbsp;&nbsp; 베타 - 실물개체 &nbsp;> </a></div>
            <div class = "list_goods">
                <div class="bx-wrapper">
                    <div class="bx-viewport">                    
                        <ul class="list_3" style="width: 3204px; position:relative; list-style: none; margin: 0px; float: left; padding: 0px;">
                            <li v-for="(item,index) in pdList3" class="cut" id=list_1><a :href="'/product/productDetail?pd_num='+item.pd_num"><img :src="'/resources/upload/product/'+item.file1Arr[0]"></a>
                                <div class="info_goods" >
                                    <span class="name">
                                        <a class="txt" href='detail.html'>{{item.title}}</a>
                                    </span><br>
                                    <span v-if="item.discount != 0" class="discount">{{item.discount }}%</span>
                                    <span class="price">
                                        	{{item.strPrice}}원
                                    </span>  
                                    <span v-if="item.category1Arr[0] == 'new'" class="icon_new"></span>
                                    <span v-if="item.category1Arr[1] == 'sale'" class="icon_sale"></span>  
                                    <span v-if="item.category1Arr[2] == 'best'" class="icon_best"></span> 
                                    <span v-if="item.category1Arr[0] == 'sale'" class="icon_sale"></span>
                                    <span v-if="item.category1Arr[1] == 'best'" class="icon_best"></span>
                                    <span v-if="item.category1Arr[0] == 'best'" class="icon_best"></span>   
                                    <span v-if="item.discount !=0" class="cost" style="display:block;">{{item.strPrice2}}원</span>
                                    
                                    <span class="under">
                                        <a href='#none' @click="장바구니담기(item.pd_num, item.title, item.price, item.file1Arr[0], id)" class=under_cart></a>
                                        
                                    </span>                                                                                                             
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="bx-controls">
                        <a class="bx-prev" href='#none' ><img src="/resources/images/화살표/이전버튼.png"></a>
                        <a class="bx-next" href='#none' ><img src="/resources/images/화살표/다음버튼.png"></a>
                    </div>
                </div>
            </div>
            <div class = "product_list">
                <div class = "tit_goods"><h3><a class="list_name" href='/product/productList?page=1&category2=오란다'> &nbsp;&nbsp;&nbsp; 프리미엄 오란다 &nbsp;> </a></div>
                <div class = "list_goods">
                    <div class="bx-wrapper">
                        <div class="bx-viewport">                    
                            <ul class="list_4" style="width: 3204px; position:relative; list-style: none; margin: 0px; float: left; padding: 0px;">
                                <li v-for="(item,index) in pdList4" class="cut" id=list_1><a :href="'/product/productDetail?pd_num='+item.pd_num"><img :src="'/resources/upload/product/'+item.file1Arr[0]"></a>
                                <div class="info_goods" >
                                    <span class="name">
                                        <a class="txt" href='detail.html'>{{item.title}}</a>
                                    </span><br>
                                    <span v-if="item.discount != 0" class="discount">{{item.discount }}%</span>
                                    <span class="price">
                                        	{{item.strPrice}}원
                                    </span>  
                                    <span v-if="item.category1Arr[0] == 'new'" class="icon_new"></span>
                                    <span v-if="item.category1Arr[1] == 'sale'" class="icon_sale"></span>  
                                    <span v-if="item.category1Arr[2] == 'best'" class="icon_best"></span> 
                                    <span v-if="item.category1Arr[0] == 'sale'" class="icon_sale"></span>
                                    <span v-if="item.category1Arr[1] == 'best'" class="icon_best"></span>
                                    <span v-if="item.category1Arr[0] == 'best'" class="icon_best"></span>   
                                    <span v-if="item.discount !=0" class="cost" style="display:block;">{{item.strPrice2}}원</span>
                                    
                                    <span class="under">
                                        <a href='#none' @click="장바구니담기(item.pd_num, item.title, item.price, item.file1Arr[0], id)" class=under_cart></a>
                                        
                                    </span>                                                                                                             
                                </div>
                            </li>
                            </ul>
                        </div>
                        <div class="bx-controls">
                            <a class="bx-prev" href='#none' ><img src="/resources/images/화살표/이전버튼.png"></a>
                            <a class="bx-next" href='#none' ><img src="/resources/images/화살표/다음버튼.png"></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class = "tit_goods" style="margin-bottom: 20px;"><h3> 수초 </h3></div>
            <div id="sucho" style="margin-right: auto; margin-left: auto; width: 1050px; margin-top: -30px;"><a href="/product/productList?page=1&category2=수초"><span></span><span>수초 더보기</span><img src="/resources/images/스페셜/flowr02.jpg" width="1050px"></a></div>
            <div class = "list_goods"  style="margin-top: 5px; height: 320px; padding-bottom: 150px;">
                <div class="bx-wrapper">
                    <div class="bx-viewport bx-sale">
                        
                        <ul class="list" id="link" style="width: 3300px; position:relative; list-style: none; margin: 0px; float: left; padding: 0px; margin-left: 1px;"  >
                            <li class="cut"><a href="/product/productList?page=1&category2=후경수초"><img src="/resources/images/수초/후경수초.jpg"></a></li>
                            <li class="cut"><a href="/product/productList?page=1&category2=부상수초"><img src="/resources/images/수초/부상수초.jpg"></a></li>
                            <li class="cut"><a href="/product/productList?page=1&category2=씨앗수초"><img src="/resources/images/수초/씨앗수초.jpg"></a></li>
                            <li class="cut"><a href="/product/productList?page=1&category2=전경수초"><img src="/resources/images/수초/전경수초.jpg"></a></li>
                            <li class="cut"><a href="/product/productList?page=1&category2=중경수초"><img src="/resources/images/수초/중경수초.jpg"></a></li>
                            <li class="cut"><a href="/product/productList?page=1&category2=후경수초"><img src="/resources/images/수초/후경수초.jpg"></a></li>
                            <li class="cut"><a href="/product/productList?page=1&category2=부상수초"><img src="/resources/images/수초/부상수초.jpg"></a></li>
                            <li class="cut"><a href="/product/productList?page=1&category2=씨앗수초"><img src="/resources/images/수초/씨앗수초.jpg"></a></li>
                            <li class="cut"><a href="/product/productList?page=1&category2=전경수초"><img src="/resources/images/수초/전경수초.jpg"></a></li>
                        </ul>
                        
                    </div>
                    <div class="bx-controls" style="margin-top: -190px;">
                        <a class="bx-prev_4" href='#none' ><img src="/resources/images/화살표/이전버튼.png"></a>
                        <a class="bx-next_4" href='#none' ><img src="/resources/images/화살표/다음버튼.png"></a>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>      
    <!-- <div class="clear"></div> -->
    <jsp:include page="footer.jsp"></jsp:include>
<script>
var pdList1 = '${pdList1}';
var pdList2 = '${pdList2}';
var pdList3 = '${pdList3}';
var pdList4 = '${pdList4}';
var pdListMd = '${pdListMd}';


</script>
<script src="/resources/js/index.js"></script>
</body>
</html>

