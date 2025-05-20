package org.zerock.mapper;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ReviewVO;
import org.zerock.domain.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewMapperTests {

	@Autowired
	private ReviewMapper mapper;
	
	@Test
	public void testRead() {       //단건 데이터 조회
		log.info(mapper.read(1L));
	}
	
	@Test
	public void testGetList() {    //전체 데이터 조회
		List<ReviewVO> list = mapper.getList();
		
		for(ReviewVO vo : list) {
			log.info(vo);
		}
	}
	
	@Test
	public void testInsert() {
		ReviewVO vo = ReviewVO.builder()
				.review_title("test review_title")
				.restaurant_name("test restaurant_name")
				.review_content("test review_content")
				.writer_name("test writer_name")
				.rating(5)
			    .region("서울")
				.build();
		
		mapper.insert(vo);
	}
/*	
	@Test
	public void testInsertSelectKey() {
		ReviewVO vo = ReviewVO.builder()
				.title("test title")
				.content("test content")
				.writer("test writer")
				.build();
		
		mapper.insertSelectKey(vo);
	}*/
	
	@Test
	public void testDelete() {
		int result = mapper.delete(1L);
		log.info("result >> " + result);
	}
	
	@Test
	public void testUpdate() {
		ReviewVO vo = ReviewVO.builder()
				.review_title("수정 테스트 완료")
				.restaurant_name("맛집 이름 수정 테스트")
				.review_content("리뷰 내용 수정 테스트")
				.rating(1)
			    .region("제주")
			    .review_id(2L)
				.build();
	
		int result = mapper.update(vo);
		log.info("result >> " + result);
	}
/*	
	@Test
	public void testPaging() {
		List<ReviewVO> list = mapper.getListWithPaging(new Criteria(2,10));
		
		list.forEach(board -> log.info(board));
	}
	
	@Test
	public void testSearch() {
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("T", "스프링");
		map.put("C", "수정 내용");
		map.put("W", "테스트");
		
		//   key,      value
		Map<String, Map<String, String>> outer = new HashMap<>();  //outer가 위 값을 다 가지고 있다(map.put("T", "어버이날");,map.put("C", "은혜");,map.put("W", "홍길동");)
		
		outer.put("map", map);
//		log.info(outer.get("map"));
//		log.info((outer.get("map")).get("T"));
		List<ReviewVO> list = mapper.searchTest(outer);
		
		log.info("------------------------");
		log.info(list);
	}
	
	@Test
	public void testSearch2() {
		Criteria cri = new Criteria();
		
		cri.setKeyword("수정");
		cri.setType("TW");  //type를 배열값으로
		
		mapper.getListWithPaging(cri).forEach(board -> log.info(board));
	}
	
	@Test
	public void testTotalCount() {
		Criteria cri = new Criteria();
		
		cri.setKeyword("수정");
		cri.setType("TW");  
		
		log.info("total count : ");
		log.info(mapper.getTotalCount(cri));
	}	
	*/
}
