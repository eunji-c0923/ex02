package org.zerock.domain;

import lombok.Getter;
import lombok.ToString;

@Getter  //조회만 하겠다
@ToString
public class PageDTO {

	private int startPage;  //시작 페이지
	private int endPage;   //끝 페이지
	private boolean prev, next;  //이전, 다음 버튼
	
	//전체 레코드 개수
	private int total;
	
	//페이지 정보, 페이지당 레코드 개수
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {  //생성자
		this.cri = cri;                                              //pageNum=15&amount=10
		this.total = total;                                          //272
		
		//endPage            //무조건 올림
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;   //20, 30
		
		this.startPage = this.endPage - 9;                           //20-9=11, 30-9=21
		
		//전체 페이지 목록에서 마지막 페이지
		int realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount())); //28
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;                                  //28
		}
		
		this.prev = this.startPage > 1;                              //true, true
		this.next = this.endPage < realEnd;                          //true, false
	}
}
