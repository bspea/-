// author: 차종환
// 해당 날짜가 현재 날짜로부터 얼마만큼의 차이인지 String값으로 내보내는 함수입니다.
// ex) 현재 날짜로부터 어제면 '1일', 현재 날짜로부터 일주일 전이면 '일주일 전'을 반환


// value : yyyyMMdd 로 지정된 String 타입
function getDateString(value) {
	var date = value.aDate;
	var today = new Date();
	var nowDate = today.getFullYear() + "" + (today.getMonth()+1) + "" + today.getDate();
	var difDate = nowDate - date;
	
	
	
	if (difDate == 0) {
		return "오늘";
	} else if (difDate < 7) {
		return difDate + "일 전";
	} else if (difDate < 30) {
		return (difDate / 7) + "주 전"
	} else if (difDate < 365) {
		return (difDate / 30) + "달 전";
	} else {
		return date.substring(0,4) + "년 " + date.substring(4,6) + "월 " + date.substring(6,8) + "일";
	}
}

function getMessageDateString(value) {
	var date = value.mDate;
	var today = new Date();
	var nowDate = today.getFullYear() + "" + (today.getMonth()+1) + "" + today.getDate();
	var difDate = nowDate - date;
	
	
	
	if (difDate == 0) {
		return "오늘";
	} else if (difDate < 7) {
		return difDate + "일 전";
	} else if (difDate < 30) {
		return (difDate / 7) + "주 전"
	} else if (difDate < 365) {
		return (difDate / 30) + "달 전";
	} else {
		return date.substring(0,4) + "년 " + date.substring(4,6) + "월 " + date.substring(6,8) + "일";
	}
}

