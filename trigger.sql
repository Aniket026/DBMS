/*
        NAME:-Aniket Borawake
        ROLL NO:26
        BATCH:-AS2
        TRIGGER update_patient_test_count TO UPDATE TEST COUNT IN patient TABLE WHEN A TEST IS DONE

*/

Delimiter $$
CREATE TRIGGER update_patient_test_count
AFTER INSERT ON Test
FOR EACH ROW
BEGIN
  UPDATE Patient
  SET test_count = test_count + 1
  WHERE pid = NEW.pid;
END $$
Delimiter ;


/*

        OUTPUT:
        
        TEST COUNT IN PATIENT TABLE GETS INCREASED FROM 2 TO 3 WHEN WE INSERT INTO TEST TABLE
        
select *from patient ;
+-----+----------+----------+------------+--------+---------------+------------+-------------+----------------------+------------+
| pid | f_name   | l_name   | dob        | gender | address       | phone      | blood_group | medical_history      | test_count |
+-----+----------+----------+------------+--------+---------------+------------+-------------+----------------------+------------+
|   1 | Yash     | jondhale | 2003-02-19 | Male   | Kolpewadi     | 9090905555 | AB+         | None                 |          2 |
|   2 | Swapnil  | Jadhav   | 2000-04-11 | Male   | SambhajiNagar | 9090905556 | B+          | None                 |          1 |
|   3 | Prashant | Hinge    | 2004-08-18 | Male   | Nashik        | 9090905557 | O+          | Asthma               |          1 |
|   4 | Adesh    | Avhad    | 1993-08-18 | Male   | Yeola         | 9090905501 | O+          | Skin conditions:Acne |          1 |
|   5 | Sonali   | Gore     | 2007-03-29 | Female | Satara        | 9090905553 | A+          | None                 |          1 |
+-----+----------+----------+------------+--------+---------------+------------+-------------+----------------------+------------+

 delimiter $$
 MySQL  localhost:33060+ ssl  hms  SQL > CREATE TRIGGER update_patient_test_count
                                      -> AFTER INSERT ON Test
                                      -> FOR EACH ROW
                                      -> BEGIN
                                      ->   UPDATE Patient
                                      ->   SET test_count = test_count + 1
                                      ->   WHERE pid = NEW.pid;
                                      -> END$$
Query OK, 0 rows affected (0.0253 sec)
delimiter ;

 MySQL  localhost:33060+ ssl  hms  SQL > insert into test(tid,pid,did,t_date,t_result) values(1,1,1,'2023-04-25','positive');
Query OK, 1 row affected (0.0217 sec)

 MySQL  localhost:33060+ ssl  hms  SQL > select *from test ;
+-----+-----+-----+------------+----------+
| tid | pid | did | t_date     | t_result |
+-----+-----+-----+------------+----------+
|   1 |   1 |   1 | 2023-04-25 | positive |
+-----+-----+-----+------------+----------+
1 row in set (0.0008 sec)

 MySQL  localhost:33060+ ssl  hms  SQL > select *from patient ;
+-----+----------+----------+------------+--------+---------------+------------+-------------+----------------------+------------+
| pid | f_name   | l_name   | dob        | gender | address       | phone      | blood_group | medical_history      | test_count |
+-----+----------+----------+------------+--------+---------------+------------+-------------+----------------------+------------+
|   1 | Yash     | Jondhale | 2003-02-19 | Male   | Kolpewadi     | 9090905555 | AB+         | None                 |          3 |
|   2 | Swapnil  | Jadhav   | 2000-04-11 | Male   | SambhajiNagar | 9090905556 | B+          | None                 |          1 |
|   3 | Prashant | Hinge    | 2004-08-18 | Male   | Nashik        | 9090905557 | O+          | Asthma               |          1 |
|   4 | Adesh    | Avhad    | 1993-08-18 | Male   | Yeola         | 9090905501 | O+          | Skin conditions:Acne |          1 |
|   5 | Sonali   | Gore     | 2007-03-29 | Female | Satara        | 9090905553 | A+          | None                 |          1 |
+-----+----------+----------+------------+--------+---------------+------------+-------------+----------------------+------------+

*/