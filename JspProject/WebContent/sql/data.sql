

-- 멤버 테이블 레코드
insert into okky_member values(1, 'mem1@mem', 'mem1', '1111', 'test', 'mem1@gmail.com', sysdate, default, default, 0, 1);
insert into okky_member values(2, 'mem2@mem', 'mem2', '1111', 'test', 'mem2@gmail.com', sysdate, default, default, 100, 2);
insert into okky_member values(3, 'mem3@mem', 'mem3', '1111', 'test', 'mem3@gmail.com', sysdate, default, default, 300, 3);
insert into okky_member values(4, 'mem4@mem', 'mem4', '1111', 'test', 'mem4@gmail.com', sysdate, default, default, 1250, 4);
insert into okky_member values(5, 'mem5@mem', 'mem5', '1111', 'test', 'mem5@gmail.com', sysdate, default, default, 0, 5);
insert into okky_member values(6, 'mem6@mem', 'mem6', '1111', 'test', 'mem6@gmail.com', sysdate, default, default, 100, 6);
insert into okky_member values(7, 'mem7@mem', 'mem7', '1111', 'test', 'mem7@gmail.com', sysdate, default, default, 300, 7);
insert into okky_member values(8, 'mem8@mem', 'mem8', '1111', 'test', 'mem8@gmail.com', sysdate, default, default, 1250, 8);
insert into okky_member values(9, 'mem9@mem', 'mem9', '1111', 'test', 'mem9@gmail.com', sysdate, default, default, 0, 9);
insert into okky_member values(10, 'mem10@mem', 'mem10', '1111', 'test', 'mem10@gmail.com', sysdate, default, default, 100, 10);
insert into okky_member values(11, 'mem11@mem', 'mem11', '1111', 'test', 'mem11@gmail.com', sysdate, default, default, 300, 11);
insert into okky_member values(12, 'mem12@mem', 'mem12', '1111', 'test', 'mem12@gmail.com', sysdate, default, default, 1250, 12);
insert into okky_member values(9999, '1234@1234', '관리자', '1234', 'admin.png', '1234@1234', sysdate, default, default, 0, 0);


-- 카테고리 테이블 레코드
set define off;  -- & 대체문자 인식 해제
set scan off; 	-- define off가 안 먹힐 때 사용

insert into okky_category values(1, 'Q&A', 1, 0);
insert into okky_category values(2, 'Tech Q&A', 1, 1);
insert into okky_category values(3, 'Blockchain Q&A', 1, 2);
insert into okky_category values(4, 'Tech', 2, 0);
insert into okky_category values(5, 'IT News & 정보', 2, 1);
insert into okky_category values(6, 'Tips & 강좌', 2, 2);
insert into okky_category values(7, '커뮤니티', 3, 0);
insert into okky_category values(8, '공지사항', 3, 1);
insert into okky_category values(9, '사는얘기', 3, 2);
insert into okky_category values(10, '포럼', 3, 3);
insert into okky_category values(11, 'IT 행사', 3, 4);
insert into okky_category values(12, '기술 서적 리뷰', 3, 5);
insert into okky_category values(13, '정기모임/스터디', 3, 6);
insert into okky_category values(14, '학원/홍보', 3, 7);
insert into okky_category values(15, '칼럼', 4, 0);
insert into okky_category values(16, 'Jobs', 5, 0);
insert into okky_category values(17, '구인', 5, 1);
insert into okky_category values(18, '구직', 5, 2);
insert into okky_category values(19, '좋은회사/나쁜회사', 5, 3);


-- 게시판 테이블 레코드
insert into okky_board values(1, '제목1', 1, '내용1', default, default, default, 2, sysdate, default);
insert into okky_board values(2, '제목2', 2, '내용2', default, default, default, 2, sysdate, default);
insert into okky_board values(3, '제목3', 3, '내용3', default, default, default, 3, sysdate, default);
insert into okky_board values(4, '제목4', 4, '내용4', default, default, default, 5, sysdate, default);
insert into okky_board values(5, '제목5', 5, '내용5', default, default, default, 6, sysdate, default);
insert into okky_board values(6, '제목6', 6, '내용6', default, default, default, 8, sysdate, default);
insert into okky_board values(7, '제목7', 7, '내용7', default, default, default, 9, sysdate, default);
insert into okky_board values(8, '제목8', 8, '내용8', default, default, default, 10, sysdate, default);
insert into okky_board values(9, '제목9', 9, '내용9', default, default, default, 15, sysdate, default);
insert into okky_board values(10, '제목10', 10, '내용10', default, default, default, 14, sysdate, default);
insert into okky_board values(11, '제목11', 11, '내용11', default, default, default, 12, sysdate, default);
insert into okky_board values(12, '제목12', 12, '내용12', default, default, default, 12, sysdate, default);


-- 회사 테이블 레코드
insert into okky_company values(1, '회사1', '111-11-11111', 'test', '010-1111-1111', '대표1@gmail.com', 
'010-1111-2222', '담당자1@gmail.com', '담당자1', '5명 미만', '회사1.com', 'test', '회사1입니다.', '0', 1);
insert into okky_company values(2, '회사2', '222-22-22222', 'test', '010-2222-2222', '대표2@gmail.com', 
'010-2222-3333', '담당자2@gmail.com', '담당자2', '5 ~ 9명', '회사2.com', 'test', '회사2입니다.', '1', 2);
insert into okky_company values(3, '회사3', '333-33-33333', 'test', '010-3333-3333', '대표3@gmail.com', 
'010-3333-4444', '담당자3@gmail.com', '담당자3', '10 ~ 19명', '회사3.com', 'test', '회사3입니다.', '2', 3);
insert into okky_company values(4, '회사4', '444-44-44444', 'test', '010-4444-4444', '대표4@gmail.com', 
'010-4444-5555', '담당자4@gmail.com', '담당자4', '200명 미만', '회사4.com', 'test', '회사4입니다.', '2', 4);
insert into okky_company values(5, '회사5', '555-55-55555', 'test', '010-5555-5555', '대표5@gmail.com', 
'010-5555-6666', '담당자5@gmail.com', '담당자5', '5명 미만', '회사5.com', 'test', '회사5입니다.', '0', 5);
insert into okky_company values(6, '회사6', '666-66-66666', 'test', '010-6666-6666', '대표6@gmail.com', 
'010-6666-7777', '담당자6@gmail.com', '담당자6', '5 ~ 9명', '회사6.com', 'test', '회사6입니다.', '1', 6);
insert into okky_company values(7, '회사7', '777-77-77777', 'test', '010-7777-7777', '대표7@gmail.com', 
'010-7777-8888', '담당자7@gmail.com', '담당자7', '10 ~ 19명', '회사7.com', 'test', '회사7입니다.', '2', 7);
insert into okky_company values(8, '회사8', '888-88-88888', 'test', '010-8888-8888', '대표8@gmail.com', 
'010-8888-9999', '담당자8@gmail.com', '담당자8', '200명 미만', '회사8.com', 'test', '회사8입니다.', '2', 8);
insert into okky_company values(9, '회사9', '999-99-99999', 'test', '010-9999-9999', '대표9@gmail.com', 
'010-1010-1111', '담당자9@gmail.com', '담당자9', '5명 미만', '회사9.com', 'test', '회사9입니다.', '0', 9);
insert into okky_company values(10, '회사10', '101-10-10101', 'test', '010-1010-1010', '대표10@gmail.com', 
'010-1111-1212', '담당자10@gmail.com', '담당자10', '5 ~ 9명', '회사10.com', 'test', '회사10입니다.', '1', 10);
insert into okky_company values(11, '회사11', '111-11-11111', 'test', '010-1111-1111', '대표11@gmail.com', 
'010-1212-1313', '담당자11@gmail.com', '담당자11', '10 ~ 19명', '회사11.com', 'test', '회사11입니다.', '2', 11);
insert into okky_company values(12, '회사12', '121-12-12121', 'test', '010-1212-1212', '대표12@gmail.com', 
'010-1313-1414', '담당자12@gmail.com', '담당자12', '200명 미만', '회사12.com', 'test', '회사12입니다.', '2', 12);


-- 구인 테이블 레코드
insert into okky_job values(1, 1, 0, '2800', '3000', '서울', '프론트엔드', '0', '3');
insert into okky_job values(2, 2, 0, '2000', '3000', '서울', '프론트엔드', '5', '10');
insert into okky_job values(3, 3, 1, '200', '300', '서울', '프론트엔드', '0', '3');
insert into okky_job values(4, 4, 1, '180', '200', '서울', '프론트엔드', '0', '3');