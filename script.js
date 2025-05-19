const reviews = [
  { no: 1, region: "서울", title: "을지로 골뱅이 골목 대박!", writer: "맛집헌터", date: "2025-05-01", views: 182 },
  { no: 2, region: "부산", title: "광안리 조개구이 미쳤음", writer: "바다먹짱", date: "2025-05-02", views: 211 },
  { no: 3, region: "제주", title: "흑돼지 진짜 제대로임!", writer: "한라산왕", date: "2025-05-03", views: 134 },
  { no: 4, region: "대구", title: "막창의 진수, 대구 막창집!", writer: "고기매니아", date: "2025-05-03", views: 198 },
  { no: 5, region: "광주", title: "떡갈비 인생맛집 찾음", writer: "광주녀", date: "2025-05-04", views: 167 },
  { no: 6, region: "대전", title: "칼국수 미친 집", writer: "면사랑", date: "2025-05-04", views: 112 },
  { no: 7, region: "인천", title: "차이나타운 짬뽕 최고", writer: "불맛러버", date: "2025-05-05", views: 140 },
  { no: 8, region: "서울", title: "마라탕에 마약 탄 듯", writer: "매운걸좋아해", date: "2025-05-06", views: 200 },
  { no: 9, region: "부산", title: "돼지국밥 이 집이 원조", writer: "국밥천재", date: "2025-05-06", views: 155 },
  { no: 10, region: "제주", title: "해녀촌 생선구이", writer: "싱싱왕", date: "2025-05-06", views: 189 },
  { no: 11, region: "서울", title: "연남동 타코집 분위기 굿", writer: "여행러버", date: "2025-05-07", views: 95 },
  { no: 12, region: "대전", title: "성심당 튀김소보루 최고", writer: "빵순이", date: "2025-05-07", views: 221 },
  { no: 13, region: "강릉", title: "회냉면은 여기!", writer: "냉면빠", date: "2025-05-07", views: 102 },
  { no: 14, region: "광주", title: "육회비빔밥 진심", writer: "고기마스터", date: "2025-05-08", views: 188 },
  { no: 15, region: "인천", title: "계란말이 김밥 존맛", writer: "김밥러버", date: "2025-05-08", views: 134 },
  { no: 16, region: "서울", title: "삼겹살+냉면 조합의 정석", writer: "한식사랑", date: "2025-05-08", views: 177 },
  { no: 17, region: "부산", title: "밀면은 여기가 국룰", writer: "면지기", date: "2025-05-09", views: 190 },
  { no: 18, region: "강릉", title: "장칼국수에 감동함", writer: "뜨끈한국", date: "2025-05-09", views: 98 },
  { no: 19, region: "서울", title: "초밥 무한리필 가성비 짱", writer: "스시인생", date: "2025-05-10", views: 243 },
  { no: 20, region: "대구", title: "찜갈비 눈물난다", writer: "밥도둑", date: "2025-05-10", views: 178 }
];

const tableBody = document.getElementById("reviewTableBody");
const pagination = document.getElementById("pagination");

const itemsPerPage = 10;
let currentPage = 1;

function loadReviews(page) {
  tableBody.innerHTML = "";

  const start = (page - 1) * itemsPerPage;
  const end = start + itemsPerPage;
  const paginatedReviews = reviews.slice(start, end);

  paginatedReviews.forEach((review) => {
    const row = document.createElement("tr");
    row.innerHTML = `
      <td>${review.no}</td>
      <td>${review.region}</td>
      <td>${review.title}</td>
      <td>${review.writer}</td>
      <td>${review.date}</td>    
      <td>${review.views}</td>   
    `;
    tableBody.appendChild(row);
  });

  renderPagination();
}

function renderPagination() {
  pagination.innerHTML = "";
  const totalPages = Math.ceil(reviews.length / itemsPerPage);

  for (let i = 1; i <= totalPages; i++) {
    const btn = document.createElement("button");
    btn.textContent = i;
    btn.className = i === currentPage ? "active" : "";
    btn.addEventListener("click", () => {
      currentPage = i;
      loadReviews(currentPage);
    });
    pagination.appendChild(btn);
  }
}

// 평점 버튼 클릭 시 활성화 토글 함수
function setupRatingButtons() {
  const buttons = document.querySelectorAll('.rating-button');
  buttons.forEach(button => {
    button.addEventListener('click', () => {
      buttons.forEach(btn => btn.classList.remove('active'));
      button.classList.add('active');
    });
  });
}

document.addEventListener("DOMContentLoaded", () => {
  loadReviews(currentPage);  // 기존 페이징 함수 호출 유지
  setupRatingButtons();      // 평점 버튼 이벤트 추가
});

<script>
  function addComment() {
    const commentInput = document.getElementById('commentText');
    const commentText = commentInput.value.trim();
    const commentList = document.getElementById('commentList');

    if (commentText === "") {
      alert("댓글을 입력해주세요.");
      return;
    }

    // 댓글 항목 생성
    const li = document.createElement('li');
    li.textContent = commentText;

    // 삭제 버튼 생성
    const deleteBtn = document.createElement('button');
    deleteBtn.textContent = "삭제";
    deleteBtn.classList.add('delete-comment-btn');
    deleteBtn.onclick = function () {
      commentList.removeChild(li);
    };

    // 댓글에 삭제 버튼 추가
    li.appendChild(deleteBtn);

    // 댓글 리스트에 추가
    commentList.appendChild(li);

    // 입력창 비우기
    commentInput.value = "";
  }
</script>
// 페이지 로드 시 댓글 불러오기
window.onload = function () {
  const storedComments = JSON.parse(localStorage.getItem("comments") || "[]");
  storedComments.forEach(comment => renderComment(comment));
};

function addComment() {
  const authorInput = document.getElementById("commentAuthor");
  const commentInput = document.getElementById("commentText");

  const author = authorInput.value.trim();
  const text = commentInput.value.trim();

  if (!author || !text) {
    alert("작성자와 댓글 내용을 모두 입력해주세요.");
    return;
  }

  const comment = {
    id: Date.now(),
    author,
    text,
    date: new Date().toLocaleString("ko-KR")
  };

  // 저장
  const storedComments = JSON.parse(localStorage.getItem("comments") || "[]");
  storedComments.push(comment);
  localStorage.setItem("comments", JSON.stringify(storedComments));

  renderComment(comment);

  authorInput.value = "";
  commentInput.value = "";
}

function renderComment(comment) {
  const commentList = document.getElementById("commentList");

  const li = document.createElement("li");

  const meta = document.createElement("div");
  meta.className = "comment-meta";
  meta.textContent = `${comment.author} | ${comment.date}`;

  const content = document.createElement("p");
  content.textContent = comment.text;

  const deleteBtn = document.createElement("button");
  deleteBtn.textContent = "삭제";
  deleteBtn.className = "delete-comment-btn";
  deleteBtn.onclick = function () {
    li.remove();
    deleteComment(comment.id);
  };

  li.appendChild(meta);
  li.appendChild(content);
  li.appendChild(deleteBtn);

  commentList.appendChild(li);
}

function deleteComment(id) {
  let storedComments = JSON.parse(localStorage.getItem("comments") || "[]");
  storedComments = storedComments.filter(c => c.id !== id);
  localStorage.setItem("comments", JSON.stringify(storedComments));
}
