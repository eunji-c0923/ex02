package org.zerock.service;

import java.util.List;

import org.zerock.domain.ReviewVO;
import org.zerock.domain.Criteria;

public interface ReviewService {

	public void register(ReviewVO review); //등록
	
	public ReviewVO get(Long review_id); //1건 조회
	
	public boolean modify(ReviewVO review); //수정
	
	public boolean remove(Long review_id); //삭제
	
	public List<ReviewVO> getList(Criteria cri); //전체 데이터 조회
	
	public int getTotal(Criteria cri); //전체 레코드 조회 or 조건 맞는 데이터 조회
}
