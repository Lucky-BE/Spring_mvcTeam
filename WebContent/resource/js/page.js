/* 상세페이지 광고 배너 */
setInterval(function () {
  $("#gggg>li>a").delay(4000); //4초 정지
  $("#gggg>li>a").animate({ marginLeft: "-100%" });
  $("#gggg>li>a").delay(4000);
  $("#gggg>li>a").animate({ marginLeft: "-200%" });
  $("#gggg>li>a").delay(4000);
  $("#gggg>li>a").animate({ marginLeft: "-300%" });
  $("#gggg>li>a").delay(4000);
  $("#gggg>li>a").animate({ marginLeft: "-400%" });
  $("#gggg>li>a").delay(4000);
  $("#gggg>li>a").animate({ marginLeft: "0" }, "fast");
});
/* 광고 배너 가로 길이 */
$(window).on("load", function () {
  $(".pimg1 , .pimg2 , .pimg3 , .pimg4 , .pimg5 , header").css({
    width: innerWidth - 16.7 + "px",
  });
});
$(window).on("resize", function () {
  $(".pimg1 , .pimg2 , .pimg3 , .pimg4 , .pimg5 , header").css({
    width: innerWidth - 16.7 + "px",
  });
});