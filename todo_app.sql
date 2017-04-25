-- Create user michael
DROP ROLE IF EXISTS michael;
CREATE ROLE michael WITH ENCRYPTED PASSWORD 'stonebreaker';

-- Create database todo_app
DROP DATABASE IF EXISTS todo_app;
CREATE DATABASE todo_app;

-- Connect to database todo_app
\c todo_app;

-- Create table tasks
CREATE TABLE IF NOT EXISTS tasks (
id SERIAL PRIMARY KEY,
title VARCHAR(50) NOT NULL,
description TEXT NULL,
created_at TIMESTAMP NOT NULL DEFAULT NOW(),
updated_at TIMESTAMP NULL,
completed_at BOOLEAN NOT NULL DEFAULT false
);

-- Delete completed column from tasks
ALTER TABLE tasks
DROP completed;

-- Add completed_at column to tasks
ALTER TABLE tasks
ADD completed_at TIMESTAMP NULL DEFAULT NULL;

--Set any existing tasks updated_at which are null to 0

-- Disable saving as null in updated_at

-- Drop default for tasks

-- Change default for update_at

-- Insert new row without value selectors
INSERT INTO tasks(title, description) VALUES ('Study SQL', 'Complete this exercise');
INSERT INTO tasks(title, description) VALUES ('Study PostreSQL', 'Read all the documentation');

-- Get uncompleted tasks' titles
SELECT title
FROM tasks
WHERE completed_at = false;

-- Complete "Study SQL"

-- Get all tasks by descending creating date
SELECT *
FROM tasks
ORDER BY created_at DESC;

-- Create a new task
INSERT INTO tasks(title, description) VALUES ('mistake 1', 'a test entry');
INSERT INTO tasks(title, description) VALUES ('mistake 2', 'another test entry');
INSERT INTO tasks(title, description) VALUES ('third mistake', 'another test entry');

-- LIKE searches
-- doc cite: https://www.postgresql.org/docs/9.0/static/functions-matching.html
  -- look-up POSIX Regular Expressions
SELECT title
FROM tasks
WHERE title ~* 'mistake';

-- Delete mistake 1
DELETE
FROM tasks
WHERE title = 'mistake 1';

-- Show remaining mistakes
SELECT title, description
FROM tasks
WHERE title ~* 'mistake';

-- Delete remaining mistakes
DELETE
FROM tasks
WHERE title ~* 'mistake';

-- Show remaining entries by title, ascending
SELECT *
FROM tasks
ORDER BY title ASC;