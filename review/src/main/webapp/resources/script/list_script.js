$(document).ready(function(){
    $(".menu li").on('mouseover',function(){
        $(this).find(".sub").stop().slideDown();
    });
    $(".menu li").on('mouseout',function(){
        $(this).find(".sub").stop().slideUp();
    });


 const tableBody = $("#reviewTableBody");
  const pagination = $("#pagination");

  const itemsPerPage = 10;
  let currentPage = 1;

  function loadReviews(page) {
    tableBody.empty();

    const start = (page - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    const paginatedReviews = reviews.slice(start, end);

    paginatedReviews.forEach((review) => {
    const row = `
    <tr class="review-row">
        <td>${review.no}</td>
        <td>${review.region}</td>
        <td>${review.title}</td>
        <td>${review.writer}</td>
        <td>${review.date}</td>
        <td>${review.views}</td>
    </tr>
    `;
      tableBody.append(row);
    });

    renderPagination();
  }

  function renderPagination() {
    pagination.empty();
    const totalPages = Math.ceil(reviews.length / itemsPerPage);

    for (let i = 1; i <= totalPages; i++) {
      const pageBtn = $(`<button>${i}</button>`);
      if (i === currentPage) {
        pageBtn.css("font-weight", "bold");
      }
      pageBtn.on("click", function () {
        currentPage = i;
        loadReviews(currentPage);
      });
      pagination.append(pageBtn);
    }
  }

  // 최초 로딩
  loadReviews(currentPage);

  });