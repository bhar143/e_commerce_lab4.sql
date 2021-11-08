create table Supplie(SUPP_ID int auto_increment primary key,SUPP_NAME varchar(50),
SUPP_CITY varchar(20), SUPP_PHONE bigint);

create table Customer(CUS_ID int auto_increment primary key,CUS_NAME varchar(50),CUS_PHONE bigint,
CUS_CITY varchar(20), CUS_GENDER varchar(1),SUPP_PHONE bigint);

create table Category(CAT_ID int auto_increment primary key, CAT_NAME varchar(50));

create table Product(PRO_ID int auto_increment primary key, PRO_NAME varchar(50), PRO_DESC varchar(50),
CAT_ID int, foreign key(CAT_ID)references category(CAT_ID));

create table Product_Details(PROD_ID int auto_increment primary key, PROD_AMOUNT varchar(30),
 PRO_ID int, foreign key(PRO_ID)
references product(PRO_ID),
SUPP_ID int,foreign key(SUPP_ID)references supplie(SUPP_ID), PRICE int);


create table Order_Details(ORD_ID int auto_increment primary key, ORD_AMOUNT int,DATE date,
CUS_ID int, foreign key(CUS_ID)references customer(CUS_ID), PROD_ID int,foreign key(PROD_ID)
references product_details(PROD_ID));

create table Rating(RAT_ID int auto_increment primary key, CUS_ID int,
foreign key(CUS_ID)references customer(CUS_ID),SUPP_ID int,
foreign key(SUPP_ID)references supplie(SUPP_ID),RAT_RATSTARS int);








insert into supplie(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)
values(1,'Rajesh Retails','Delhi',1234567890);
insert into supplie(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)
values(2,'Appario Ltd','Mumbai',2589631470);
insert into supplie(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)
values(3,'Knome products','Banglore',9785462315);
insert into supplie(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)
values(4,'Bansai Retails','Kochi',8975463285);
insert into supplie(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)
values(5,'Mittal Ltd','Lucknow',7898456532);

insert into customer(CUS_ID,CUS_NAME,SUPP_PHONE,CUS_CITY,CUS_GENDER)
values(1,'Aakash',9999999999,'Delhi','M');
insert into customer(CUS_ID,CUS_NAME,SUPP_PHONE,CUS_CITY,CUS_GENDER)
values(2,'Aman',9785463215,'Noida','M');
insert into customer(CUS_ID,CUS_NAME,SUPP_PHONE,CUS_CITY,CUS_GENDER)
values(3,'Neha',9999999999,'Mumbai','F');
insert into customer(CUS_ID,CUS_NAME,SUPP_PHONE,CUS_CITY,CUS_GENDER)
values(4,'Megha',9994562399,'Kolkata','F');
insert into customer(CUS_ID,CUS_NAME,SUPP_PHONE,CUS_CITY,CUS_GENDER)
values(5,'Pulkit',7895999999,'Lucknow','M');

insert into category(CAT_ID,CAT_NAME)values(1,'BOOKS');
insert into category(CAT_ID,CAT_NAME)values(2,'GAMES');
insert into category(CAT_ID,CAT_NAME)values(3,'GROCERIES');
insert into category(CAT_ID,CAT_NAME)values(4,'ELECTRONICS');
insert into category(CAT_ID,CAT_NAME)values(5,'CLOTHES');

insert into Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)values(1,'GTA V','DFJDJFDJFJF',2);
insert into Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)values(2,'TSHIRT','DFDFJDFJDKFD',5);
insert into Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)values(3,'ROG LAPTOP','DFNTTNTNTERND',4);
insert into Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)values(4,'OATS','REURENTBTOTH',3);
insert into Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)values(5,'HARRY POTTER','NBEMCTHTJTH',1);

insert into Product_Details(PROD_ID,PRO_ID,SUPP_ID,PRICE)values(1,1,2,1500);
insert into Product_Details(PROD_ID,PRO_ID,SUPP_ID,PRICE)values(2,3,5,30000);
insert into Product_Details(PROD_ID,PRO_ID,SUPP_ID,PRICE)values(3,5,1,3000);
insert into Product_Details(PROD_ID,PRO_ID,SUPP_ID,PRICE)values(4,2,3,2500);
insert into Product_Details(PROD_ID,PRO_ID,SUPP_ID,PRICE)values(5,4,1,1000);

insert into Order_Details(ORD_ID,ORD_AMOUNT,DATE,CUS_ID,PROD_ID)values(20,1500,'2021-10-12',3,5);
insert into Order_Details(ORD_ID,ORD_AMOUNT,DATE,CUS_ID,PROD_ID)values(25,30500,'2021-09-16',5,2);
insert into Order_Details(ORD_ID,ORD_AMOUNT,DATE,CUS_ID,PROD_ID)values(26,2000,'2021-10-05',1,1);
insert into Order_Details(ORD_ID,ORD_AMOUNT,DATE,CUS_ID,PROD_ID)values(30,3500,'2021-08-16',4,3);
insert into Order_Details(ORD_ID,ORD_AMOUNT,DATE,CUS_ID,PROD_ID)values(50,2000,'2021-10-06',2,1);

insert into Rating(RAT_ID,CUS_ID,SUPP_ID,RAT_RATSTARS)values(1,2,2,4);
insert into Rating(RAT_ID,CUS_ID,SUPP_ID,RAT_RATSTARS)values(2,3,4,3);
insert into Rating(RAT_ID,CUS_ID,SUPP_ID,RAT_RATSTARS)values(3,5,1,5);
insert into Rating(RAT_ID,CUS_ID,SUPP_ID,RAT_RATSTARS)values(4,1,3,2);
insert into Rating(RAT_ID,CUS_ID,SUPP_ID,RAT_RATSTARS)values(5,4,5,4);

select * from `order_details`;
select * from customer inner join order_details on `order_details`.CUS_ID=customer,CUS_ID;


select cg.cus_gender, COUNT(cus_gender) from (select cus_gender from customer c inner join `order_details`
o on o.CUS_ID=c.CUS_ID where o.ORD_AMOUNT>=3000) as cg group by cus_gender;

--- Display all the orders along with the product name ordered by a customer having Customer_id=2.
select * from `order_details` where CUS_ID=2;

select o.ORD_ID,o.ORD_AMOUNT,o.DATE,p.PRO_ID,p.PRO_NAME from `order_details` o inner join
 product p on p.PRO_ID=o.PROD_ID where o.CUS_ID=2;
 
 select o.ORD_ID,o.ORD_AMOUNT,o.DATE,p.PRO_ID,p.PRO_NAME from `order_details` o inner join
 product p on p.PRO_ID=o.PROD_ID and o.CUS_ID=2;

--- Display the Supplie details can supply more than one product.
select * from supplie;


select * from product;

select * from product_details;

select SUPP_ID,COUNT(PROD_ID) from product_details group by SUPP_ID;

select SUPP_ID,COUNT(PROD_ID) as products from product_details pd group by SUPP_ID;

select SUPP_ID from (select SUPP_ID,COUNT(PRO_ID) as products from product_details pd group by SUPP_ID)
as pd where pd.products >1;

select SUPP_ID from product_details group by SUPP_ID HAVING COUNT(PROD_ID) > 1;

select * from supplie where SUPP_ID in (select SUPP_ID from product_details 
group by SUPP_ID HAVING COUNT(PROD_ID) > 1);

--- Find the category of the product whose order amount is minimum.
select MIN(ORD_AMOUNT) from `order_details`;
select * from `order_details` where ORD_AMOUNT = (select MIN(ORD_AMOUNT) from `order_details`);

select c.CAT_NAME from product p inner join category c on c.CAT_ID= p.CAT_ID where p.PRO_ID in
 (select PRO_ID from `order_details` where ORD_AMOUNT = (select MIN(ORD_AMOUNT) from `order_details`)); 

--- Display the id and name of the product ordered after "2021-10-05".

select * from order_details where DATE > '2021-10-05';
select PROD_ID,PRO_NAME from product p inner join order_details o on o.PROD_ID = p.PRO_ID 
where o.DATE > '2021-10-05';

--- Print the top 3 supplie name and id and their rating on the basis of their rating along with the customer name who has given the rating.

select * from supplie s  inner join rating r on s. SUPP_ID = r.SUPP_ID order by r.RAT_RATSTARS DESC LIMIT 3;
select SUPP_ID, SUPP_NAME, CUS_NAME, SUPP.RAT_RATSTARS from (select supplie.SUPP_ID,
supplie.SUPP_NAME,rating.CUS_ID,rating.RAT_RATSTARS  from supplie inner join rating on
 supplie.SUPP_ID = rating.SUPP_ID order by rating.RAT_RATSTARS desc limit 3) as SUPP inner join
 customer on customer.CUS_ID = SUPP.CUS_ID;
 
--- Display customer name and gender whose names start or end with character 'A'. 

 select * from customer where CUS_NAME = 'A%' or '%A';
 select * from customer where CUS_GENDER = 'M';
 
--- Display the total order amount of the male customer.
 select sum(ORD_AMOUNT) from `order_details` o inner join customer c on c.CUS_ID = o.CUS_ID
 and c.CUS_GENDER = 'M';
 
 
 --- Displayall the customer left outer join with the orders.
 select c.CUS_ID,CUS_NAME,ORD_ID from customer c left OUTER join order_details o on o.CUS_ID = c.CUS_ID
 order by ORD_ID;
 select * from customer left OUTER join `order_details` on customer.CUS_ID = `order_details`.CUS_ID;
 
 ---- Create a stored procedure to display the Rating for a Supplie if any along with the Verdict on that rating if any like if rating > 4 then "Genuine Supplie" if rating > 2 "Average Supplie" else "Supplie should not be considered".
      
 call supplieRating();
 
 


