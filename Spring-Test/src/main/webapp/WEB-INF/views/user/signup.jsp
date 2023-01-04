<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
 <div class="sign-up" id="main">
         <h1>SIGN UP</h1>
         <form class="sign-up--form" action="/member/signup" method="post">
            <!-- 아이디 / 비번 -->
            <div class="sign-up--account">
               <div class="list">
                  <h3>ID</h3>
                  <input type="text" name="id" class="sign-up--input" required />
               </div>
               <div class="list">
                  <h3>Password</h3>
                  <input type="text" name="pw" class="sign-up--input" required />
               </div>
                <div class="list">
                  <h3>age</h3>
                  <input type="text" name="age" class="sign-up--input"  />
               </div>
                <div class="list">
                  <h3>name</h3>
                  <input type="text" name="name" class="sign-up--input"  />
               </div>
                <div class="list">
                  <h3>email</h3>
                  <input type="text" name="email" class="sign-up--input"  />
               </div>
                <div class="list">
                  <h3>home</h3>
                  <input type="text" name="home" class="sign-up--input"  />
               </div>
          
            <!-- 가입 완료 -->
            <input type="submit" name="join" value="Join" class="join" />
         </form>
      </div>
      <jsp:include page="../layout/footer.jsp"></jsp:include>

	<script type="text/javascript">
	const msh='<c:out value="${msg}"/>';
	if(msg=='0'){
		console.log(msg);
		alert("이미 가입된 회원입니다.")
	}
	</script>




</body>
</html>