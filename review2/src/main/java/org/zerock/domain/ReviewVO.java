package org.zerock.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
 * create table review_board(
    review_id number,
    review_title varchar2(200) not null,
    restaurant_name varchar2(200) not null,
    review_content varchar2(2000) not null,
    writer_name varchar2(50) not null,
    register_date date default sysdate,    --작성일
    rating number,
    count number,
    region varchar2(50)  
);
*/

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVO {
	private Long review_id;
	private String review_title;
	private String restaurant_name;
	private String review_content;
	private String writer_name;
	private Date register_date;
	private int rating;
	private int count;
	private String region;

}
