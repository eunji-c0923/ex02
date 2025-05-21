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
    <link rel="stylesheet" href="../resources/css/get_css.css">
    <script src="script/jquery-1.12.3.js"></script>
    <script src="script/get_script.js"></script>
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
                    <li><a href="#">경기</a>
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
            <div id="list">
                <main class="content">
                    <div class="main-card">
                        <!-- 동적으로 출력 -->
                        <h3>${review.review_title}</h3>
                        <div class="edit-actions">
		                    <button type="button" class="btn-list"  onclick="location.href='/review/list';">리스트</button>
		                    <button type="button" class="btn-modifty" 
		                    onclick="location.href='/review/modify?review_id=${review.review_id}&pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}';">수정</button>
	               		</div>
                        
                        
                        <p class="writer"><strong>작성자:</strong> ${review.writer_name}</p>

                        <div class="option">
                            <p><strong>지역명:</strong> ${review.region}</p>
                            <p><strong>맛집 이름:</strong> ${review.restaurant_name}</p>
                            <p><strong>평점:</strong> ${review.rating} / 10</p>
                        </div>

                        <div class="review-box">
                            <p>${review.review_content}</p> <!-- 리뷰 내용 출력 -->
                        </div>

            <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA2MjZfMjM5%2FMDAxNzE5MzY1MTEyNTU1.p5ZDtbFV1MNRBGl2VYHufZKYzyBrHBR8HTTCWJPXrqUg.KNzAFt5pUrAWRNZs6MQupItChuqzHCm_aAez2yflapcg.JPEG%2Fimage_6.jpg&type=sc960_832" alt="리뷰 사진" class="review-img" />
        </div>
        </main>


      <!-- 댓글 섹션: 절대 건들지 말것 -->
      <div class="comment-section">
      <h3>댓글</h3>
  
    <ul class="comment-list">
        <li class="comment-row">
            <div class="comment-left">정말 맛있네요! 다음에 또 가볼게요</div>
            <div class="comment-right">홍길동 2025.01.18</div>
        </li>
        <li class="comment-row">
            <div class="comment-left">여기 자차로 가는 길이 감쪽같습니다 🚗</div>
            <div class="comment-right">김철수 2025.08.07</div>
        </li>
        <li class="comment-row">
            <div class="comment-left">사장님 인사도 친절하셨어요 😊</div>
            <div class="comment-right">이영희 2025.09.16</div>
        </li>
   </ul>

    <div class="comment-input">
        <textarea placeholder="댓글을 입력하세요"></textarea>
        <button type="button">댓글 등록</button>
    </div>
    </div>

</body>
</html>

    
</body>
</html>