drop table book;
create table book(
  num number not null,
  title varchar2(50) not null,
  author varchar2(30) not null,
  company varchar2(50) not null,
  isbn varchar2(30) not null,
  count number not null,
  primary key(num)
);

create sequence book_num;

insert into book(num, title, author, company, isbn, count)
values(book_num.nextval, 'Spring', '박매일', '스마트','1111111', 3);
insert into book(num, title, author, company, isbn, count)
values(book_num.nextval, 'DB', '정상범', '데이터','2222222', 2);
insert into book(num, title, author, company, isbn, count)
values(book_num.nextval, 'JAVA', '장시영', '길벚','3333333', 4);
insert into book(num, title, author, company, isbn, count)
values(book_num.nextval, 'WEB', '차현석', '이지스퍼블리싱','4444444', 3);
insert into book(num, title, author, company, isbn, count)
values(book_num.nextval, 'HTML', '김지훈', '최고봉','5555555', 4);

select * from BOOK;