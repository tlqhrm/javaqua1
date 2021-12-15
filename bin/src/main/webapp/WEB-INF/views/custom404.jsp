<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
  table {
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  td {
    border: 1px solid #444444;
    padding-left:5px;
  }
  
  
</style>
</head>
<body style="text-align:center;">
<div style="display:inline-block; margin-left:auto; margin-right:auto;">
<h1>해당 URL은 존재하지 않습니다.</h1>
<button type="button" onClick="history.go(-1)") style="width:350px;height:150px; font-size:50px;">뒤로가기</button>
<button type="button" onClick="ajax1();" style="width:350px;height:150px; font-size:50px;">일기예보</button>
<button type="button" onClick="getLocation();" style="width:350px;height:150px; font-size:50px;">뒤로가기</button>
</div>

<h1></h1>
<div id="map" style="width:600px;height:600px; display:inline-block; margin-left:auto; margin-right:auto; position:relative;"></div>

<table class="fileDataDetail table"">
<tbody id="tbody" style="border: 1px solid gray">
<tr style="border: 1px solid gray">
	<td >
		<span style="font-weight:bold; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" title="코드">코드</span>
	</td>
	<td >
		<span style="font-weight:bold; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" title="명칭">명칭</span>
	</td>
	<td >
		<span style="font-weight:bold; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" title="주소">주소</span>
	</td>
	<td >
		<span style="font-weight:bold; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" title="전화번호">전화번호</span>
	</td>
	<td >
		<span style="font-weight:bold; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" title="영업시간">영업시간</span>
	</td>
	<td >
		<span style="font-weight:bold; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" title="재고량">재고량</span>
	</td>
	<td >
		<span style="font-weight:bold; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" title="가격">가격</span>
	</td>
	<td >
		<span style="font-weight:bold; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" title="위도">위도</span>
	</td>
	<td >
		<span style="font-weight:bold; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" title="경도">경도</span>
	</td>
	<td >
		<span style="font-weight:bold; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" title="데이터기준일">데이터기준일</span>
	</td>
</tr>

</tbody>
</table>


<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=hfbkimx8o4"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>
(function(){
   
   $.ajax({
     type:"get",
     url:"https://api.odcloud.kr/api/15094782/v1/uddi:6b2017af-659d-437e-a549-c59788817675?page=1&perPage=111&serviceKey=hCNJd03rYvvexwy6ePp8Y7BvY8fdKjTbUhMtj6nM4Mm4yV1B6zaD713epk7b1iZVGFo6Zo1XG%2FEaJP%2F2wy5KrQ%3D%3D",
     data : {

     },
     dataType:"json",
     success: function(data){console.log(data)
    	 
    	console.log(data.currentCount);
     	console.log(data.data[0]);
     	console.log(data.data[0].코드);
     	
     	let markerList = [];
     	let elem="";
     	for(var i=0; i<data.currentCount; i++){
     		elem +=  '<tr>'+
     					'<td >'+
				    		data.data[i].코드+
				    	'</td>'+
				    	'<td >'+
				    		data.data[i].명칭+
				    	'</td>'+
				    	'<td >'+
				    		data.data[i].주소+
				    	'</td>'+
				    	'<td >'+
				    		data.data[i].전화번호+
				    	'</td>'+
				    	'<td >'+
				    		data.data[i].영업시간+
				    	'</td>'+
				    	'<td>'+
				    		data.data[i].재고량+
				    	'</td>'+
				    	'<td>'+
				    		data.data[i].가격+
				    	'</td>'+
				    	'<td>'+
				    		data.data[i].위도+
				    	'</td>'+
				    	'<td>'+
				    		data.data[i].경도+
				    	'</td>'+
				    	'<td>'+
				    		data.data[i].데이터기준일+
				    	'</td>'+
				    '</tr>'
				    
    		var icon = {
 	            url: HOME_PATH +'/resources/img/example/sp_pins_spot_v3.png',
 	            size: new naver.maps.Size(24, 37),
 	            anchor: new naver.maps.Point(12, 37),
 	            origin: new naver.maps.Point(i * 29, 0)
   	        },
   	        marker = new naver.maps.Marker({
   	            position: latlngs[i],
   	            map: map,
   	            icon: icon
   	        });

     	    marker.set('seq', i);

     	    markerList.push(marker);

     	    marker.addListener('mouseover', onMouseOver);
     	    marker.addListener('mouseout', onMouseOut);

     	    icon = null;
     	    marker = null;		    
		
     }
     	document.getElementById("tbody").innerHTML += elem;
     	
     	
     },
     error: function(err){console.log(err)}
   })
   
}());


var HOME_PATH = window.HOME_PATH || '.';



var map = new naver.maps.Map(document.getElementById('map'), {
	scaleControl: false,
    logoControl: false,
    mapDataControl: false,
    zoomControl: true,
    minZoom: 6,
    zoom: 16,
    center: new naver.maps.LatLng(37.3614483, 129.1114883)
});

var latlngs = [
    new naver.maps.LatLng(37.3633324, 129.1054988),
    new naver.maps.LatLng(37.3632916, 129.1085015),
    new naver.maps.LatLng(37.3632507, 129.1115043),
    new naver.maps.LatLng(37.3632097, 129.114507),
    new naver.maps.LatLng(37.3631687, 129.1175097),
    new naver.maps.LatLng(37.3597282, 129.105422),
    new naver.maps.LatLng(37.3596874, 129.1084246),
    new naver.maps.LatLng(37.3596465, 129.1114272),
    new naver.maps.LatLng(37.3596056, 129.1144298),
    new naver.maps.LatLng(37.3595646, 129.1174323)
];

var markerList = [];

for (var i=0, ii=latlngs.length; i<ii; i++) {
    var icon = {
            url: HOME_PATH +'/resources/img/example/sp_pins_spot_v3.png',
            size: new naver.maps.Size(24, 37),
            anchor: new naver.maps.Point(12, 37),
            origin: new naver.maps.Point(i * 29, 0)
        },
        marker = new naver.maps.Marker({
            position: latlngs[i],
            map: map,
            icon: icon
        });

    marker.set('seq', i);

    markerList.push(marker);

    marker.addListener('mouseover', onMouseOver);
    marker.addListener('mouseout', onMouseOut);

    icon = null;
    marker = null;
}

function onMouseOver(e) {
    var marker = e.overlay,
        seq = marker.get('seq');

    marker.setIcon({
        url: HOME_PATH +'/resources/img/example/sp_pins_spot_v3_over.png',
        size: new naver.maps.Size(24, 37),
        anchor: new naver.maps.Point(12, 37),
        origin: new naver.maps.Point(seq * 29, 50)
    });
}

function onMouseOut(e) {
    var marker = e.overlay,
        seq = marker.get('seq');

    marker.setIcon({
        url: HOME_PATH +'/resources/img/example/sp_pins_spot_v3.png',
        size: new naver.maps.Size(24, 37),
        anchor: new naver.maps.Point(12, 37),
        origin: new naver.maps.Point(seq * 29, 0)
    });
}



</script>
</body>
</html>