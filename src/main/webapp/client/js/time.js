var second = 60;
var time = document.getElementById("time");

function show() {
	second--;
	if (second == 0) {
		location.href = "/client/index.jsp";
	}
	time.innerHTML = second + "";
}

setInterval(show, 1000);