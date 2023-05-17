/*
        NAME:-Aniket Borawake
        ROLL NO:26
        BATCH:-AS2
        VIEW patient_info TO COMBINE TWO TABLES USING INNER JOIN

*/

CREATE VIEW patient_info AS
SELECT p.pid, p.f_name, p.l_name, YEAR(CURRENT_DATE) - YEAR(p.dob) AS age, m.conditionas
FROM patient p
INNER JOIN med_history m ON p.pid = m.pid;



/*
Output:

SELECT * FROM PATIENT;
+-----+----------+----------+------------+--------+---------------+------------+-------------+----------------------+------------+
| pid | f_name   | l_name   | dob        | gender | address       | phone      | blood_group | medical_history      | test_count |
+-----+----------+----------+------------+--------+---------------+------------+-------------+----------------------+------------+
|   1 | Yash     | Jondhale | 2003-02-19 | Male   | Kolpewadi     | 9090905555 | AB+         | High blood pressure  |          3 |
|   2 | Swapnil  | Jadhav   | 2000-04-11 | Male   | SambhajiNagar | 9090905556 | B+          | None                 |          1 |
|   3 | Prashant | Hinge    | 2004-08-18 | Male   | Nashik        | 9090905557 | O+          | Asthma               |          1 |
|   4 | Adesh    | Avhad    | 1993-08-18 | Male   | Yeola         | 9090905501 | O+          | Skin conditions:Acne |          1 |
|   5 | Sonali   | Gore     | 2007-03-29 | Female | Satara        | 9090905553 | A+          | None                 |          1 |
+-----+----------+----------+------------+--------+---------------+------------+-------------+----------------------+------------+


SELECT * FROM MED_HISTORY;
+-----+-----+---------------------+----------------+
| hid | pid | conditionas         | diagnosis_date |
+-----+-----+---------------------+----------------+
|   1 |   1 | High blood pressure | 2022-01-01     |
|   2 |   1 | Diabetes            | 2021-05-07     |
|   3 |   2 | Migraines           | 2022-03-18     |
|   4 |   3 | Arthritis           | 2022-04-01     |
+-----+-----+---------------------+----------------+

 SELECT * FROM PATIENT_INFO;
+-----+----------+----------+-----+---------------------+
| pid | f_name   | l_name   | age | conditionas         |
+-----+----------+----------+-----+---------------------+
|   1 | Yash     | Jondhale |  20 | High blood pressure |
|   1 | Yash     | Jondhale |  20 | Diabetes            |
|   2 | Swapnil  | Jadhav   |  23 | Migraines           |
|   3 | Prashant | Hinge    |  19 | Arthritis           |
+-----+----------+----------+-----+---------------------+


*/