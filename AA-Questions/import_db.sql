CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body VARCHAR NOT NULL,
  author_id INTEGER NOT NULL,
  FOREIGN KEY(author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  follower_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  FOREIGN KEY(author_id) REFERENCES users(id),
  FOREIGN KEY(question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  author_id INTEGER NOT NULL,
  body VARCHAR NOT NULL,
  FOREIGN KEY(author_id) REFERENCES users(id),
  FOREIGN KEY(question_id) REFERENCES questions(id),
  FOREIGN KEY(parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  liker_id INTEGER NOT NULL,
  FOREIGN KEY(author_id) REFERENCES users(id),
  FOREIGN KEY(question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Tuan','Hoang'),
  ('Nou', 'Le');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('What is your favorite color?', 'I really want to know your favorite color',
    (SELECT id FROM users WHERE fname = 'Tuan' AND lname = 'Hoang')),
  ('What is your favorite city?', 'I really want to know your favorite city',
    (SELECT id FROM users WHERE fname = 'Nou' AND lname = 'Le'));

INSERT INTO
  question_follows (follower_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Tuan' AND lname = 'Hoang'),
   (SELECT id FROM questions WHERE title = 'What is your favorite color?'));
