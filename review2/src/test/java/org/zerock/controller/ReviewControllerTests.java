package org.zerock.controller;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml", 
	"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
@WebAppConfiguration  
public class ReviewControllerTests {

	@Autowired  //Web 관련 bean(메모리에 생성된 객체) 관리
	private WebApplicationContext ctx;
	
	//server 실행하지 않고도 test 가능(HTTP 요청과 응답을 시뮬레이션하기 위한 도구)
	private MockMvc mockMvc;   
	
	@Before  
	//Spring MVC 애플리케이션에서 통합 테스트 수행, 
	//실제 서버를 실행하지 않고 컨트롤러 동작을 테스트 가능
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/review/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
	}
	
	@Test
	public void testRegister() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders
				.post("/review/register")
				.param("review_title", "20250520테스트")
				.param("restaurant_name", "새로운 가게")
				.param("review_content", "테스트 새글 내용")
				.param("writer_name", "20250520작성자")
				.param("rating", "4")
				.param("region", "서울"))
			.andReturn()
			.getResponse()  // 🔥 response 객체로 접근!
			.getRedirectedUrl();  // 🔥 redirect된 URL을 직접 확인

		log.info("==========> redirected to: " + resultPage);
	}
/*
	@Test
	public void testRegister() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders
				.post("/review/register")
				.param("review_title", "20250520테스트")
				.param("restaurant_name", "새로운 가게")
				.param("review_content", "테스트 새글 내용")			
				.param("writer_name", "20250520작성자"))
				.param("rating", "4")
				.param("region", "서울")
				.andReturn()
				.getModelAndView()
				.getViewName();
		
		log.info("==========>" + resultPage);
	}*/
	
	@Test
	public void testget() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/review/get")
				.param("review_id", "5"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
	}

	@Test
	public void testDelete() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders
				.post("/review/remove")
				.param("review_id", "103"))
				.andReturn()
				.getModelAndView()
				.getViewName();
		
		log.info("==========>" + resultPage);
	}
	
	
	@Test
	public void testModify() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders
				.post("/review/modify")
				.param("review_id", "3") 
				.param("review_title", "수정 삼겹살 끝판왕")
				.param("restaurant_name", "수정 고기 천국")
				.param("review_content", "수정 전체적으로 만족스러웠어요")
				.param("writer_name", "수정 서준")
				.param("rating", "5")
				.param("region", "서울"))
			.andReturn()
			.getModelAndView()
			.getViewName();
		
		log.info("==========> " + resultPage);
	}

}
