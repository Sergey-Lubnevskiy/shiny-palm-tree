-- 1
SELECT dbo.Student.first_name AS Name, dbo.Student.last_name AS Surname
FROM     dbo.S_Cards INNER JOIN
                  dbo.Student ON dbo.S_Cards.id_student = dbo.Student.id
				  WHERE dbo.S_Cards.date_in is null

-- 2
SELECT dbo.Student.first_name AS Name, dbo.Student.last_name AS Surname
FROM  dbo.Student
LEFT JOIN dbo.S_Cards ON dbo.S_Cards.id_student = dbo.Student.id
WHERE dbo.S_Cards.id_student is null

-- 3
SELECT TOP 1
    dbo.Librarian.first_name,
	dbo.Librarian.last_name,
    COUNT(*) AS count_lib
FROM
(
    SELECT * FROM dbo.S_Cards
    UNION ALL
    SELECT * FROM dbo.T_Cards
) AS books
JOIN
    dbo.Librarian ON books.id_librarian = dbo.Librarian.id
GROUP BY
    dbo.Librarian.first_name, dbo.Librarian.last_name
ORDER BY
    count_lib DESC;

-- 4
SELECT TOP 1
    dbo.Librarian.first_name,
	dbo.Librarian.last_name,
    COUNT(*) AS count_lib
FROM
(
    SELECT * FROM dbo.S_Cards WHERE date_in is not null 
    UNION ALL
    SELECT * FROM dbo.T_Cards WHERE date_in is not null 
) AS books
JOIN
    dbo.Librarian ON books.id_librarian = dbo.Librarian.id
GROUP BY
    dbo.Librarian.first_name, dbo.Librarian.last_name
ORDER BY
    count_lib DESC;