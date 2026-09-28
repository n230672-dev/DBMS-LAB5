USE Various;
SHOW TABLES;
SELECT * FROM Citizen;
SELECT * FROM Certificate_Type;
SELECT * FROM Panchayat_Office;
SELECT * FROM Certificate_Application;



-- Task 1: 
SELECT COUNT(*) AS total_applications
FROM Certificate_Application;

-- Task 2: 
SELECT COUNT(*) AS total_citizens
FROM Citizen;

-- Task 3: 
SELECT COUNT(DISTINCT certificate_type_id) AS different_certificate_types
FROM Certificate_Application;

-- Task 4: 
SELECT MIN(applicate_date) AS earliest_applicate_date
FROM Certificate_Application;

-- Task5:
SELECT MAX(applicate_date) AS latest_applicate_date
FROM Certificate_Application;



-- Task 1: 
SELECT application_status,
       COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY application_status;
 
-- Task 2:
SELECT certificate_type_id,
       COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY certificate_type_id;

-- Task 3: 
SELECT office_id,
       COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY office_id;

-- Task 4: 
SELECT village,
       COUNT(*) AS total_citizens
FROM Citizen
GROUP BY village;

-- Task 5: 
SELECT applicate_date,
       COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY applicate_date;

-- Task 6:
SELECT certificate_type_id,
       office_id,
       COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY certificate_type_id, office_id;

-- Task 7:

SELECT C.certificate_name,
       COUNT(*) AS total_applications
FROM Certificate_Application A
JOIN Certificate_Type C
ON A.certificate_type_id = C.certificate_type_id
GROUP BY C.certificate_name;

-- Task 8:
SELECT P.office_email,
       COUNT(*) AS total_applications
FROM Certificate_Application A
JOIN Panchayat_Office P
ON A.office_id = P.office_id
GROUP BY P.office_email;



-- Task 1: 
SELECT certificate_id,
       COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY certificate_type_id
HAVING COUNT(*) > 2;

-- Task 2: 
SELECT office_id,
       COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY office_id
HAVING COUNT(*) > 2;

-- Task 3: 

SELECT certificate_type_id,
       COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY certificate_type_id
ORDER BY COUNT(*) DESC;

-- Task 4: 
SELECT office_id,
       COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY office_id
ORDER BY COUNT(*) ASC;

-- Task 5: 
SELECT certificate_type_id,
       COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY certificate_type_id
HAVING COUNT(*) > 2
ORDER BY COUNT(*) DESC;

-- Task 6: 
SELECT certificate_type_id,
       office_id,
       COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY certificate_type_id, office_id
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Task 7: 
SELECT application_status,
       COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY application_status
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Task 8: 
SELECT application_status,
       COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY application_status
ORDER BY COUNT(*) ASC
LIMIT 1;



-- Task 1:
SELECT C.certificate_name,
       COUNT(*) AS total_applications
FROM Certificate_Application A
JOIN Certificate_Type C
ON A.certificate_type_id = C.certificate_type_id
GROUP BY C.certificate_name
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Task 2: 
SELECT P.village_name,
       COUNT(*) AS total_applications
FROM Certificate_Application A
JOIN Panchayat_Office P
ON A.office_id = P.office_id
GROUP BY P.village_name
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Task 3:
SELECT application_status,
       COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY application_status
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Task 4:
SELECT C.certificate_name,
       COUNT(*) AS total_applications
FROM Certificate_Application A
JOIN Certificate_Type C
ON A.certificate_type_id = C.certificate_type_id
GROUP BY C.certificate_name
HAVING COUNT(*) > 2;

-- Task 5: 
SELECT P.village_name,
       COUNT(*) AS total_applications
FROM Certificate_Application A
JOIN Panchayat_Office P
ON A.office_id = P.office_id
GROUP BY P.village_name
HAVING COUNT(*) > 2;

-- Task 6: 
SELECT C.certificate_name,
       COUNT(*) AS total_applications,
       MIN(A.applicate_date) AS earliest_applicate_date,
       MAX(A.applicate_date) AS latest_applicate_date
FROM Certificate_Application A
JOIN Certificate_Type C
ON A.certificate_type_id = C.certificate_type_id
GROUP BY C.certificate_name;

-- Task 7: 
SELECT P.village_name,
       COUNT(*) AS total_applications,
       COUNT(DISTINCT A.certificate_type_id) AS different_certificate_types
FROM Certificate_Application A
JOIN Panchayat_Office P
ON A.office_id = P.office_id
GROUP BY P.village_name;