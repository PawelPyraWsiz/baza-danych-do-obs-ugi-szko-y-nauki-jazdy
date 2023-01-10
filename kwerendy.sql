
--Zwrócenie dla każdego użytkowinka jego imia, naziwska i daty rejestracji, dane posortowane według naziwska
SELECT first_name, last_name, register_date
FROM users
ORDER BY last_name

--Zwrócenie różnicy między najwyższą, a najmniejszą kwotą z tabeli płatności
SELECT MAX(amount) - MIN(amount) AS [roznica]
FROM payments

--Wypisanie tylko studentów wraz z ich danymi
Select * 
From users U inner join students S 
			on U.id = S.user_id

--Wypisanie tylko pracowników wraz z ich danymi
Select * 
From users U inner join employees E 
			on U.id = E.id
--Wypisanie płatności wraz informacja o statusie 
Select P.amount, P.date, PS.description as Status_platnosci, (u.first_name + ' ' + u.last_name) as Zaakceptowane_przez
From payments P inner join payments_status PS 
				on P.status = PS.id 
				join users U on P.accepted_by = U.id 

--Informacje o zajeciach praktycznych plus czas trwania 
select s.name as Status_zajec, (c.brand + ' ' + c.model) as samochod, DL.student_id, DL.instructor_id, (DATEPART(HOUR, DL.end_time) - DATEPART(HOUR, DL.start_time)) as czas 
from driving_lessons DL inner join status S On DL.status = S.id left join cars C on DL.car_id = C.id

--informacje o przychodach za styczen
Select sum(amount) Przychod_za_styczen
from payments
where DATEPART(month, date) = 01 

--sprawdzanie ważności ubezpieczenia 
SELECT registration_number, brand, model, colour, year, insurance_date, 
		CASE
			WHEN DATEDIFF(DD, getdate(), insurance_date) > 0 THEN 'inusrance active'
			WHEN DATEDIFF(DD, getdate(), insurance_date) < 0 THEN 'inusrance unactive'
		ELSE 'no data'
END AS insurance_status
FROM cars 
ORDER BY insurance_date ASC;

--badania techniczne
SELECT registration_number, brand, model, colour, year, examination_date, 
		CASE
			WHEN DATEDIFF(DD, getdate(), examination_date) > 0 THEN 'technical review valid'
			WHEN DATEDIFF(DD, getdate(), examination_date) < 0 THEN 'technical review invalid'
		ELSE 'no data'
END AS technical_review
FROM cars 
ORDER BY examination_date ASC;

--brak zaśaidczenia lekarskiego
select count(student_id) as liczba_kursantów_bez_badan_lekaskich
from student_courses
where medical_certificate = 'Nie'
--Studenci bez zaśiadczenia lekarskiego
select * from student_courses where medical_certificate = 'Nie'

--sredni wiek studentów
SELECT AVG(DATEDIFF(YEAR, birth_date, GETDATE())) AS avg_age
FROM users U inner join students S ON U.id = S.user_id;

--najmłodszy użytkownik 
SELECT TOP 1 U.first_name, u.last_name, birth_date 
FROM users U inner join students S 
			ON u.id = s.user_id
ORDER BY birth_date DESC;

--Zapytanie które zwróci lekcje które mają miejsce w sali z pojemnością ponad 10 osób
SELECT * FROM theoretical_lessons
WHERE class IN (SELECT id FROM Classrom WHERE capacity > 10);

-- suma płatności anulowanych 
SELECT SUM(payments.amount) AS platnosci_anulowane
FROM payments
WHERE payments.status = (SELECT id FROM payments_status WHERE description = 'Płatność anulowana');

--totalny przebieg samochdów(wliczająć w to przebieg przebyty w trakcie trwania zajęć)
SELECT cars.id, cars.registration_number, cars.brand, cars.model, cars.disctance + SUM(driving_lessons.distance) as total_distance
FROM cars
LEFT JOIN driving_lessons
ON cars.id = driving_lessons.car_id
GROUP BY cars.id, cars.registration_number, cars.brand, cars.model, cars.disctance;

--sale w których nie odbyły się zajecia 
SELECT *
FROM Classrom
WHERE id NOT IN (SELECT class FROM theoretical_lessons)

-- procentowa zdawalność egzaminów wewnętrznych
SELECT (SELECT COUNT(*)
FROM internal_exams
WHERE result = 'Z')/ COUNT(*) * 100
from internal_exams

-- zapytanie które wyświetli wszystkie dane dotyczące płatności dla danego studenta, a jeśli student nie ma żadnych płatności, to również zostaną wyświetlone jego dane, ale bez informacji o płatnościach.
SELECT s.user_id, p.amount, p.date, p.student_id, p.accepted_by, p.status, p.due_date, p.description
FROM students s
LEFT JOIN payments p ON s.user_id = p.student_id;
--Zapytanie które wyświetli listę studentów i ich sumaryczną kwotę płatności, która przekracza 1000 zł.
SELECT "student_id", SUM("amount") as "total_amount"
FROM "payments"
GROUP BY "student_id"
HAVING SUM("amount") > 1000;

--Zapytanie generująće adresy email dla pracowników 
Select concat(substring(first_name, 1, 2), last_name, '@szkolanaukijazdy.pl')as Wygenerowane_adresy_email
from users
where id in (SELECT id FROM employees)

-- funkcja do pobierania użytkownika o konretnym id
CREATE FUNCTION get_user_by_id(@id INTEGER)
RETURNS TABLE
AS
RETURN
    SELECT * FROM users
    WHERE id = @id;
	 
	--wywołanie
	SELECT * FROM get_user_by_id(4);

--zapytanie wykorzystuje technikę pivotowania, aby zamienić kolumnę "description" z wartościami "Płatność przelewem", "Płatność gotówka", "Płatność odłożona" i "Płatność anulowana" na trzy osobne kolumny z wartościami logicznymi (1 lub 0) wskazującymi, czy dana płatność została zapłacona, oczekuje na zapłatę, czy została anulowana
SELECT
id,
MAX(CASE WHEN description = 'Płatność przelewem' THEN 1 ELSE 0 END) AS paid,
MAX(CASE WHEN description = 'Płatność gotówka' THEN 1 ELSE 0 END) AS cash,
MAX(CASE WHEN description = 'Płatność odłożona' THEN 1 ELSE 0 END) AS pending,
MAX(CASE WHEN description = 'Płatność anulowana' THEN 1 ELSE 0 END) AS cancelled
FROM payments_status
GROUP BY id;

--zapytanie pobierze wszystkie rekordy z tabeli "theoretical_lessons" i dołączy do nich odpowiadające im rekordy z tabeli "Classroom"
SELECT *
FROM "theoretical_lessons" AS lessons
JOIN (SELECT * FROM Classrom) AS classrooms
ON lessons.class = classrooms.id

--zapytanie pobierze wszystkie rekordy z tabeli "theoretical_lessons" i grupuje je według kolumny "instructor_id", a następnie wylicza średnią liczbę godzin dla każdej grupy.
SELECT instuctor_id, AVG(hours) AS avg_hours
FROM (SELECT * FROM theoretical_lessons) AS lessons
GROUP BY instuctor_id

--zapytanie wybiera id, przedmiot, datę i opis klasy dla wszystkich wykładów teoretycznych dla danego kursu w danym roku. Podzapytanie w części SELECT służy do pobrania opisu klasy na podstawie identyfikatora klasy z tabeli Classroom.

SELECT
tl.id, tl.subject, tl.date,
(SELECT description FROM Classrom WHERE id = tl.class) AS class_description
FROM theoretical_lessons tl
WHERE tl.course_id = 1 AND tl.date >= '2020-01-01' AND tl.date <= '2022-12-31'

--Wynik zapytania zawiera dla każdej lekcji jazdy jej identyfikator oraz odpowiadający mu numer rejestracyjny samochodu.
SELECT driving_lessons.id,
(SELECT cars.registration_number FROM cars WHERE cars.id = driving_lessons.car_id) AS car_registration_number
FROM driving_lessons;