<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Sul Sure</title>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>
	<link href="${root }css/board/postListCss.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="${root }css/include/wave.css" />
	<link href="${root }css/include/n_header_footer.css" rel="stylesheet" type="text/css" />
	<link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
    />
</head>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="${root}board/NoticeList?nowPage=${noticePaging.nowPage}&cntPerPage="+sel;
	}
</script>
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
	<div class="cs-container">
		<h2>고객센터</h2>
		<div class="cs-board01">
			<div id="cs-menu">
				<li>공지사항</li>
				<li>Q&A</li>
				<li>Contact Us</li>
			</div>
			<div id="cs-backimg" style="background: url('${root}/img/boardIcon/notice.jpg') center/cover no-repeat;"></div>
		</div>
		<div>
			<select id="cntPerPage" name="sel" onchange="selChange()">
				<option value="5"
					<c:if test="${noticePaging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
				<option value="10"
					<c:if test="${noticePaging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
				<option value="15"
					<c:if test="${noticePaging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
				<option value="20"
					<c:if test="${noticePaging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
			</select>
		</div> <!-- 옵션선택 끝 -->
		<div class="cs-board02">
			<div id="cs-titleBox">공지사항</div>
			<div id="cs-listContainer">
				<div id="cs-listBoard">
					<div id="cs-search">
						<!--게시판 검색 리스트-->
						<select>
							<option>제목</option>
							<option>작성일</option>
							<option>조회수</option>
						</select> <input type="text">
						<button type="submit">검색</button>
					</div>
				</div>
				<div id="cs-list">
					<table class="cs-table">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성일</th>
								<th>작성자</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody class="cs-tbody">
							<!--게시글 <td> 들어가는 곳-->
							<c:forEach var='obj' items="${noticeList }">
							<c:set var = 'i' value = "${i + 1 }"/>
								<tr>
									<td>${noticeTotal - obj.RN + 1}</td>
									<td>
										<a href="${root }board/NoticeRead?n_noticetitle=${obj.n_noticetitle }&n_noticecontent=${obj.n_noticecontent}&n_noticenum=${obj.n_noticenum}&n_noticecnt=${obj.n_noticecnt}&n_noticedate=${obj.n_noticedate}">${obj.n_noticetitle }</a>
									</td>
									<td>${obj.n_noticedate }</td>
									<td>${obj.mem_name }</td>
									<td>${obj.n_noticecnt }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<hr>
					<!--글쓰기버튼은 관리자용! 일반페이지에는 없앨것-->
					<div id="cs-button">
						<a href="${root }board/NoticeWrite">글쓰기</a>
					</div>
					<c:if test="${noticePaging.startPage != 1 }">
						<a href="${root }board/NoticeList?nowPage=${noticePaging.startPage - 1 }&cntPerPage=${noticePaging.cntPerPage}">&lt;</a>
					</c:if>
					<c:forEach begin="${noticePaging.startPage }" end="${noticePaging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == noticePaging.nowPage }">
								<b>${p }</b>
							</c:when>
							<c:when test="${p != noticePaging.nowPage }">
								<a href="${root }board/NoticeList?nowPage=${p }&cntPerPage=${noticePaging.cntPerPage}">${p }</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${noticePaging.endPage != noticePaging.lastPage}">
						<a href="${root }board/NoticeList?nowPage=${noticePaging.endPage+1 }&cntPerPage=${noticePaging.cntPerPage}">&gt;</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!-- 푸터 -->
	<footer>
		<c:import url="/WEB-INF/views/include/footer.jsp"/>
	</footer>
	<script type="text/javascript" src="${root }js/page.js"></script>
</body>
</html>