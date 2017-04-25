DROP ROLE IF EXISTS michael;
CREATE ROLE michael WITH ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS todo_app;
CREATE DATABASE todo_app;

\c todo_app;

CREATE TABLE IF NOT EXISTS tasks (
id SERIAL PRIMARY KEY,
title VARCHAR(50) NOT NULL,
description TEXT NULL,
created_at TIMESTAMP NOT NULL DEFAULT NOW(),
updated_at TIMESTAMP NULL,
completed_at BOOLEAN NOT NULL DEFAULT false
);

\d+;

INSERT INTO tasks(title, description) VALUES ('Study SQL', 'Complete this exercise');
INSERT INTO tasks(title, description) VALUES ('Study PostreSQL', 'Read all the documentation');

SELECT title
FROM tasks
WHERE completed_at = false;


SELECT *
FROM tasks
ORDER BY created_at DESC;

INSERT INTO tasks(title, description) VALUES ('mistake 1', 'a test entry');
INSERT INTO tasks(title, description) VALUES ('mistake 2', 'another test entry');
INSERT INTO tasks(title, description) VALUES ('third mistake', 'another test entry');

SELECT *
FROM tasks;

SELECT *
FROM tasks
WHERE title ~* 'mistake';

DELETE
FROM tasks
WHERE title = 'third mistake';

-- SELECT *
-- FROM tasks;
