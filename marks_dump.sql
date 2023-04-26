/* Student marks increase by %20 by using cursor */

delimiter //
create procedure marks_co()
begin
	declare vfinished int default 0;
	declare i int(10);
	declare n varchar(20);
	declare m int(10);
declare marks_cursor cursor for select * from marks;
declare continue handler for not found set vfinished=1;

open marks_cursor;
getdata:loop
     fetch  marks_cursor into i,n,m;
     if vfinished=1 then
     leave getdata;
     end if;
    set m=m+0.2*m;
    insert into marks_dump values(i,n,m);
    end loop getdata;
    close marks_cursor;
    end;
    //
    
    
database changed
mysql> select * from marks;
+------------+--------------+---------------+
| student_id | student_name | student_marks |
+------------+--------------+---------------+
|          1 | aniket       |            76 |
|          2 | yashraj      |            79 |
|          3 | rushi        |            56 |
|          4 | pranit       |            30 |
|          5 | roshan       |            61 |
+------------+--------------+---------------+
5 rows in set (0.01 sec)
mysql> call marks_co();
    -> //
Query OK, 0 rows affected (0.54 sec)

mysql> select *from marks_dump;
    -> //
+------------+--------------+---------------+
| student_id | student_name | student_marks |
+------------+--------------+---------------+
|          1 | aniket       |            91 |
|          2 | yashraj      |            95 |
|          3 | rushi        |            67 |
|          4 | pranit       |            36 |
|          5 | roshan       |            73 |
+------------+--------------+---------------+
5 rows in set (0.00 sec)




