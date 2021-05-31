create table okky_admin(
    admin_num number(3) primary key,		-- 관리자 번호
    admin_id varchar2(50) not null,			-- 관리자 아이디
    admin_pwd varchar2(50) not null			-- 관리자 비밀번호
);

create table okky_member(
    mem_num number(4) primary key,				-- 회원 번호
    mem_id varchar2(50) not null,				-- 회원 아이디
    mem_nick varchar2(100) not null,			-- 회원 닉네임
    mem_pwd varchar2(100) not null,				-- 회원 비밀번호
    mem_image varchar2(100) not null,			-- 회원 프로필 이미지
    mem_tag varchar2(1000),						-- 회원 관심 태그
    mem_email varchar2(100) not null,			-- 회원 이메일
    mem_emailCheck varchar2(10) default 'yes'	-- 이메일 수신여부
);

create table okky_tag(
    tag_num number(4) primary key,			-- 태그 번호
    tag_name varchar2(100) not null,		-- 태그 이름
    tag_hit number(5) default 1				-- 누적된 태그 수
);

create table okky_comment(
    com_num number(4) primary key,			-- 댓글 번호
    com_writer varchar2(100) not null,		-- 댓글 작성자
    com_content varchar2(1000) not null,	-- 댓글 내용
    com_board number(5) not null,			-- 댓글을 작성한 게시글 번호
    com_hit number(4) default 0,			-- 댓글 추천 수 // like?
    com_regdate date,						-- 댓글 작성일자
    constraint fk_comment foreign key(com_board) references okky_board(board_num) on delete cascade
);

create table okky_board(
    board_num number(5) primary key,		-- 게시글 번호
    board_title varchar2(200) not null,		-- 게시글 제목
    board_writer varchar2(100) not null,	-- 게시글 작성자
    board_content varchar2(1000) not null,	-- 게시글 내용
    board_tag varchar2(1000),				-- 게시글 태그
    board_hit number(5) default 0,			-- 게시글 조회 수
    board_like number(5) default 0,			-- 게시글 추천 수
    board_scrap number(5) default 0,		-- 게시글 스크랩 수
    board_category varchar2(100) not null,	-- 게시글 카테고리
    board_regdate date						-- 게시글 작성일자
);