<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
 <div class="login" id="main">
         <h1>LOG IN</h1>
         <form action="/member/login" method="post" class="login-form">
            <!-- 아이디 입력-->
            <input name="id" type="text" placeholder="ID" class="login-form--input" required />

            <!-- 비밀번호 입력-->
            <input name="pw" type="password" placeholder="Password" class="login-form--input" required />

        
            <!-- 로그인 버튼 -->
            <input type="submit" value="LOG IN" class="login-form--button" />

            <!-- 회원가입 / 아이디 찾기 -->
            <div class="login-form--a">
               <a href="/member/signup">회원가입</a>
               <a href="find-account.html">Find your Account</a>
            </div>
         </form>
      </div>
      <jsp:include page="../layout/footer.jsp"></jsp:include>
      <script type="text/javascript">
      const msg='<c:out value="${msg}"/>';
      console.log();
      if(msg_login==='0'){
    	  alert('로그인 실패!');
      }
      
      </script>
</body>
</html>