$(function(){
	
	//cityName에 따라 province 동적생성되는 함수 		
    selectProvince=function(){
    	var selectItem = $("#cityName").val();
        	
        var changeItem;
     
        switch (selectItem) {
        case "서울" :
        	changeItem = seoul;
            break;
        case "인천" :
        	changeItem = incheon;
            break;
        case "대전" :
        	changeItem = dajeon;
            break;
        case "대구" :
        	changeItem = daegu;
            break;
        case "광주" :
        	changeItem = gwangju;
            break;
        case "울산" :
        	changeItem = ulsan;
            break;
        case "부산" :
        	changeItem = busan;
            break;
        case "세종" :
        	changeItem = sejong;
            break;
        case "충북" :
        	changeItem = chungbuk;
            break;
        case "경기" :
        	changeItem = kyunggido;
            break;
        case "강원" :
        	changeItem = ganwondo;
            break;
        case "충남" :
        	changeItem = chungnam;
            break;
        case "전북" :
        	changeItem = jeonbuk;
            break;
        case "전남" :
        	changeItem = jeonnam;
            break;
        case "경북" :
        	changeItem = kyungbuk;
            break;
        case "경남" :
        	changeItem = kyungnam;
            break;
        case "제주" :
        	changeItem = jeju;
            break;
      }
                
        $('#province').empty();
     
        for(var count in changeItem){
        	var option = $("<option>"+changeItem[count]+"</option>");
            $('#province').append(option);
        }
    }
    
    //글쓰기 버튼 눌렀을때 페이지 이동
    $('#writeBtn').click(function(){
    	window.location.href='/petcommunity/communityBoardWrite.do';
    });
    
    
    
    var cities=["서울","인천","대전","광주","대구","울산","부산","세종","경기","강원","충북","충남","전북","전남","경북","경남","제주"];
    var seoul = ["종로구","중구","용산구","성동구","광진구","동대문구","중랑구","성북구","강북구","도봉구","노원구","은평구","서대문구","마포구"
    	,"양천구","강서구","구로구","금천구","영등포구","동작구","관악구","서초구","강남구","송파구","강동구"];
    var incheon = ["중구","동구","미추홀구","연수구","남동구","부평구","계양구","서구","강화군","옹진군"];
    var dajeon = ["동구","중구","서구","유성구","대덕구"];
    var gwangju = ["동구","서구","남구","북구","광산구"];
    var daegu = ["중구","동구","서구","남구","북구","수성구","달서구","달성군"];
    var ulsan = ["중구","남구","동구","북구","울주군"];
    var busan = ["중구","서구","동구","영도구","부산진구","동래구","남구","북구","강서구","해운대구","사하구","금정구","연제구","수영구","사상구","기장군"];
    var sejong = []
    var kyunggido = ["수원시","고양시","용인시","성남시","화성시","부천시","남양주시","안산시","안양시","평택시","광명시","하남시","의정부시","파주시"];
    var ganwondo = ["춘천시","원주시","강릉시","동해시","태백시","속초시","삼척시"];
    var chungbuk = ["청주시","충주시","제천시"];
    var chungnam = ["천안시","공주시","보령시","아산시","서산시","논산시","계룡시","당진시"];
    var jeonbuk = ["전주시","익산시","군산시","정읍시","남원시","김제시"];
    var jeonnam = ["목포시","여수시","순천시","나주시","광양시"];
    var kyungbuk = ["포항시","경주시","김천시","안동시","구미시","영주시","영천시","상주시","문경시","경산시"];
    var kyungnam = ["창원시","김해시","양산시","진주시","거제시","통영시","사천시","밀양시"];
    var jeju = ["제주시","서귀포시"];
    
  
    //cityName 동적 생성
  /*  $('#showBy').change(function(){
    	var selectCity = $("#showBy").val();
    	if(selectCity=="지역별"){
    		$('#hiddenBox').show();
    		$('#cityName').empty();
    		 for(var count in cities){
    			 var option = $("<option>"+cities[count]+"</option>");
    			 $('#cityName').append(option);
    	     }
    	}else if(selectCity=="추천순"|selectCity=="조회순"|selectCity=="전체보기"){
    		$('#hiddenBox').hide();
    	}
    });*/
    $('#hiddenBox').hide();
    $('#showBy').change(function(){
    	var selectCity = $("#showBy").val();
    	if(selectCity=="지역별"){
    		
    		$('#hiddenBox').show();
    		$('#cityName').empty();
    		 for(var count in cities){
    			 var option = $("<option>"+cities[count]+"</option>");
    			 $('#cityName').append(option);
    	     }
    		 $('#province').empty();
    		 for(var count in seoul){
      	       var option = $("<option>"+seoul[count]+"</option>");
      	       $('#province').append(option);
      	    }
    	}else if(selectCity=="추천순"|selectCity=="조회순"|selectCity=="전체보기"){
    		$('#hiddenBox').hide();
    	}
    });
   


    
    //도시선택시 province셀렉트 옵션생성
    $('#cityName').change(selectProvince)
    		
    
    
});