<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onsubmit=getCommentList(${board.bno})>
<table border="1">
	<tr>
		<th>번호</th>
		<td>${board.bno}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${board.title}</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${board.writer}</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${board.registerDate}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${board.content}</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${board.read_count}</td>
	</tr>
</table>

<!-- file 표현라인 -->
<div>
	<ul>
		<!--c:if 파일이 없으면 File이 없습니다. 출력 -->
			<c:forEach items="${fList}" var="fvo">
				<!--  파일이 여러개 일 때 반복적으로 li 추가 -->
					<li>	
					<c:choose>
						<c:when test="${fvo.file_type>0}">
							<div>
							<!-- fileUpload/2022/12/28 -->
								<img src="/upload/${fn:replace(fvo.save_dir,'\\','/')}/${fvo.uuid}_th_${fvo.file_name}">
							</div>
						</c:when>
						<c:otherwise>
							<div>
								<!--파일모양 아이콘을 넣어서 일반 파일임을 표현하면 됨.-->
							</div>
						</c:otherwise>
					</c:choose>
						<!--파일이름, 등록일, 사이즈-->
					<div>
						<div>${fvo.file_name}</div>
						${fvo.reg_at}
					</div>
					<span>${fvo.file_size} Byte</span>
				</li>
		</c:forEach>
	</ul>
</div>

<c:if test="${board.writer eq ses.id}">
<a href="/board/modify?bno=${board.bno}">수정</a><br>
<a href="/board/remove?bno=${board.bno}">삭제</a><br>
</c:if>
	 
<a href="/board/list">리스트</a><br>
<div>
	
<!-- comment line -->
	<div class="container">
		<div class="input-group my-3">
			<span class="input-group-text" id="cmtWriter">${board.writer }</span>
			<input type="text" class="form-control" id="cmtText" placeholder="Test Add Comment ">
			<button class="btn btn-success" id="cmtPostBtn" type="button">Post</button>
		</div>
		
		<ul class="list-group list-group-flush" id="cmtListArea">
		  <li class="list-group-item d-flex justify-content-between align-items-start">
		    <div class="ms-2 me-auto">
		      <div class="fw-bold">Writer</div>
		      Content for Comment
		    </div>
		    <span class="badge bg-dark rounded-pill">modAt</span>
		  </li>
		</ul>
	</div>
	


	<script type="text/javascript">
	const bnoVal = '<c:out value="${board.bno }" />';
	console.log(bnoVal);
	</script>
	<script type="text/javascript" src="/resources/js/boardComment.js"></script>
	<script type="text/javascript">
	getCommentList(bnoVal);
	</script>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</div>
</body>
</html>