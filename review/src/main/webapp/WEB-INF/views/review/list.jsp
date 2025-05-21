<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../resources/css/list_css.css">
    <script src="/resources/script/jquery-1.12.3.js"></script> <!-- 수정됨: 절대경로 사용 -->
    <script src="/resources/script/list_script.js"></script> <!-- 수정됨: 절대경로 사용 -->
</head>
<body>

    <div id="main">
        <header>
            <div id="logo"><a href="#"><img src="../resources/images/오늘 뭐먹조.png" alt="로고"></a></div>
            <div id="menu">
                <li><a href="#">한식</a></li>
                <li><a href="#">중식</a></li>
                <li><a href="#">일식</a></li>
                <li><a href="#">양식</a></li>
                <li><a href="#">디저트</a></li>
            </div>

            <div id="spot">
                <li><a href="#">로그인</a></li>
                <li><a href="#">회원가입</a></li>
                <li><a href="#">마이페이지</a></li>
            </div>

            <nav>
                <div class="menu">
                    <li class="none"><a href="#">메뉴</a>

                    <li><a href="#">서울</a>
                    <ul class="sub">
                        <li><a href="#">강남</a></li>
                        <li><a href="#">잠실</a></li>
                        <li><a href="#">종로</a></li>
                        <li><a href="#">홍대</a></li>
                    </ul>
                    </li>
                    <li><a href="#">경기도</a>
                    <ul class="sub">
                        <li><a href="#">고양</a></li>
                        <li><a href="#">성남</a></li>
                        <li><a href="#">수원</a></li>
                        <li><a href="#">포천</a></li>
                    </ul>
                    </li>
                    <li><a href="#">경상도</a>
                    <ul class="sub">
                        <li><a href="#">대구</a></li>
                        <li><a href="#">부산</a></li>
                        <li><a href="#">울산</a></li>
                        <li><a href="#">포항</a></li>
                    </ul>
                    </li>
                    <li><a href="#">전라도</a>
                    <ul class="sub">
                        <li><a href="#">광주</a></li>
                        <li><a href="#">목포</a></li>
                        <li><a href="#">여수</a></li>
                        <li><a href="#">전주</a></li>
                    </ul>
                    </li>
                    <li><a href="#">충청도</a>
                    <ul class="sub">
                        <li><a href="#">공주</a></li>
                        <li><a href="#">대전</a></li>
                        <li><a href="#">천안</a></li>
                        <li><a href="#">청주</a></li>
                    </ul>
                    </li>
                    <li><a href="#">제주도</a>
                    <ul class="sub">
                        <li><a href="#">서귀포시</a></li>
                        <li><a href="#">제주시</a></li>
                    </ul>
                    </li>
                </div>
            </nav>
        </header>
        
        <div id="body">
        <h1 class="main-title">맛ZON</h1>
        <div id="list">

        <div class="controls">
        <div class="dropdown">
          <button class="dropbtn"><a href="/review/register" class="dropbtn">리뷰 등록</a></button>
        </div>

        <div class="search">
          <input type="text" id="searchInput" placeholder="리뷰 검색..." />
          <button id="searchBtn">검색</button>
        </div>
      </div>
      
        <table>
        <thead>
            <tr>
            <th>번호</th>
            <th>지역</th>
            <th>제목</th>
            <th>작성자</th>
            <th>게시날</th>
            <th>내용</th>
            </tr>
        </thead>
        <tbody id="reviewTableBody"></tbody>
        <c:forEach var="review" items="${list}">
             <tr>
                <td><c:out value="${review.review_id}" /></td>

                <!-- 수정됨: pageNum, amount, type, keyword 전달 추가 -->
                <td>
                    <a class="move" href="${pageContext.request.contextPath}/review/get?review_id=${review.review_id}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">
                    <c:out value="${review.region}"/></a>
                </td>

                <!-- 수정됨: pageNum, amount, type, keyword 전달 추가 -->
                <td>
                    <a class="move" href="${pageContext.request.contextPath}/review/get?review_id=${review.review_id}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">
                    <c:out value="${review.review_title}"/></a>
                </td>

                <td><c:out value="${review.writer_name}" /></td>
                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${review.register_date}"/></td>
                <td><c:out value="${review.review_content}" /></td>
            </tr>
        </c:forEach>
     
        </table> 
			 <!-- 페이징 처리 -->
			<div class="pagination">
			    <!-- 이전 버튼 -->
			    <c:if test="${pageMaker.prev}">
			        <a href="/review/list?pageNum=${pageMaker.startPage-1}&amount=${pageMaker.cri.amount}" class="pagination-button">이전</a>
			    </c:if>
			
			    <!-- 페이지 번호 -->
			    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}" step="1">
			        <a href="/review/list?pageNum=${num}&amount=${pageMaker.cri.amount}" class="pagination-button ${pageMaker.cri.pageNum == num ? 'active' : ''}">
			            ${num}
			        </a>
			    </c:forEach>
			
			    <!-- 다음 버튼 -->
			    <c:if test="${pageMaker.next}">
			        <a href="/review/list?pageNum=${pageMaker.endPage+1}&amount=${pageMaker.cri.amount}" class="pagination-button">다음</a>
			    </c:if>
			</div>

        </div> <!-- #list -->
        </div>
    </div> 
</body>
</html>