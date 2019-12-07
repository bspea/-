var mouseX;
var mouseY;

// 마우스 이벤트 잡기
// 마우스 포지션을 mouse관련 이벤트에서만 잡을 수 있다고 한다.
// 그래서 다른 곳에서도 사용할 수 있도록 이렇게 지정
$(document).mousemove(function(e) {
    mouseX = e.pageX;
    mouseY = e.pageY;
});