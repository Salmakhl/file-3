Enter password: ******************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 8.0.19 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show database;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'database' at line 1
mysql> show databases ;
+--------------------+
| Database           |
+--------------------+
| centre_formation   |
| information_schema |
| isgi               |
| mysql              |
| performance_schema |
| sys                |
| test1              |
| test2              |
+--------------------+
8 rows in set (0.00 sec)

mysql> create dtabse test3 ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'dtabse test3' at line 1
mysql> create database test3;
Query OK, 1 row affected (0.46 sec)

mysql> create table stagiaire ;
ERROR 1046 (3D000): No database selected
mysql> use test3;
Database changed
mysql> create table stagiaire ;
ERROR 1113 (42000): A table must have at least 1 column
mysql> create table stagiaire (
    -> cose_stg int primary key ,
    -> nom_stg varchar(20) not null );
Query OK, 0 rows affected (0.85 sec)

mysql> show tables;
+-----------------+
| Tables_in_test3 |
+-----------------+
| stagiaire       |
+-----------------+
1 row in set (0.13 sec)

mysql> desc stagiaire ;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| cose_stg | int         | NO   | PRI | NULL    |       |
| nom_stg  | varchar(20) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
2 rows in set (0.06 sec)

mysql> insert into stagiaire
    -> values(1 , "yey"),
    -> (2, "wiwi");
Query OK, 2 rows affected (0.14 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from stagiaire ;
+----------+---------+
| cose_stg | nom_stg |
+----------+---------+
|        1 | yey     |
|        2 | wiwi    |
+----------+---------+
2 rows in set (0.00 sec)

mysql> insert into stagiaire
    -> values (3, "suiii"),
    -> (4 ,"sqrt");
Query OK, 2 rows affected (0.11 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from stagiaire ;
+----------+---------+
| cose_stg | nom_stg |
+----------+---------+
|        1 | yey     |
|        2 | wiwi    |
|        3 | suiii   |
|        4 | sqrt    |
+----------+---------+
4 rows in set (0.00 sec)

mysql> show tables ;
+-----------------+
| Tables_in_test3 |
+-----------------+
| stagiaire       |
+-----------------+
1 row in set (0.00 sec)

mysql> create table stg_copy like stagiaire ;
Query OK, 0 rows affected (0.31 sec)

mysql> show tables;
+-----------------+
| Tables_in_test3 |
+-----------------+
| stagiaire       |
| stg_copy        |
+-----------------+
2 rows in set (0.00 sec)

mysql> desc stg_copy ;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| cose_stg | int         | NO   | PRI | NULL    |       |
| nom_stg  | varchar(20) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> insert into stg_copy select * from stagiaire;
Query OK, 4 rows affected (0.08 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select *  from stg_copy;
+----------+---------+
| cose_stg | nom_stg |
+----------+---------+
|        1 | yey     |
|        2 | wiwi    |
|        3 | suiii   |
|        4 | sqrt    |
+----------+---------+
4 rows in set (0.00 sec)

mysql> select * from stagiaire ;
+----------+---------+
| cose_stg | nom_stg |
+----------+---------+
|        1 | yey     |
|        2 | wiwi    |
|        3 | suiii   |
|        4 | sqrt    |
+----------+---------+
4 rows in set (0.00 sec)

mysql> delete from stagiaire ;
Query OK, 4 rows affected (0.08 sec)

mysql> select * from stagiaire ;
Empty set (0.00 sec)

mysql> insert into stagiaire delect * from stg_copy ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'delect * from stg_copy' at line 1
mysql> insert into stagiaire select * from stg_copy ;
Query OK, 4 rows affected (0.06 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from stagiaire ;
+----------+---------+
| cose_stg | nom_stg |
+----------+---------+
|        1 | yey     |
|        2 | wiwi    |
|        3 | suiii   |
|        4 | sqrt    |
+----------+---------+
4 rows in set (0.00 sec)

mysql> delete from stg_copy where cose_stg=4 ;
Query OK, 1 row affected (0.16 sec)

mysql> select * from stg_copy ;
+----------+---------+
| cose_stg | nom_stg |
+----------+---------+
|        1 | yey     |
|        2 | wiwi    |
|        3 | suiii   |
+----------+---------+
3 rows in set (0.00 sec)

mysql> drop table stg_copy ;
Query OK, 0 rows affected (0.25 sec)

mysql> show tables ;
+-----------------+
| Tables_in_test3 |
+-----------------+
| stagiaire       |
+-----------------+
1 row in set (0.00 sec)

mysql> alter table stagiaire
    -> drop primary key ;
Query OK, 4 rows affected (0.83 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select *from stagiaire ;
+----------+---------+
| cose_stg | nom_stg |
+----------+---------+
|        1 | yey     |
|        2 | wiwi    |
|        3 | suiii   |
|        4 | sqrt    |
+----------+---------+
4 rows in set (0.00 sec)

mysql> desc stagiaire ;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| cose_stg | int         | NO   |     | NULL    |       |
| nom_stg  | varchar(20) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> alter table stagiaire
    -> rename column cose_stg to code_stg;
Query OK, 0 rows affected (0.58 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from stagiaire ;
+----------+---------+
| code_stg | nom_stg |
+----------+---------+
|        1 | yey     |
|        2 | wiwi    |
|        3 | suiii   |
|        4 | sqrt    |
+----------+---------+
4 rows in set (0.00 sec)

mysql> create table group (
    -> code_grp int primary key ,
    -> nom_grp varchar(10) not null unique ,
    -> filiere_grp varchar(10) not null ) ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'group (
code_grp int primary key ,
nom_grp varchar(10) not null unique ,
filiere' at line 1
mysql> use stagiaire ;
ERROR 1049 (42000): Unknown database 'stagiaire'
mysql> use test3 .
Database changed
mysql> CREAT TABLE GROUP (
    -> code_grp int primary key ,
    -> nom_grp varchar(10) not null inque ,
    -> filiere varchar(10) not null
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CREAT TABLE GROUP (
code_grp int primary key ,
nom_grp varchar(10) not null inqu' at line 1
mysql> CREATe TABLE GROUP (
    -> code_grp int primary key ,
    -> nom_grp varchar(10) not null unique ,
    -> filiere_grp varchar(10) not null ) ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'GROUP (
code_grp int primary key ,
nom_grp varchar(10) not null unique ,
filiere' at line 1
mysql> create table Groupe(
    ->     -> code_gr int primary key,
    ->     -> nom_gr varchar (10) not null unique ,
    ->     -> filiere_gr varchar (10) not null
    ->     -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> code_gr int primary key,
    -> nom_gr varchar (10) not null unique ,
    -> ' at line 2
mysql> CREATe TABLE GROUP (
    -> code_grp int primary key ,
    -> nom_grp varchar(10)  ,
    -> filiere_grp varchar(10) not null ) ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'GROUP (
code_grp int primary key ,
nom_grp varchar(10)  ,
filiere_grp varchar(10' at line 1
mysql> create table group(code_grp int primary key,nom_grp varchar(10),filiere_grp varchar(10) not null);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'group(code_grp int primary key,nom_grp varchar(10),filiere_grp varchar(10) not n' at line 1
mysql> create table grp(code_grp int primary key,nom_grp varchar(10),filiere_grp varchar(10) not null);
Query OK, 0 rows affected (0.55 sec)

mysql> show tables ;
+-----------------+
| Tables_in_test3 |
+-----------------+
| grp             |
| stagiaire       |
+-----------------+
2 rows in set (0.00 sec)

mysql> desc grp ;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| code_grp    | int         | NO   | PRI | NULL    |       |
| nom_grp     | varchar(10) | YES  |     | NULL    |       |
| filiere_grp | varchar(10) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> select * from grp ;
Empty set (0.00 sec)

mysql> insert into grp
    ->     -> values (1,'Dev104','info'),
    ->     -> (2,'gest109','gestion'),
    ->     -> (3,'dev108','info');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> values (1,'Dev104','info'),
    -> (2,'gest109','gestion'),
    -> (3,'dev108' at line 2
mysql> insert into grp
    -> values (1 , 'dev104' ,'developement'),
    ->  (2 , 'inf104' ,'info'),
    ->  (3 , 'GES114' ,'GESTION');
ERROR 1406 (22001): Data too long for column 'filiere_grp' at row 1
mysql> insert into grp
    -> values (1 , 'dev104' ,'dev'),
    ->  (2 , 'inf104' ,'info'),
    ->  (3 , 'GES114' ,'GESTION');
Query OK, 3 rows affected (1.68 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * from from group ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from group' at line 1
mysql> SELECT * from  group ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'group' at line 1
mysql> SELECT * from  grp ;
+----------+---------+-------------+
| code_grp | nom_grp | filiere_grp |
+----------+---------+-------------+
|        1 | dev104  | dev         |
|        2 | inf104  | info        |
|        3 | GES114  | GESTION     |
+----------+---------+-------------+
3 rows in set (0.00 sec)

mysql> alter table stagiaire
    -> add code_grp int ;
Query OK, 0 rows affected (0.76 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc stagiaire ;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| code_stg | int         | NO   |     | NULL    |       |
| nom_stg  | varchar(20) | NO   |     | NULL    |       |
| code_grp | int         | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> select * from stagiaire ;
+----------+---------+----------+
| code_stg | nom_stg | code_grp |
+----------+---------+----------+
|        1 | yey     |     NULL |
|        2 | wiwi    |     NULL |
|        3 | suiii   |     NULL |
|        4 | sqrt    |     NULL |
+----------+---------+----------+
4 rows in set (0.00 sec)

mysql> alter table stagaire
    -> add foreign key (code_grp) references grp (code_grp);
ERROR 1146 (42S02): Table 'test3.stagaire' doesn't exist
mysql> alter table stagiaire
    -> add foreign key (code_grp) references grp (code_grp);
Query OK, 4 rows affected (1.82 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> update stagiaire
    -> set code_grp = 3 where code_st = 1;
ERROR 1054 (42S22): Unknown column 'code_st' in 'where clause'
mysql> update stagiaire
    -> set code_grp = 3 where code_stg = 1;
Query OK, 1 row affected (0.77 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update stagiaire
    -> set code_grp = 1 where code_stg = 2;
Query OK, 1 row affected (0.79 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update stagiaire
    -> set code_grp = 2 where code_stg = 3;
Query OK, 1 row affected (0.36 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update stagiaire
    -> set code_grp = 1 where code_stg = 4;
Query OK, 1 row affected (0.42 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * from grp;
+----------+---------+-------------+
| code_grp | nom_grp | filiere_grp |
+----------+---------+-------------+
|        1 | dev104  | dev         |
|        2 | inf104  | info        |
|        3 | GES114  | GESTION     |
+----------+---------+-------------+
3 rows in set (0.00 sec)

mysql> select * from stagiaire;
+----------+---------+----------+
| code_stg | nom_stg | code_grp |
+----------+---------+----------+
|        1 | yey     |        3 |
|        2 | wiwi    |        1 |
|        3 | suiii   |        2 |
|        4 | sqrt    |        1 |
+----------+---------+----------+
4 rows in set (0.00 sec)

mysql> exit;