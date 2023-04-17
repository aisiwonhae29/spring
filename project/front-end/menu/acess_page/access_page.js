$(".logo").click(function () {
  $(".logo_box").css("left", "3%");
  $(".logo_box").css("top", "3%");
  $(".logo_box").css("bottom", "auto");
  $(".logo_box").css("right", "auto");
  $(".logo_box").css("background-position-x", "200px");
  $(".logo>img").css("width", "60px");
  $(".login_box").css("display", "flex");
});

$(".login_box>button").click(function () {
  $(".login_box>button").css("background-color", "red");
});
