<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../resources/css/modify_css.css">
    <script src="script/jquery-1.12.3.js"></script>
    <script src="script/writer_script.js"></script>
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
        <form class="main-card" method="post">
        
        <!-- 수정,삭제 버튼 클릭 시 pageNum, amount값 전달 -->
    	<%-- <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
        <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>  
        <!-- 수정,삭제 버튼 클릭 시 type, keyword값 전달 -->   
        <input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>       	
        <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'> --%>
        
        <input type="hidden" name="pageNum" value="${cri.pageNum}" />
        <input type="hidden" name="amount" value="${cri.amount}" />
        <input type="hidden" name="type" value="${cri.type}" />
        <input type="hidden" name="keyword" value="${cri.keyword}" />
        
        
        <input type="hidden" name="review_id" value="${review.review_id}"/> 
        
        <!-- 제목 -->
        <label for="review_title"><strong>제목:</strong></label>
        <input type="text" id="review_title" name="review_title" value="<c:out value='${review.review_title}'/>"/>
    
        <!-- 작성자 -->
        <label for="writer_name"><strong>작성자:</strong></label>
        <input type="text" id="writer_name" name="writer_name" value="<c:out value='${review.writer_name}'/>" readonly="readonly"/>

        <!-- 지역명 -->
        <label for="region"><strong>지역명:</strong></label>
        <input type="text" id="region" name="region" value="<c:out value='${review.region}'/>"/>

        <!-- 맛집 이름 -->
        <label for="restaurant_name"><strong>맛집 이름:</strong></label>
        <input type="text" id="restaurant_name" name="restaurant_name" value="<c:out value='${review.restaurant_name}'/>"/>

        <!-- 평점 -->
        <label for="rating"><strong>평점:</strong></label>
        <select id="rating" name="rating">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9" selected>9</option>
            <option value="10">10</option>
        </select>

        <!-- 리뷰 -->
        <label for="review_content"><strong>리뷰:</strong></label>
        <textarea id="review_content" name="review_content" rows="5"><c:out value='${review.review_content}'/></textarea>

        <!-- 리뷰 사진 (추후 처리) -->
        <label for="review-img"><strong>리뷰 사진:</strong></label>
        <input type="file" id="review-img" name="review-img" accept="image/*" />

        <!-- 제출 버튼 -->
         <div class="edit-actions">
            <button type="button" data-oper='modify' class="btn-update">수정</button>
            <button type="button" data-oper='remove' class="btn-delete">삭제</button>
            <button type="button" data-oper='list' class="btn-writer">리스트</button>
        </div>
        </form>

        </main>
       
        </div>
        </div>
    </div> 

<script src="/resources/script/jquery-1.12.3.js"></script>

<script>
$(document).ready(function () {
    const formObj = $("form");

    $(".edit-actions button").on("click", function (e) {
        e.preventDefault(); // submit 막기

        const oper = $(this).data("oper");

        if (oper === 'modify') {
            formObj.attr("action", "/review/modify");
            formObj.submit();

        } else if (oper === 'remove') {
            if (confirm("정말 삭제하시겠습니까?")) {
                formObj.attr("action", "/review/remove");
                formObj.submit();
            }

        } else if (oper === 'list') {
            // form submit 필요 없이 그냥 이동
            location.href = "/review/list";
        }
    });
});
</script>

</body>
</html>
