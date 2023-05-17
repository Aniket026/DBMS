
/*       
        NAME    :Aniket Borawake
        ROLL NO :26
        BATCH   :-AS2
        CREATE A STORED FUNCTION TO GET THE HEALTH STATUS OF A PATIENT BASED ON SOME CONDITIONS   

*/


DELIMITER //

CREATE FUNCTION get_health_status(bmi FLOAT) 
RETURNS VARCHAR(50)
DETERMINISTIC

BEGIN 
        DECLARE health VARCHAR(50);

        IF bmi<18.5 THEN
            SET health = 'Underweight' ;
        ELSEIF bmi>=18.5 AND BMI<25 THEN
            SET health = 'Normal Weight' ;
        ELSEIF bmi>=25 AND BMI<30 THEN
            SET health = 'Overweight';
        ELSEIF bmi>=30 AND BMI<35 THEN
            SET health = 'Obese Class I';
        ELSEIF bmi>=35 AND BMI<40 THEN
            SET health = 'Obese Class II';
        ELSE 
            SET health = 'Obese Class III' ;   
        END IF ;

        RETURN health ;
END //

DELIMITER ;

/*

OUTPUT:

MySQL  localhost:33060+ ssl  hms  SQL > show tables;
+---------------+
| Tables_in_hms |
+---------------+
| appointment   |
| docter        |
| med_history   |
| patient       |
| patient_info  |
| prescription  |
| test          |
| ward          |
+---------------+
8 rows in set (0.0015 sec)

MySQL  localhost:33060+ ssl  hms  SQL > DESC patient;
+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| pid             | int          | NO   | PRI | NULL    |       |
| f_name          | varchar(30)  | YES  |     | NULL    |       |
| l_name          | varchar(30)  | YES  |     | NULL    |       |
| dob             | date         | YES  |     | NULL    |       |
| gender          | varchar(10)  | YES  |     | NULL    |       |
| address         | varchar(100) | YES  |     | NULL    |       |
| phone           | varchar(20)  | YES  |     | NULL    |       |
| blood_group     | varchar(10)  | YES  |     | NULL    |       |
| medical_history | varchar(100) | YES  |     | NULL    |       |
| test_count      | int          | YES  |     | NULL    |       |
| height          | int          | YES  |     | NULL    |       |
| weight          | int          | YES  |     | NULL    |       |
| bmi             | float(5,2)   | YES  |     | NULL    |       |
| health_status   | varchar(50)  | YES  |     | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+
14 rows in set (0.0022 sec)

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
 MySQL  localhost:33060+ ssl  hms  SQL > CREATE FUNCTION get_health_status(bmi FLOAT)
                                      -> RETURNS VARCHAR(50)
                                      -> DETERMINISTIC
                                      ->
                                      -> BEGIN
                                      ->         DECLARE health VARCHAR(50);
                                      ->
                                      ->         IF bmi<18.5 THEN
                                      ->             SET health = 'Underweight' ;
                                      ->         ELSEIF bmi>=18.5 AND BMI<25 THEN
                                      ->             SET health = 'Normal Weight' ;
                                      ->         ELSEIF bmi>=25 AND BMI<30 THEN
                                      ->             SET health = 'Overweight';
                                      ->         ELSEIF bmi>=30 AND BMI<35 THEN
                                      ->             SET health = 'Obese Class I';
                                      ->         ELSEIF bmi>=35 AND BMI<40 THEN
                                      ->             SET health = 'Obese Class II';
                                      ->         ELSE
                                      ->             SET health = 'Obese Class III' ;
                                      ->         END IF ;
                                      ->
                                      ->         RETURN health ;
                                      -> END //
Query OK, 0 rows affected (0.0083 sec)
 MySQL  localhost:33060+ ssl  hms  SQL >
 MySQL  localhost:33060+ ssl  hms  SQL > DELIMITER ;
 MySQL  localhost:33060+ ssl  hms  SQL >
 MySQL  localhost:33060+ ssl  hms  SQL >



MySQL  localhost:33060+ ssl  hms  SQL > SELECT PID,get_health_status(bmi) FROM PATIENT ;
+-----+------------------------+
| PID | get_health_status(bmi) |
+-----+------------------------+
|   1 | Normal Weight          |
|   2 | Normal Weight          |
|   3 | Overweight             |
|   4 | Obese Class II         |
|   5 | Underweight            |
+-----+------------------------+
5 rows in set (0.0057 sec)
 
MySQL  localhost:33060+ ssl  hms  SQL > CREATE VIEW health_status(pid,status) AS SELECT pid,get_health_status(bmi) FROM PATIENT;
Query OK, 0 rows affected (0.0126 sec)
 
MySQL  localhost:33060+ ssl  hms  SQL > SELECT * FROM health_status;
+-----+----------------+
| pid | status         |
+-----+----------------+
|   1 | Normal Weight  |
|   2 | Normal Weight  |
|   3 | Overweight     |
|   4 | Obese Class II |
|   5 | Underweight    |
+-----+----------------+
5 rows in set (0.0027 sec)


*/