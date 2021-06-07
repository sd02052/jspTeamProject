create table okky_admin(
    admin_num number(3) primary key,		-- 관리자 번호
    admin_id varchar2(50) not null,			-- 관리자 아이디
    admin_pwd varchar2(50) not null			-- 관리자 비밀번호
);

create table okky_member(
    mem_num number(5) primary key,				-- 회원 번호
    mem_id varchar2(50) not null,				-- 회원 아이디
    mem_nick varchar2(100) not null,			-- 회원 닉네임
    mem_pwd varchar2(100) not null,				-- 회원 비밀번호
    mem_image varchar2(100) not null,			-- 회원 프로필 이미지
    mem_email varchar2(100) not null,			-- 회원 이메일
    mem_regdate date not null,					-- 회원 가입일
    mem_emailCheck varchar2(10) default 'yes',
    mem_check varchar2(20) default 'no',
    mem_score number(5) default 0,
    mem_company number(5) default 0
);

create table okky_category(
	cate_num number(5) primary key,			-- 카테고리 번호
	cate_name varchar2(100) not null,		-- 카테고리 이름
	cate_group number(5) not null,			-- 카테고리 그룹
	cate_step number(5) not null			-- 카테고리 단계
);

create table okky_board(
    board_num number(5) primary key,		-- 게시글 번호
    board_title varchar2(200) not null,		-- 게시글 제목
    board_writer number(5) not null,		-- 게시글 작성자
    board_content varchar2(1000) not null,	-- 게시글 내용
    board_hit number(5) default 0,			-- 게시글 조회 수
    board_like number(5) default 0,			-- 게시글 추천 수
    board_scrap number(5) default 0,		-- 게시글 스크랩 수
    board_category number(5) not null,	-- 게시글 카테고리
    board_regdate date,						-- 게시글 작성일자
    constraint fk_writer foreign key(board_writer) references okky_member(mem_num) on delete cascade,
    constraint fk_category foreign key(board_category) references okky_category(cate_num) on delete cascade
);

create table okky_tag(
    tag_num number(5) primary key,			-- 태그 번호
    tag_name varchar2(100) not null,		-- 태그 이름
    tag_target number(5) not null,			-- 태그가 적용된 게시물
    constraint fk_tag foreign key(tag_target) references okky_board(board_num) on delete cascade
);

create table okky_comment(
    com_num number(5) primary key,			-- 댓글 번호
    com_writer number(5) not null,			-- 댓글 작성자
    com_content varchar2(1000) not null,	-- 댓글 내용
    com_target number(5) not null,			-- 댓글을 작성한 게시글 번호
    com_like number(5) default 0,			-- 댓글 추천 수
    com_regdate date,						-- 댓글 작성일자
    com_selected varchar2(20) default 'no', -- 댓글 채택 여부
    constraint fk_target1 foreign key(com_target) references okky_board(board_num) on delete cascade,
    constraint fk_writer1 foreign key(com_writer) references okky_member(mem_num) on delete cascade
);

create table okky_like(
	like_num number(5) primary key,			-- 좋아요 번호
	like_target number(5) not null,			-- 좋아요 눌려진 타겟 번호
	like_writer number(5) not null,			-- 좋아요 누른 사람
	like_flag number(2) not null,			-- 좋아요 눌려진 타겟 종류(1:게시물, 2:댓글, 3:스크랩)
	constraint fk_target2 foreign key(like_target) references okky_board(board_num) on delete cascade,
    constraint fk_target3 foreign key(like_target) references okky_comment(com_num) on delete cascade
);

create table okky_follow(
	follow_num number(5) primary key,		-- 팔로우 번호
	follow_mem number(5) not null,			-- 팔로우 한 사람
	follow_target number(5) not null,		-- 팔로우 당한 사람
	constraint fk_mem foreign key(follow_mem) references okky_member(mem_num) on delete cascade,
	constraint fk_target foreign key(follow_target) references okky_member(mem_num) on delete cascade
);

create table okky_company(
	company_num number(5) primary key,				-- 회사 번호
	company_name varchar2(100) not null,			-- 회사 이름
	company_license_num number(30) not null,		-- 회사 사업자 등록번호
	company_license_image varchar2(200) not null,	-- 회사 사업자 등록증
	company_boss_phone varchar2(100) not null,		-- 회사 대표 번호
	company_boss_email varchar2(100) not null,		-- 회사 대표 메일
	company_charge_phone varchar2(100) not null,	-- 회사 담당자 번호
	company_charge_email varchar2(100) not null,	-- 회사 담당자 메일
	company_charge_name varchar2(100) not null,		-- 회사 담당자 이름
	company_emp number(4) default 0,				-- 회사 직원 수
	company_homepage varchar2(100),					-- 회사 홈페이지
	company_logo varchar2(200),						-- 회사 로고
	company_content varchar2(1000) not null,		-- 회사 소개
	company_check number(1) default 0				-- 회사 등록 인증 여부(0: 미수락, 1: 수락)
);

create table okky_job(
    job_num number(5) primary key,		    -- 구인 게시글 번호
	job_target number(5) not null,         -- 구인 게시글 연결 번호
    job_contract varchar2(50) not null,    -- 구인 계약형태(정규직/계약직)
    job_mincost number(10) not null,       -- 최소 급여
    job_maxcost number(10) not null,       -- 최대 급여
    job_location varchar2(50) not null,    -- 지역
    job_do varchar2(100) not null,         -- 직무
    job_mincareer number(10) not null,     -- 최소 경력
    job_maxcareer number(10) not null,     -- 최대 경력
    constraint fk_target4 foreign key(job_target) references okky_board(board_num) on delete cascade 
);