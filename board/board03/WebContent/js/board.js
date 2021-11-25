/*
window.onload = function()
{
	document.join.uid.focus();
}

//입력값 검사
function CheckItem(obj)
{
	alert("아이디를 입력하세요");
	obj.focus();
	return false;
}
//전송 클릭 -> 가입 폼 검사
function FormCheck()
{
	//document.join.submit();
	if (CheckItem(document.join.uid) == false) return false;
	if (CheckItem(document.join.upw) == false) return false;
	if (CheckItem(document.join.uname) == false) return false;
	if (document.join.upw.value != document.join.upwcheck.value )
	{
		alert("비밀번호가 일치하지 않습니다.");
		document.join.upw.focus();
		return false;
	}
	
	return true;
}

//취소 클릭 -> index 페이지로
function GoIndex()
{
	document.location = "index.jsp";
}

*/