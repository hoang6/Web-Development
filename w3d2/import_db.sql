-- USERS

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Tuan', 'Hoang'), ('Ninh', 'Le');

-- QUESTIONS
DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER,
  FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO
  questions (title, body, author_id)
SELECT
  'Question1', 'Body1', users.id
FROM
  users
WHERE
  users.fname = 'Tuan' AND users.lname = 'Hoang';

INSERT INTO
  questions (title, body, author_id)
SELECT
  'Question2', 'Body2', users.id
FROM
  users
WHERE
  users.fname = 'Ninh' AND users.lname = 'Le';

INSERT INTO
  questions (title, body, author_id)
SELECT
  'Question3', 'Body3', users.id
FROM
  users
WHERE
  users.fname = 'Ninh' AND users.lname = 'Le';

-- QUESTIONS_FOLLOWS

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  user_id INTEGER,
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = "Tuan" AND lname = "Hoang"),
  (SELECT id FROM questions WHERE title = "Question3")),
  ((SELECT id FROM users WHERE fname = "Ninh" AND lname = "Le"),
  (SELECT id FROM questions WHERE title = "Question3"));

-- REPLIES

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  author_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO
  replies (question_id, parent_reply_id, author_id, body)
VALUES
  ((SELECT id from questions WHERE title = 'Question3'), NULL,
  (SELECT id from users WHERE fname = 'Tuan' AND lname = 'Hoang'), 'HOHOHO');

-- QUESTION LIKES

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Tuan' AND lname = 'Hoang'),
  (SELECT id FROM questions WHERE title = "Question3"));

-- TAGS

DROP TABLE IF EXISTS tags;

CREATE TABLE tags (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

INSERT INTO
  tags (name)
VALUES
  ('CSS'), ('Ruby'), ('Javascript'), ('HTML');

DROP TABLE IF EXISTS question_tags;

CREATE TABLE question_tags (
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  tag_id INTEGER,
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (tag_id) REFERENCES tags(id)
);

INSERT INTO question_tags (question_id, tag_id) VALUES (1, 1);
INSERT INTO question_tags (question_id, tag_id) VALUES (1, 2);
INSERT INTO question_tags (question_id, tag_id) VALUES (1, 3);
INSERT INTO question_tags (question_id, tag_id) VALUES (1, 4);
INSERT INTO question_tags (question_id, tag_id) VALUES (2, 3);
INSERT INTO question_tags (question_id, tag_id) VALUES (2, 4);
