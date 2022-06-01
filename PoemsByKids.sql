SELECT *
FROM Grade;

SELECT *
FROM Emotion;

SELECT *
FROM Poem;

SELECT TOP 76 a.Name AS 'Author', gr.Name AS 'Grade', g.Name AS 'Gender'
From Author a
LEFT JOIN Grade gr ON a.GradeId = gr.Id
LEFT JOIN Gender g ON a.GenderId = g.Id 
ORDER BY a.Name ASC;


SELECT SUM(WordCount) AS 'Total Word Count'
FROM Poem;

SELECT TOP 1 CharCount
FROM Poem
ORDER BY CharCount DESC;

SELECT COUNT(a.id) AS 'Number of 1st through 3rd Graders'
FROM Author a
LEFT JOIN Grade g ON a.GradeId = g.Id
WHERE g.Id = 1 OR g.Id = 2 OR g.Id = 3;

SELECT COUNT(p.Id) AS 'Number of Poems by Grade', g.Name AS 'Grade'
FROM POEM p
LEFT JOIN Author a ON p.AuthorId = a.Id
LEFT JOIN Grade g ON a.GradeId = g.Id
GROUP BY g.Name;

Select COUNT(a.Id) AS 'Number of Authors', g.Name AS 'Grade'
FROM Author a
LEFT JOIN Grade g ON a.GradeId = g.Id
GROUP BY g.Name
ORDER BY g.Name;

SELECT TOP 1 Title, WordCount
FROM Poem
Order By WordCount DESC;

SELECT a.Name, COUNT(p.id) AS 'Number of Poems'
FROM Author a
LEFT JOIN Poem p ON p.AuthorId = a.Id
GROUP BY A.Id, A.Name
ORDER BY 'Number of Poems' DESC;

SELECT TOP 1 g.Name AS 'Grade', COUNT(p.id) AS 'Number of Poems', e.Name AS 'Emotion' 
FROM Poem p
LEFT JOIN PoemEmotion pe ON pe.PoemId = p.Id
LEFT JOIN Emotion e ON e.Id = pe.EmotionId
LEFT JOIN Author a ON a.Id = p.AuthorId
LEFT JOIN Grade g ON g.Id = a.GradeId
WHERE e.Name = 'Joy'
GROUP BY E.Name, G.Name
ORDER BY 'Number of Poems' DESC;

SELECT g.Name AS 'Gender', COUNT(p.id) AS 'Number of Poems', e.Name AS 'Emotion'
FROM Poem p
LEFT JOIN PoemEmotion pe ON pe.PoemId = p.Id
LEFT JOIN Emotion e ON e.Id = pe.EmotionId
LEFT JOIN Author a ON a.Id = p.AuthorId
LEFT JOIN Gender g ON g.Id = a.GenderId
Where E.Name = 'Fear'
GROUP BY g.Name, e.Name
ORDER BY 'Number of Poems';




