var xhr;
var checkFirst = loopSend = false;
var lastKeyword = "";

function sijak(){
	//alert("asd")
	if (checkFirst == false) {
		setTimeout("sendKeyword()", 1000);
		loopSend = true;
	}
}

function sendKeyword(){

	if(loopSend == false) return;
	
	var keyWord = document.frm.keyword.value;
	//console.log(keyWord);
	
	if(keyWord == ""){
		lastKeyword = "";
		hide("suggest");
	}else if(keyWord != lastKeyword){
		lastKeyword = keyWord;
		
		if(keyWord != ""){
			var para = "keyword=" + keyWord
			xhr = new XMLHttpRequest();
			xhr.open("post","suggest_TEST.jsp",true);
			xhr.onreadystatechange = function(){
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
						process();
					}else{
						alert("실패" + xhr.status);
					}
				}
			}
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
			xhr.send(para);
		}else{
			hide("suggest");
		}
	}
	setTimeout("sendKeyword()",1000);
}

function process(){
	var reData = xhr.responseText;
	//alert(reData)
	var result = reData.split("|");
	//alert("전체건수" + result[0]);
	//alert("전체자료" + result[1]);
	if(result[0] > 0){
	var datas = result[1].split(",");
	var imsi = ""
		for (var i = 0; i < datas.length; i++) {
			var op = document.createElement("option");
			imsi = datas[i]
			op.text = imsi;
			op.setAttribute("value", imsi);
			select.add(op);
		}
	show("suggest");
	
	}
	
}

function func(data){
	frm.sel.value = data;
	loopSend = checkFirst =false;
	lastKeyword = "";
	frm.keyword.value = "";
	frm.keyword.focus();
	hide("suggest");
}

function hide(ele){
	var e = document.getElementById(ele);
	if(e) e.style.display = "none";
}

function show(ele){
	var e = document.getElementById(ele);
	if(e) e.style.display = "";
}

function selectEvent(selectObj) {
	
	var para = "keyword=" + selectObj.value
	xhr = new XMLHttpRequest();
	xhr.open("post","suggest_TEST2.jsp",true);
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				process2();
			}else{
				alert("실패" + xhr.status);
			}
		}
	}
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
	xhr.send(para);

	for(i=frm.sel.length-1; i>=0; i--){
		frm.sel.remove(i);
	   }
}

function process2(){
	var reData = xhr.responseText;
	alert(reData)
	//var result = reData.split("|");
	//alert("전체건수" + result[0]);
	//alert("전체자료" + result[1]);
	var datas = reData.split(",");
	var imsi = "<table border='1'><tr><th>고객번호</th><th>고객명</th><th>고객주민</th><th>고객전화</th></tr><tr>"
		for (var i = 0; i < datas.length; i++) {
			imsi += "<td>" + datas[i] + "</td>"
			if(i == 3){
				imsi += "</tr><tr>";
			}
			if(i == 7){
				imsi += "</tr><tr>";
			}
			if(i == 11){
				imsi += "</tr><tr>";
			}
			if(i == 15){
				imsi += "</tr><tr>";
			}
			if(i == 19){
				imsi += "</tr><tr>";
			}
			if(i == 23){
				imsi += "</tr><tr>";
			}
			if(i == 27){
				imsi += "</tr><tr>";
			}
			if(i == 31){
				imsi += "</tr><tr>";
			}

		}
	imsi += "</tr></table>"
	alert(imsi)
	document.getElementById("suggest").innerHTML = imsi;
	
	
	
}



