function minus(){
  var n=document.getElementById("res_personnel");
  var tmp = parseInt(n.innerText);

  tmp--;
  if(tmp < 1){
      tmp = 1;
  }
  n.innerText = tmp;
}

function plus(){
  var n=document.getElementById("res_personnel");
  var tmp = parseInt(n.innerText);

  tmp++;
  if(tmp>10){
      tmp=10;
      alert("최대 인원은 10명입니다.");
  }
  n.innerText = tmp;
}
setInterval(function () {
	$("#res_gggg>li>a").delay(3000);
	$("#res_gggg>li>a").animate({ marginLeft: "-100%"});
	$("#res_gggg>li>a").delay(3000);
	$("#res_gggg>li>a").animate({ marginLeft: "-200%"});
	$("#res_gggg>li>a").delay(3000);
	$("#res_gggg>li>a").animate({ marginLeft: "-300%"});
	$("#res_gggg>li>a").delay(3000);
	$("#res_gggg>li>a").animate({ marginLeft: "0"}, "fast");
});
$(window).on("load", function() {

$(".pimg1,.pimg2,.pimg3,.pimg4").css({width: $("#reservation").width() * 0.20 + "px",})
});

$(window).on("resize", function() {

$(".pimg1,.pimg2,.pimg3,.pimg4").css({width: $("#reservation").width() * 0.20 + "px",})
});


/*결제*/
$(document).ready(function(){
	$("#res_button").click(function(e){
    var IMP = window.IMP; // 생략가능
    IMP.init('imp61967006'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    var msg;
    
    IMP.request_pay({
        pg : 'kakaopay',
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : 'KH Books 도서 결제', //코스명
        amount : '20000', //가격
        buyer_email : 'a', 
        buyer_name : 'b', 
        buyer_tel : '01012345678',
        buyer_addr : '서울시강남구',
        buyer_postcode : '123-456',
        //m_redirect_url : 'http://www.naver.com'
    }, function(rsp) {
        if ( rsp.success ) {
            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            jQuery.ajax({
                url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                type: 'POST',
                dataType: 'json',
                data: {
                    imp_uid : rsp.imp_uid
                    //기타 필요한 데이터가 있으면 추가 전달
                }
            }).done(function(data) {
                //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                if ( everythings_fine ) {
                    msg = '결제가 완료되었습니다.';
                    msg += '\n고유ID : ' + rsp.imp_uid;
                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                    msg += '\결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                    
                    alert(msg);
                } else {
                    //[3] 아직 제대로 결제가 되지 않았습니다.
                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                }
            });
            //성공시 이동할 페이지
            location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg;
        } else {
            msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            //실패시 이동할 페이지
            location.href="<%=request.getContextPath()%>/order/payFail";
            alert(msg);
        }
    });
    
 });
	
});

var resdate = document.getElementById("res_date").value;
      resdate = new Date().toISOString().substring(0, 10);
      document.getElementById("res_date").setAttribute("min", resdate);