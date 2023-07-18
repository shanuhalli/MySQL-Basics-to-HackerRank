Create database paypal ;
use paypal ;

Create table accountmaster(
UserId int,
Transactiontype varchar(500),
Amount double 
) ;

Insert into accountmaster
values(100,'Deposit',300000),
      (100,'Deposit',300000),
      (100,'Withdraw',100000),
      (101,'Deposit',100000),
      (101,'Deposit',100000),
      (101,'Withdraw',50000) ,
      (102,'Deposit',200000),
      (102,'Deposit',20000),
      (102,'Withdraw',150000) ;