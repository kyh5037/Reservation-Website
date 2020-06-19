// Ajax Post
function ajaxPostAction(url, formData) {
	$.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: "json",
        success: function(data) {
        	/**
        	 * data[0] : success message
        	 * data[1] : redirect action
        	 * data[2] : redirect parameter 
        	 */
        	alert(data[0]);
        	callbackPage(data[1], data[2]);
        },
        error: function(data) {
            alert("오류가 발생했습니다.\n잠시후 다시 시도하세요.");
        }
    });
}

// CallBack 화면 이동
function callbackPage(url, data) {
	if (url == null || url == undefined)
		return;
	
	var form = document.createElement('form');
	form.setAttribute('method', "post");
	form.setAttribute('action', url);
	
	for (var key in data) {
		if (data.hasOwnProperty(key)) {
			var hiddenField = document.createElement('input');
            hiddenField.setAttribute('type', 'hidden');
            hiddenField.setAttribute('name', key);
            hiddenField.setAttribute('value', data[key]);
            
            form.appendChild(hiddenField);
		}
	}
	
	document.body.appendChild(form);
    form.submit();
}


function foodReserve(sto_no) {
	var form = $("#reserveForm");
	$("#sto_no").val(sto_no);

	form.submit();
}

function foodDetail(sto_no) {
	var f = document.createElement("form");
	f.setAttribute("method","get"); 
	f.setAttribute("action","/foodlist/foodDetail");
	document.body.appendChild(f);
	var i = document.createElement("input");
	i.setAttribute("type","hidden");
	i.setAttribute("name","sto_no");
	i.setAttribute("value", sto_no);
	f.appendChild(i);
	f.submit();

}

function foodlist() {
	var form = $("#foodlistForm");

	form.submit();
}



function listView(let_no) {
	var form = $("#letForm");
	$("#let_no").val(let_no);	
	
	form.submit();
}

function listpage(num, let_no_acc) {
	
	var f = document.createElement("form");
	f.setAttribute("method","post"); 
	f.setAttribute("action","/letter/list");
	document.body.appendChild(f);
	
	var i = document.createElement("input");
	i.setAttribute("type","hidden");
	i.setAttribute("name","num");
	i.setAttribute("value", num);
	f.appendChild(i);
	
	var i = document.createElement("input");
	i.setAttribute("type","hidden");
	i.setAttribute("name","let_no_acc");
	i.setAttribute("value", let_no_acc);
	f.appendChild(i);
	
	f.submit();
	
}

function listLetter(acc_no) {
    
	if (acc_no == undefined) {
   		alert("로그인한 후 이용가능합니다.");
   		return;
	}

	var form = $("#letterForm");
	form.submit();
}

function logout() {
	ajaxPostAction("/member/logout");
}

function noticeView(notice_no) {
	var form = $("#noticeForm");
	$("#notice_no").val(notice_no);

	form.submit();
}

//function enroll(acc_no) {
//	var editForm = document.getElementById('informationForm');;
//	$("#sto_no_acc").val(acc_no);
//	editForm.action="/information/enroll";
//	editForm.method="post";
//	editForm.submit();
//}

function onClickSearch(){
	
	var places = new kakao.maps.services.Places();
	
	var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        console.log(result);
	        $("#search_gps_x").val(result[0].x);
	        $("#search_gps_y").val(result[0].y);
	    }
	};
	
	var options ={
			location: new kakao.maps.LatLng($("gps_x").val(), $("gps_y").val())
	};

	places.keywordSearch($("#search").val(), callback);
	$("#searchForm").submit();
}

$("#sto_photo").change(function(){
	if(this.files && this.files[0]) {
		var reader = new FileReader;
		reader.onload = function(data) {
			$(".select_img img").attr("src", data.target.result).width(500);        
		}
		reader.readAsDataURL(this.files[0]);
	}
});


function findAddress() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = data.address; // 최종 주소 변수

            // 주소 정보를 해당 필드에 넣는다.
            $("#sto_loc").val(addr);
            // 주소로 상세 정보를 검색
            geocoder.addressSearch(data.address, function(results, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === daum.maps.services.Status.OK) {

                    var result = results[0]; //첫번째 결과의 값을 활용

                    // 해당 주소에 대한 좌표를 받아서
                    var coords = new kakao.maps.LatLng(result.y, result.x);
                    $("#sto_gps_x").val(result.y);
			        $("#sto_gps_y").val(result.x);
                    // 지도를 보여준다.
                    mapContainer.style.display = "block";
                    map.relayout();
                    // 지도 중심을 변경한다.
                    map.setCenter(coords);
                    // 마커를 결과값으로 받은 위치로 옮긴다.
                    marker.setPosition(coords)
                }
            });
        }
    }).open();
}


function resCancel(res_no){
	var f = document.createElement("form");
	f.setAttribute("method","post"); 
	f.setAttribute("action","/information/resCancel");
	document.body.appendChild(f);
	
	var i = document.createElement("input");
	i.setAttribute("type","hidden");
	i.setAttribute("name","res_no");
	i.setAttribute("value", res_no);
	f.appendChild(i);
	
	
	f.submit();
}

function resCancel(res_no){
	var f = document.createElement("form");
	f.setAttribute("method","post"); 
	f.setAttribute("action","/information/resCancel");
	document.body.appendChild(f);
	
	var i = document.createElement("input");
	i.setAttribute("type","hidden");
	i.setAttribute("name","res_no");
	i.setAttribute("value", res_no);
	f.appendChild(i);
	
	
	f.submit();
}

function resConfirm(res_no, res_check){
	var f = document.createElement("form");
	f.setAttribute("method","post"); 
	f.setAttribute("id", "resConfirm")
	f.setAttribute("action","/information/resCheck");
	document.body.appendChild(f);
	
	var i = document.createElement("input");
	i.setAttribute("type","hidden");
	i.setAttribute("name","res_check");
	i.setAttribute("value", res_check);
	f.appendChild(i);
	
	var j = document.createElement("input");
	j.setAttribute("type","hidden");
	j.setAttribute("name","res_no");
	j.setAttribute("value", res_no);
	f.appendChild(j);
	
	var formData = $("#resConfirm").serialize();
	
	ajaxPostAction("/information/resCheck", formData);
	
}










function reviewEnroll(){
    var formData = $("#reviewForm").serialize();
	ajaxPostAction("/review/enroll", formData);
}


