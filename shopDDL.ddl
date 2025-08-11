-- 생성자 Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   위치:        2025-08-11 10:48:11 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE customer (
    custid VARCHAR2(10 BYTE) NOT NULL,
    name   VARCHAR2(10 BYTE),
    hp     CHAR(13 BYTE),
    addr   VARCHAR2(100 BYTE),
    rdate  DATE
);

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( custid );

ALTER TABLE customer ADD CONSTRAINT customer__un UNIQUE ( hp );

CREATE TABLE "Order" (
    orderno      NUMBER NOT NULL,
    orderid      VARCHAR2(10 BYTE),
    orderproduct NUMBER,
    ordercount   NUMBER NOT NULL,
    orderdate    DATE NOT NULL
);

ALTER TABLE "Order" ADD CONSTRAINT order_pk PRIMARY KEY ( orderno );

CREATE TABLE product (
    prodno   NUMBER NOT NULL,
    prodname VARCHAR2(10 BYTE) NOT NULL,
    stock    NUMBER NOT NULL,
    price    NUMBER,
    company  VARCHAR2(20 BYTE) NOT NULL
);

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( prodno );

ALTER TABLE "Order"
    ADD CONSTRAINT order_customer_fk FOREIGN KEY ( orderid )
        REFERENCES customer ( custid );

ALTER TABLE "Order"
    ADD CONSTRAINT order_product_fk FOREIGN KEY ( orderproduct )
        REFERENCES product ( prodno );

INSERT INTO customer VALUES ('c101', '김유신', '010-1234-1001','경남 김해시', '2023-01-01');
INSERT INTO customer VALUES ('c102', '김춘추', '010-1234-1002','경남 경주시', '2023-01-02');
INSERT INTO customer VALUES ('c103', '장보고', '010-1234-1003','전남 완도군', '2023-01-03');
INSERT INTO customer VALUES ('c104', '강감찬', '010-1234-1004','서울시 관악구', '2023-01-04');
INSERT INTO customer VALUES ('c105', '이순신', '010-1234-1005','부산시 금정구', '2023-01-05');

insert into product values (1, '새우깡', 5000, 1500, '농심');
insert into product values (2, '초코파', 2500, 2500, '오리온');
insert into product values (3, '포카칩', 3600, 1700, '오리온');
insert into product values (4, '양파링', 1250, 1800, '농심');
insert into product values (5, '죠리퐁', 2200, null, '크라운');

INSERT INTO "Order" VALUES (1, 'c102', 3, 2, '2023-01-01 13:15:10');
insert into "Order" values (2, 'c101', 4, 1, '2023-01-01 13:15:12');
insert into "Order" values (3, 'c102', 1, 1, '2023-01-01 13:15:14');
insert into "Order" values (4, 'c103', 5, 5, '2023-01-01 13:15:16');
insert into "Order" values (5, 'c105', 2, 1, '2023-01-01 13:15:18');

-- 실습 6-3
-- 모든 주문의 주문번호, 주문한 고객명, 구문한 상품명, 주문수량, 주문일을 조회하시오.
SELECT
    o.orderNo,
    c.name,
    p.prodName,
    o.orderCount,
    o.orderDate
FROM "Order" o
JOIN Customer c on c.custid = o.orderId
JOIN Product p on p.prodNo = o.orderProduct;

-- 김유신이 주문한 상품의 주문번호, 상품번호, 상품명, 가격, 주문 수향, 주문일을 조회하시오
select
    o.orderNo,
    o.orderProduct,
    p.prodName,
    o.orderCount,
    o.orderDate
from "Order" o join Product p on p.prodNo = o.orderProduct
where o.orderId = (select custId from customer where name = '김유신');

-- 주문한 상품의 총 주문 금액을 조회하시오.
select sum(o.orderCount * p.price) as total_order_amount
from "Order" o
join product p
on o.orderProduct = p.prodNo;