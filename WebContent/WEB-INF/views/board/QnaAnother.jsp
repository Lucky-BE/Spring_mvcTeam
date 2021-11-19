<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Sul Sure</title>
<head>
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>
	<link href="${root }css/board/postListCss.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="${root }css/include/wave.css" />
	<link rel="stylesheet" href="${root }css/board/QnaAnother.css" />
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<link href="${root }css/include/n_header_footer.css" rel="stylesheet" type="text/css" />
	<link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
    />
</head>
<body>
	<!-- 헤더 -->
	<header>
		<!-- 헤더 배너광고 -->
		<!-- 헤더 메뉴 -->
		<div class="menu">
			<div class="menu1">
				<c:import url="/WEB-INF/views/include/header.jsp"/>
			</div>
		</div>
	</header>
	<div id="cs-titleBox">
			<div class="page-header" align="center">
	 			<h1>문의하기</h1>
			</div>
		</div>
	<div class="qnaAno">
      <table class="qnaAnotherTable" align="center">
        <tr>
          <th>고객명</th>
          <td class="td2"><span>${loginBean.mem_name }</span></td>
          <th>e-mail</th>
          <td class="td2"><span>${loginBean.mem_mail }</span></td>
        </tr>
        <tr>
          <th>제목</th>
          <td colspan="3"><input type="text" id="qnasub" size="80" /></td>
        </tr>
        <tr>
          <th>내용</th>
          <td colspan="3"><div style="width:400px"><textarea cols="100%" rows="20"></textarea></div></td>
        </tr>
      </table>
      <div class="but">
        <button class="subut" onclick="subut()">문의하기</button>
        <button class="canbut" onclick="canbut()">닫기</button>
      </div>
    </div>
	<!-- 푸터 -->
	<footer>
		<c:import url="/WEB-INF/views/include/footer.jsp"/>
	</footer>
	<script type="text/javascript" src="${root }js/n_page.js"></script>
	<script type="text/javascript">
	function subut() {
		Swal.fire({
			text: "문의하시겠습니까?",
			showCancelButton: true,
			confirmButtonText: "네",
			CancelButtonText: "아니오",
		}).then((result) => {
			if(result.isConfirmed) {
				location.href="${root}board/QnaAnotherSucess";
			}
		});
	}
	function canbut() {
		location.href="${root}board/Qna";
	}
	</script>
	
</body>
</html>