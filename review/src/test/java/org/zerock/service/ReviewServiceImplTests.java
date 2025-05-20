package org.zerock.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ReviewVO;
import org.zerock.domain.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",   //service
	"file:src/main/webapp/WEB-INF/spring/root-context.xml"   //mapper(interface)
	})
@Log4j
public class ReviewServiceImplTests {

	@Autowired
	private ReviewService service;
	
	@Test
	public void testRegister() {
		ReviewVO vo = ReviewVO.builder()
				.review_title("리뷰 제목")
				.restaurant_name("맛집 이름")
				.review_content("리뷰 내용")
				.writer_name("작성자")
				.rating(5)
			    .region("서울")
				.build();
		
		service.register(vo);
	}

	@Test
	public void testGetList() {
		service.getList(new Criteria()).forEach(board -> log.info(board));
	}
}
