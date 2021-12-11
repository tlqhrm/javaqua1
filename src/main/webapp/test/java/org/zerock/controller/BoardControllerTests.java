package org.zerock.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = {org.zerock.config.RootConfig.class, org.zerock.config.ServletConfig.class})
@Log4j
public class BoardControllerTests {
	
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mokMvc;
	
	
	@Before
	public void setup() {
		this.mokMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception{
		
		log.info(
				mokMvc.perform(MockMvcRequestBuilders.get("/board/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
		
	}
	
//	@Test
//	public void testRegister() throws Exception{
//		
//		String resultPage = mokMvc.perform(MockMvcRequestBuilders.post("/board/register")
//							.param("title", "테스트 새글 제목")
//							.param("content", "테스트 새글 내용")
//							.param("writer", "user00")
//						).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//				
//	}
	
//	@Test
//	public void testGet() throws Exception{
//		
//		log.info(mokMvc.perform(MockMvcRequestBuilders
//				.get("/board/get")
//				.param("bno", "12"))
//				.andReturn()
//				.getModelAndView().getModelMap());
//	}
	
//	@Test
//	public void testModify() throws Exception{
//		
//		String resultPage = mokMvc.perform(MockMvcRequestBuilders.post("/board/modify")
//				.param("bno", "42")
//				.param("title", "수정된 테스트 새글 제목")
//				.param("content", "수정된 테스트 새글 내용")
//				.param("writer", "user00"))
//			.andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}
	
//	@Test
//	public void testRemove() throws Exception{
//		
//		String resultPage = mokMvc.perform(MockMvcRequestBuilders.post("/board/remove")
//				.param("bno", "42")
//				).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}
}
