-- 생성자 Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   위치:        2025-08-11 15:52:40 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cart (
    cartno          NUMBER NOT NULL,
    userid          VARCHAR2(20 BYTE) NOT NULL,
    prodno          NUMBER(6) NOT NULL,
    cartprodcount   NUMBER DEFAULT 1,
    cartprodcount_1 DATE NOT NULL
);

ALTER TABLE cart ADD CONSTRAINT cart_pk PRIMARY KEY ( cartno );

CREATE TABLE category (
    cateno   NUMBER(2) NOT NULL,
    catename VARCHAR2(100 BYTE) NOT NULL
);

ALTER TABLE category ADD CONSTRAINT category_pk PRIMARY KEY ( cateno );

CREATE TABLE orders (
    orderno         CHAR(11 BYTE) NOT NULL,
    userid          VARCHAR2(20 BYTE) NOT NULL,
    ordertotalprice NUMBER NOT NULL,
    orderaddress    VARCHAR2(200) NOT NULL,
    orderstatus     NUMBER DEFAULT 0,
    orderdate       DATE NOT NULL
);

ALTER TABLE orders ADD CONSTRAINT orders_pk PRIMARY KEY ( orderno );

CREATE TABLE ordersitem (
    itemno       NUMBER NOT NULL,
    orderno      CHAR(11 BYTE) NOT NULL,
    prodno       NUMBER(6) NOT NULL,
    itemprice    NUMBER NOT NULL,
    itemdiscount NUMBER NOT NULL,
    itemcount    NUMBER DEFAULT 1
);

ALTER TABLE ordersitem ADD CONSTRAINT ordersitem_pk PRIMARY KEY ( itemno );

CREATE TABLE point (
    pointno   NUMBER NOT NULL,
    userid    VARCHAR2(20 BYTE) NOT NULL,
    point     NUMBER NOT NULL,
    "desc"    VARCHAR2(100 BYTE) NOT NULL,
    pointdate DATE NOT NULL
);

ALTER TABLE point ADD CONSTRAINT point_pk PRIMARY KEY ( pointno );

CREATE TABLE product (
    prodno       NUMBER(6) NOT NULL,
    cateno       NUMBER(2) NOT NULL,
    sellerno     NUMBER(5),
    prodname     VARCHAR2(200) NOT NULL,
    prodstock    NUMBER DEFAULT 0,
    prodprice    NUMBER NOT NULL,
    prodsold     NUMBER DEFAULT 0,
    proddiscount NUMBER DEFAULT 0
);
ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( prodno );
--DROP TABLE product CASCADE CONSTRAINTS;

CREATE TABLE seller (
    sellerno NUMBER(5) NOT NULL,
    company  VARCHAR2(100) NOT NULL,
    tel      VARCHAR2(20) NOT NULL,
    manager  VARCHAR2(20) NOT NULL,
    address  VARCHAR2(100) NOT NULL
);
ALTER TABLE seller ADD CONSTRAINT seller_pk PRIMARY KEY ( sellerno );

CREATE TABLE "User" (
    userid  VARCHAR2(20 BYTE) NOT NULL,
    name    VARCHAR2(20 BYTE) NOT NULL,
    birth   CHAR(10 BYTE) NOT NULL,
    gender  CHAR(1 BYTE) NOT NULL,
    hp      CHAR(13 BYTE) NOT NULL,
    email   VARCHAR2(100 BYTE),
    point   NUMBER DEFAULT 0,
    "level" NUMBER DEFAULT 1,
    address VARCHAR2(100 BYTE),
    regdate DATE NOT NULL
);

ALTER TABLE "User" ADD CONSTRAINT user_pk PRIMARY KEY ( userid );

ALTER TABLE "User" ADD CONSTRAINT user__un UNIQUE ( hp,
                                                    email );

ALTER TABLE cart
    ADD CONSTRAINT cart_product_fk FOREIGN KEY ( prodno )
        REFERENCES product ( prodno );

ALTER TABLE cart
    ADD CONSTRAINT cart_user_fk FOREIGN KEY ( userid )
        REFERENCES "User" ( userid );

ALTER TABLE orders
    ADD CONSTRAINT orders_user_fk FOREIGN KEY ( userid )
        REFERENCES "User" ( userid );

ALTER TABLE ordersitem
    ADD CONSTRAINT ordersitem_orders_fk FOREIGN KEY ( orderno )
        REFERENCES orders ( orderno );

ALTER TABLE ordersitem
    ADD CONSTRAINT ordersitem_product_fk FOREIGN KEY ( prodno )
        REFERENCES product ( prodno );

ALTER TABLE point
    ADD CONSTRAINT point_user_fk FOREIGN KEY ( userid )
        REFERENCES "User" ( userid );

ALTER TABLE product
    ADD CONSTRAINT product_category_fk FOREIGN KEY ( cateno )
        REFERENCES category ( cateno );

ALTER TABLE product
    ADD CONSTRAINT product_seller_fk FOREIGN KEY ( sellerno )
        REFERENCES seller ( sellerno );

CREATE SEQUENCE cart_cartno_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER cart_cartno_trg BEFORE
    INSERT ON cart
    FOR EACH ROW
    WHEN ( new.cartno IS NULL )
BEGIN
    :new.cartno := cart_cartno_seq.nextval;
END;
/

CREATE SEQUENCE ordersitem_itemno_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER ordersitem_itemno_trg BEFORE
    INSERT ON ordersitem
    FOR EACH ROW
    WHEN ( new.itemno IS NULL )
BEGIN
    :new.itemno := ordersitem_itemno_seq.nextval;
END;
/

CREATE SEQUENCE point_pointno_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER point_pointno_trg BEFORE
    INSERT ON point
    FOR EACH ROW
    WHEN ( new.pointno IS NULL )
BEGIN
    :new.pointno := point_pointno_seq.nextval;
END;
/

insert into "User" values ('user1', '김유신', '1976-01-21', 'M', '010-1101-1976', 'kimys@naver.com', 7000, 1, '서울', '2022-01-10 10:50:12');
insert into "User" values ('user2', '계백', '1975-06-11', 'M', '010-1102-1975', null, 5650, 1, '서울', '2022-01-10 10:50:12');
insert into "User" values ('user3', '김춘추', '1989-05-30', 'M', '010-1103-1989', null, 4320, 2, '서울', '2022-01-10 10:50:12');
insert into "User" values ('user4', '이사부', '1979-04-13', 'M', '010-2101-1979', 'leesabu@gmail.com', 0, 1, '서울', '2022-01-10 10:50:12');
insert into "User" values ('user5', '장보고', '1966-09-12', 'M', '010-2104-1966', 'jangbg@naver.com', 3000, 4, '대전', '2022-01-10 10:50:12');
insert into "User" values ('user6', '선덕여왕', '1979-07-28', 'M', '010-3101-1979', 'gueen@naver.com', 15840, 2, '대전', '2022-01-10 10:50:12');
insert into "User" values ('user7', '강감찬', '1984-06-15', 'F', '010-4101-1984', 'kang@daum.net', 3610, 0, '대구', '2022-01-10 10:50:12');
insert into "User" values ('user8', '신사임당', '1965-10-21', 'M', '010-5101-1965', 'sinsa@gmail.com', 0, 1, '대구', '2022-01-10 10:50:12');
insert into "User" values ('user9', '이이', '1972-11-28', 'F', '010-6101-1972', 'leelee@nate.com', 0, 3, '부산', '2022-01-10 10:50:12');
insert into "User" values ('user10', '허난설현', '1992-09-07', 'F', '010-7103-1992', null, 0, 3, '광주', '2022-01-10 10:50:12');


insert into Point values (1, 'user1', 1000, '회원가입 1000 적립', '2022-01-10 10:50:12');
insert into Point values (2, 'user1', 6000, '상품구매 5% 적립', '2022-01-10 10:50:12');
insert into Point values (3, 'user3', 2820, '상품구매 5% 적립', '2022-01-10 10:50:12');
insert into Point values (4, 'user7', 3610, '상품구매 5% 적립', '2022-01-10 10:50:12');
insert into Point values (5, 'user5', 3000, '이벤트 응모 3000 적립', '2022-01-10 10:50:12');
insert into Point values (6, 'user2', 1000, '회원가입 1000 적립', '2022-01-10 10:50:12');
insert into Point values (7, 'user2', 2000, '이벤트 응모 2000 적립', '2022-01-10 10:50:12');
insert into Point values (8, 'user2', 2650, '상품구매 5% 적립', '2022-01-10 10:50:12');
insert into Point values (9, 'user3', 1500, '이벤트 응모 1500 적립', '2022-01-10 10:50:12');
insert into Point values (10, 'user6', 15840, '상품구매 2% 적립', '2022-01-10 10:50:12');


insert into Seller values (10001, '(주)다팔아', '02-201-1976', '정우성', '서울');
insert into Seller values (10002, '판매의민족', '02-102-1975', '이정재', '서울');
insert into Seller values (10003, '멋남', '031-103-1989', '원빈', '경기');
insert into Seller values (10004, '스타일살아', '032-201-1979', '이나영', '경기');
insert into Seller values (10005, '(주)삼성전자', '02-214-1966', '장동건', '서울');
insert into Seller values (10006, '복실이옷짱', '051-301-1979', '고소영', '부산');
insert into Seller values (10007, '컴퓨존(주)', '055-401-1984', '유재석', '대구');
insert into Seller values (10008, '(주)LG전자', '02-511-1965', '강호동', '서울');
insert into Seller values (10009, '굿바디스포츠', '070-6101-1972', '조인성', '부산');
insert into Seller values (10010, '누리푸드', '051-710-1992', '강동원', '부산');


insert into Category values (10, '여성의류패션');
insert into Category values (11, '남성의류패션');
insert into Category values (12, '식품·생필품');
insert into Category values (13, '취미·반려견');
insert into Category values (14, '홈·문구');
insert into Category values (15, '자동차·공구');
insert into Category values (16, '스포츠·건강');
insert into Category values (17, '컴퓨터·가전·디지털');
insert into Category values (18, '여행');
insert into Category values (19, '도서');

--alter table product modify prodName varchar2(100);


insert into product values (100101, 11, 10003, '반팔티 L~2XL', 869, 25000, 132, 20);
insert into product values (100110, 10, 10004, '트레이닝 통바지', 1602, 38000, 398, 15);
insert into product values (110101, 10, 10003, '신상 여성운동화', 160, 76000, 40, 5);
insert into product(prodNo, cateNo, sellerNo, prodName, prodPrice, prodSold, prodDiscount) values (120101, 12, 10010, '암소 1등급 구이셋트 1.2kg', 150000, 87, 15);
insert into product(prodNo, cateNo, sellerNo, prodName, prodPrice, prodSold, prodDiscount) values (120103, 12, 10010, '바로구이 부채살 250g', 21000, 61, 10);
insert into product values (130101, 13, 10006, '[ANF] 식스프리 강아지 사료', 58, 56000, 142, 0);
insert into product values (130112, 13, 10006, '중대형 사계절 강아지옷', 120, 15000, 80, 0);
insert into product(prodNo, cateNo, sellerNo, prodName, prodPrice, prodSold, prodDiscount) values (141001, 14, 10001, '라떼 2인 소파/방수 패브릭', 320000, 42, 0);
insert into product values (170115, 17, 10007, '지포스 3080 그래픽카드', 28, 900000, 12, 12);
insert into product values (160103, 16, 10009, '치닝디핑 33BR 철봉', 21, 120000, 28, 0);


insert into Orders values ('22010210001', 'user2', 52300, '서울시 마포구 121', 1, '2022-01-10 10:50:12');
insert into Orders values ('22010210002', 'user3', 56700, '서울시 강남구 21-1', 1, '2022-01-10 10:50:12');
insert into Orders values ('22010210010', 'user4', 72200, '서울시 강서구 큰대로 38', 2, '2022-01-10 10:50:12');
insert into Orders values ('22010310001', 'user5', 127000, '경기도 광주시 초월로 21', 1, '2022-01-10 10:50:12');
insert into Orders values ('22010310100', 'user1', 120000, '경기도 수원시 120번지', 0, '2022-01-10 10:50:12');
insert into Orders values ('22010410101', 'user6', 792000, '부산시 남구 21-1', 2, '2022-01-10 10:50:12');
insert into Orders values ('22010510021', 'user7', 92200, '부산시 부산진구 56 10층', 4, '2022-01-10 10:50:12');
insert into Orders values ('22010510027', 'user8', 112000, '대구시 팔달로 19', 3, '2022-01-10 10:50:12');
insert into Orders values ('22010510031', 'user10', 792000, '대전시 한밭로 24-1', 2, '2022-01-10 10:50:12');
insert into Orders values ('22010710110', 'user9', 94500, '광주시 충열로 11', 1, '2022-01-10 10:50:12');


insert into OrdersItem values (1, '22010210001', 100110, 38000, 15, 1);
insert into OrdersItem values (2, '22010210001', 100101, 25000, 20, 1);
insert into OrdersItem values (3, '22010210002', 120103, 21000, 10, 3);
insert into OrdersItem values (4, '22010310001', 130112, 15000, 0, 1);
insert into OrdersItem values (5, '22010310001', 130101, 56000, 0, 2);
insert into OrdersItem values (6, '22010210010', 110101, 76000, 5, 1);
insert into OrdersItem values (7, '22010310100', 160103, 120000, 0, 1);
insert into OrdersItem values (8, '22010410101', 170115, 900000, 12, 1);
insert into OrdersItem values (9, '22010510021', 110101, 76000, 5, 1);
insert into OrdersItem values (10, '22010510027', 130101, 56000, 0, 2);
insert into OrdersItem values (11, '22010510021', 100101, 25000, 20, 1);
insert into OrdersItem values (12, '22010510031', 170115, 900000, 12, 1);
insert into OrdersItem values (13, '22010710110', 120103, 21000, 10, 5);

insert into Cart values (1, 'user1', 100101, 1, '2022-01-10 10:50:12');
insert into Cart values (2, 'user1', 100110, 2, '2022-01-10 10:50:12');
insert into Cart values (3, 'user3', 120103, 1, '2022-01-10 10:50:12');
insert into Cart values (4, 'user4', 130112, 1, '2022-01-10 10:50:12');
insert into Cart values (5, 'user5', 130101, 1, '2022-01-10 10:50:12');
insert into Cart values (6, 'user2', 110101, 3, '2022-01-10 10:50:12');
insert into Cart values (7, 'user2', 160103, 1, '2022-01-10 10:50:12');
insert into Cart values (8, 'user2', 170115, 1, '2022-01-10 10:50:12');
insert into Cart values (9, 'user3', 110101, 1, '2022-01-10 10:50:12');
insert into Cart values (10, 'user6', 130101, 1, '2022-01-10 10:50:12');

-- SQL 문제
--문제1. 모든 장바구니 내역에서 고객명, 상품명, 상품수량을 조회하시오. 단 상품수량 2건이상만 조회 할 것
SELECT name, prodName, cartProdCount FROM Cart a
JOIN "User" b ON a.userId = b.userId
JOIN Product c ON a.prodNo = c.prodNo
WHERE cartProdCount >= 2;


--문제2. 모든 상품내역에서 상품번호, 상품카테고리명, 상품명, 상품가격, 판매자이름, 판매자 연락처를 조회하시오.
SELECT prodNo, cateName,prodName, prodPrice, manager, tel FROM Product a
JOIN Category b ON a.cateNo = b.cateNo
JOIN Seller c ON a.sellerNo = c.sellerNo;

--문제3. 모든 고객의 아이디, 이름, 휴대폰, 현재포인트, 적립포인트 총합을 조회하시오. 단 적립포인트 내역이 없으면 0으로 출력
SELECT a.userId, a.name, a.hp, a.point, NVL(SUM(b.point), 0) AS 적립포인트_총합
FROM "User" a
LEFT JOIN Point b ON a.userId = b.userId
GROUP BY a.userId, a.name, a.hp, a.point;

SELECT a.userId, a.name, a.hp, a.point, SUM(b.point) AS 적립포인트_총합
FROM "User" a
LEFT JOIN Point b ON a.userId = b.userId
GROUP BY a.userId, a.name, a.hp, a.point;

--문제4. 모든 주문의 주문번호, 주문자 아이디, 고객명, 주문가격, 주문일자를 조회하시오.
--       단 주문금액에 10만원 이상, 큰 금액순으로 조회, 금액이 같으면 이름이 사전순으로 될것
SELECT a.orderNo, a.userId, b.name, a.orderTotalPrice, a.orderDate FROM Orders a
JOIN "User" b ON a.userId = b.userId
WHERE orderTotalPrice >= 100000
ORDER BY orderTotalPrice DESC, b.name ASC;

--문제5. 모든 주문의 주문번호, 주문자 아이디, 고객명, 상품명, 주문일자를 조회하시오. 주문번호는 중복없이 상품명은 구분자 ,로 나열할것
select a.orderNo, max(c.userId) as userID, max(c.name) as userName, 
    listagg(d.prodName, ',') within group (order by d.prodName) as 상품명,
    max(a.orderDate) as orderDate
from orders a
join ordersitem b on a.orderno = b.orderno
join "User" c on a.userId = c.userId
join product d on b.prodno = d.prodno
group by a.orderno;

--문제6. 모든 상품의 상품번호, 상품명, 상품가격, 할인율, 할인된 가격을 조회하시오.
select prodno, prodname, prodprice, proddiscount, floor(prodprice * (1-proddiscount/100)) as 할인가
from product a;

--문제7. 고소영 판매자가 판매하는 모든 상품의 상품번호, 상품명, 상품가격, 재고수량, 판매자이름을 조회하시오.
select a.prodno, a.prodname, a.prodprice, b.manager from product a
join seller b on a.sellerno=b.sellerno
where b.manager='고소영';


--문제8. 아직 상품을 판매하지 않은 판매자의 판매자번호, 판매자상호, 판매자 이름, 판매자 연락처를 조회하시오.
select a.sellerno, a.company, a.manager, a.tel from seller a
left join product b on a.sellerno = b.sellerno
where prodno is null;

--문제9. 모든 주문상세내역 중 개별 상품 가격과 개수 그리고 할인율이 적용된 가격을 구하고 그 가격으로
--       주문별 총합을 구해서 주문별 총합이 10만원이상 그리고 큰 금액 순으로 주문번호, 최종총합을 조회하시오. 
select orderno, sum(할인가*itemCount) as 최종총합
from(
    select orderno, itemprice, itemdiscount, itemcount, floor(itemprice*(1-itemdiscount/100)*itemcount) as 할인가
    from ordersitem
) a
group by orderno
having sum(할인가*itemcount)>=100000
order by sum(할인가*itemcount)desc;


--문제10. 장보고 고객이 주문했던 모든 상품명을 고객명, 상품명으로 조회하시오. 
--        단 상품명은 중복 안됨, 상품명은 구분자 , 로 나열
select b.name, listagg(d.prodname, ',') within group (order by d.prodname) as 상품목록
from orders a
join "User" b on a.userid = b.userid
join ordersitem c on a.orderno = c.orderno
join product d on d.prodno = c.prodno
where b.name='장보고'
group by b.name;