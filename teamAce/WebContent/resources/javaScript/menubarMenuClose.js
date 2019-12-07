$(function() {

    // 메뉴가 활성화 되었을 때 메뉴를 벗어나서 click 하면 자동으로 닫히게 하는 함수입니다.
    $(document).click(function() {

        if (mouseY > 42) {
            if (topIconMouseEvent[0] == 2) {
                mouseFriendsMenuOut();
            }

            if (topIconMouseEvent[1] == 2) {
                mouseMessageMenuOut();
            }

            if (topIconMouseEvent[2] == 2) {
                mouseAlramMenuOut();
            }
        }
    });
});

function mouseFriendsMenuOut() {
    var $menuTitle = $("#topIconFriendsContent");
    

    var divX_Left = $menuTitle.offset().left;
    var divY_Top = $menuTitle.offset().top;

    var divX_Right = $menuTitle.width() + divX_Left;
    var divY_Bottom = $menuTitle.height() + divY_Top; // 메뉴는 List도 존재

    // alert(divX_Left + " 그리고 " + divX_Right);
    // alert(mouseX);
    if (divX_Left < mouseX && mouseX < divX_Right &&
        divY_Top < mouseY && mouseY < divY_Bottom) {   
            // iconClickCheck(5);
    } else {
        iconBtnClear(5);
    }
}

function mouseMessageMenuOut() {
    var $menuTitle = $("#searchListHistory");
    

    var divX_Left = $menuTitle.offset().left;
    var divY_Top = $menuTitle.offset().top;

    var divX_Right = $menuTitle.width() + divX_Left;
    var divY_Bottom = $menuTitle.height() + divY_Top; // 메뉴는 List도 존재

    // alert(divX_Left + " 그리고 " + divX_Right);
    // alert(mouseX);
    if (divX_Left < mouseX && mouseX < divX_Right &&
        divY_Top < mouseY && mouseY < divY_Bottom) {   
            // iconClickCheck(5);
    } else {
        iconBtnClear(5);
    }
}

function mouseAlramMenuOut() {
    var $menuTitle = $("#topIconAlramContent");
    

    var divX_Left = $menuTitle.offset().left;
    var divY_Top = $menuTitle.offset().top;

    var divX_Right = $menuTitle.width() + divX_Left;
    var divY_Bottom = $menuTitle.height() + divY_Top; // 메뉴는 List도 존재

    // alert(divX_Left + " 그리고 " + divX_Right);
    // alert(mouseX);
    if (divX_Left < mouseX && mouseX < divX_Right &&
        divY_Top < mouseY && mouseY < divY_Bottom) {   
            // iconClickCheck(5);
    } else {
        iconBtnClear(5);
    }
}