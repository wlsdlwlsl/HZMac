<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>admin 로그인</title>

</head>
<style>
.inputput {
	border: 0px;
	border-bottom: 2px solid;
	background-color: floralwhite;
}

.tdname {
	background-color: floralwhite;
	color: black;
}

.btnbtn {
	background-color: black;
	color: white;
}

body {
	background-color: floralwhite;
}
</style>
<script>
	window.onload = function() {
		document.getElementById('Submit').onclick = check;
	}

	function check() {
		if (document.form.adminID.value == "") {
			$('#adminIDCheck').text("아이디를 입력해 주세요.");
			setTimeout(function(){$('#adminIDCheck').text("")},2000);
			document.form.adminID.focus();
			return false;
		}
		
		/* window.addEventListener("keydown", e => {
			  const key = document.getElementById(e.key);
			  if (key) key.classList.add('pressed');
			}); */
		

		if (document.form.adminPW.value == "") {
			$('#adminPWCheck').text("비밀번호를 입력해 주세요.");
			setTimeout(function(){$('#adminPWCheck').text("")},2000);
			document.form.adminPW.focus();
			return false;
		}
			

		document.form.submit();
	}//전송
	/* $('#.adminlogin').submit(); */
	/* <!-- 밑에 type이 button이기 때문에 추가해줘야함   --> */
</script>
<body>
	<div id="wrapwrap"
		style="position: absolute; left: 42%; top: 36%; height: 50%;">
		<h4>
			관리자 로그인 페이지입니다.
			<p>
			<p>아이디와 패스워드를 입력하세요.
		</h4>

		<form name="form" class="adminlogin" action="admin/"
			method="post">
			<table width="300" height="120">
				<tr>
					<td width="100" class="tdname">아이디</td>
					<td><input type="text" name="adminID" id="adminID"
						class="inputput" autocomplete="off"></td>
					<div><span id="adminIDCheck" style="width:150px;color:red"></span></div>
				</tr>

				<tr>
					<td class="tdname">패스워드</td>
					<td><input type="password" name="adminPW" id="adminPW"
						class="inputput"></td>
					<div><span id="adminPWCheck" style="width:150px;color:red"></span></div>
				</tr>
				<tr>
					<td colspan=2 style="text-align: center;"><input type="button"
						name="Submit" id="Submit" class="btnbtn" value="로그인"> <!--  <input type="button"  value="회원가입" onclick="location.href='userJoin.do'"> -->
						<input type="reset" class="btnbtn" value="취소"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>