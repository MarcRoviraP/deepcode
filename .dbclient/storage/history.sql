/* 2026-05-14 18:35:40 [1 ms] */ 
SELECT * FROM usuarios LIMIT 100;
/* 2026-05-14 18:35:45 [17 ms] */ 
DELETE FROM "usuarios" WHERE "id"=29;
/* 2026-05-14 18:35:45 [2 ms] */ 
SELECT * FROM usuarios LIMIT 100;
/* 2026-05-14 18:37:16 [2 ms] */ 
SELECT * FROM chat LIMIT 100;
/* 2026-05-14 18:43:38 [19 ms] */ 
SELECT * FROM conversaciones LIMIT 100;
/* 2026-05-14 18:45:23 [2 ms] */ 
SELECT * FROM chat LIMIT 100;
