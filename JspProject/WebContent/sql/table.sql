create table okky_admin(
    admin_num number(3) primary key,
    admin_id varchar2(50) not null,
    admin_pwd varchar2(50) not null
);

create table okky_member(
    mem_num number(4) primary key,
    mem_id varchar2(50) not null,
    mem_nick varchar2(100) not null,
    mem_pwd varchar2(100) not null,
    mem_image varchar2(100) not null,
    mem_tag varchar2(1000),
    mem_email varchar2(100) not null,
    mem_emailCheck varchar2(10) default 'yes'
);

create table okky_tag(
    tag_num number(4) primary key,
    tag_name varchar2(100) not null,
    tag_hit number(5) default 1
);

create table okky_comment(
    com_num number(4) primary key,
    com_writer varchar2(100) not null,
    com_content varchar2(1000) not null,
    com_board number(5) not null,
    com_hit number(4) default 0,
    com_regdatae date,
    constraint fk_comment foreign key(com_board) references okky_board(board_num) on delete cascade
);

create table okky_board(
    board_num number(5) primary key,
    board_title varchar2(200) not null,
    board_writer varchar2(100) not null,
    board_content varchar2(1000) not null,
    board_tag varchar2(1000),
    board_hit number(5) default 0,
    board_like number(5) default 0,
    board_scrap number(5) default 0,
    board_category varchar2(100) not null
);