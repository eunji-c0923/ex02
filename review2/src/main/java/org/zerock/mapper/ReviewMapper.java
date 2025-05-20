package org.zerock.mapper;

import java.util.List;
import java.util.Map;

import org.zerock.domain.ReviewVO;
import org.zerock.domain.Criteria;

public interface ReviewMapper {

	public ReviewVO read(Long review_id);
	
	public List<ReviewVO> getList();
	
	public void insert(ReviewVO review);  //DB에 데이터 저장
	
	public void insertSelectKey(ReviewVO review);  //DB에 저장할 때 등록번호 확인
	
	public int delete(Long review_id);
	
	public int update(ReviewVO review);
	
	public List<ReviewVO> getListWithPaging(Criteria cri);  
	
	public int getTotalCount(Criteria cri);
	
	public List<ReviewVO> searchTest(Map<String, Map<String,String>> map);
}
