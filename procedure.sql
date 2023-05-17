/*
        NAME:-Aniket Borawake
        ROLL NO:26
        BATCH:-AS2
        CREATE A PROCEDURE update_bmi WHICH TAKES ARGUMENTS id,height,weight CALCULATE BMI AND UPDATE HEIGHT WEIGHT AND BMI
*/




delimiter //
CREATE PROCEDURE update_bmi(IN id DOUBLE,IN h DOUBLE,IN w DOUBLE)
BEGIN
DECLARE b DOUBLE;

SET b=w/((h*h)/10000);

UPDATE patient
SET height=h,
    weight=w,
    bmi=b
WHERE pid=id;
END//

delimiter ;


/*

 MySQL  localhost:33060+ ssl  hms  SQL > select * from patient;
+-----+----------+----------+------------+--------+---------------+------------+-------------+----------------------+------------+--------+--------+------+---------------+
| pid | f_name   | l_name   | dob        | gender | address       | phone      | blood_group | medical_history      | test_count | height | weight | bmi  | health_status |
+-----+----------+----------+------------+--------+---------------+------------+-------------+----------------------+------------+--------+--------+------+---------------+
|   1 | Yash     | Jondhale | 2003-02-19 | Male   | Kolpewadi     | 9090905555 | AB+         | High blood pressure  |          3 |   NULL |   NULL | NULL | NULL          |
|   2 | Swapnil  | Jadhav   | 2000-04-11 | Male   | SambhajiNagar | 9090905556 | B+          | None                 |          1 |   NULL |   NULL | NULL | NULL          |
|   3 | Prashant | Hinge    | 2004-08-18 | Male   | Nashik        | 9090905557 | O+          | Asthma               |          1 |   NULL |   NULL | NULL | NULL          |
|   4 | Adesh    | Avhad    | 1993-08-18 | Male   | Yeola         | 9090905501 | O+          | Skin conditions:Acne |          1 |   NULL |   NULL | NULL | NULL          |
|   5 | Sonali   | Gore     | 2007-03-29 | Female | Satara        | 9090905553 | A+          | None                 |          1 |   NULL |   NULL | NULL | NULL          |
+-----+----------+----------+------------+--------+---------------+------------+-------------+----------------------+------------+--------+--------+------+---------------+
5 rows in set (0.0007 sec)





 MySQL  localhost:33060+ ssl  hms  SQL > delimiter //
 MySQL  localhost:33060+ ssl  hms  SQL > CREATE PROCEDURE update_bmi(IN id DOUBLE,IN h DOUBLE,IN w DOUBLE)
                                      -> BEGIN
                                      -> DECLARE b DOUBLE;
                                      ->
                                      -> SET b=w/((h*h)/10000);
                                      ->
                                      -> UPDATE patient
                                      -> SET height=h,
                                      ->     weight=w,
                                      ->     bmi=b
                                      -> WHERE pid=id;
                                      -> END//
Query OK, 0 rows affected (0.0029 sec)
 MySQL  localhost:33060+ ssl  hms  SQL >
 MySQL  localhost:33060+ ssl  hms  SQL > delimiter ;
 MySQL  localhost:33060+ ssl  hms  SQL >
 MySQL  localhost:33060+ ssl  hms  SQL >
 MySQL  localhost:33060+ ssl  hms  SQL >
 MySQL  localhost:33060+ ssl  hms  SQL >
 MySQL  localhost:33060+ ssl  hms  SQL >
 MySQL  localhost:33060+ ssl  hms  SQL >
 MySQL  localhost:33060+ ssl  hms  SQL >



 MySQL  localhost:33060+ ssl  hms  SQL > CALL update_bmi(1,160,50);
Query OK, 1 row affected (0.0206 sec)

 MySQL  localhost:33060+ ssl  hms  SQL > CALL update_bmi(2,175,70);
Query OK, 1 row affected (0.0007 sec)

 MySQL  localhost:33060+ ssl  hms  SQL > CALL update_bmi(3,180,90);
Query OK, 1 row affected (0.0210 sec)

 MySQL  localhost:33060+ ssl  hms  SQL > CALL update_bmi(4,165,100);
Query OK, 1 row affected (0.0204 sec)

 MySQL  localhost:33060+ ssl  hms  SQL > CALL update_bmi(5,163,45);
Query OK, 1 row affected (0.0206 sec)

 MySQL  localhost:33060+ ssl  hms  SQL > select * from patient;
+-----+----------+----------+------------+--------+---------------+------------+-------------+----------------------+------------+--------+--------+-------+---------------+
| pid | f_name   | l_name   | dob        | gender | address       | phone      | blood_group | medical_history      | test_count | height | weight | bmi   | health_status |
+-----+----------+----------+------------+--------+---------------+------------+-------------+----------------------+------------+--------+--------+-------+---------------+
|   1 | Yash     | Jondhale | 2003-02-19 | Male   | Kolpewadi     | 9090905555 | AB+         | High blood pressure  |          3 |    160 |     50 | 19.53 | NULL          |
|   2 | Swapnil  | Jadhav   | 2000-04-11 | Male   | SambhajiNagar | 9090905556 | B+          | None                 |          1 |    175 |     70 | 22.86 | NULL          |
|   3 | Prashant | Hinge    | 2004-08-18 | Male   | Nashik        | 9090905557 | O+          | Asthma               |          1 |    180 |     90 | 27.78 | NULL          |
|   4 | Adesh    | Avhad    | 1993-08-18 | Male   | Yeola         | 9090905501 | O+          | Skin conditions:Acne |          1 |    165 |    100 | 36.73 | NULL          |
|   5 | Sonali   | Gore     | 2007-03-29 | Female | Satara        | 9090905553 | A+          | None                 |          1 |    163 |     45 | 16.94 | NULL          |
+-----+----------+----------+------------+--------+---------------+------------+-------------+----------------------+------------+--------+--------+-------+---------------+
5 rows in set (0.0007 sec)
 MySQL  localhost:33060+ ssl  hms  SQL >


*/