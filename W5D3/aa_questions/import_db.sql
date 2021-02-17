PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  users_id INTEGER NOT NULL,
  
  FOREIGN KEY (users_id) REFERENCES users(id)
);


DROP TABLE IF EXISTS questions_follows;

CREATE TABLE questions_follows (
  id INTEGER PRIMARY KEY,
  users_id INTEGER NOT NULL,
  questions_id INTEGER NOT NULL,

  FOREIGN KEY (users_id) REFERENCES users(id)
  FOREIGN KEY (questions_id) REFERENCES questions(id)
);

-- id   users_id  --  questions_id 
          -- 4             10
          -- 4             11
          -- 4             13
          -- 4             18

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    questions_id INTEGER NOT NULL,
    reply_key INTEGER,
    users_reply_id INTEGER NOT NULL,
    body TEXT NOt NULL, 
    top_level INTEGER NOT NULL, 


    FOREIGN KEY (questions_id) REFERENCES questions(id)
    FOREIGN KEY (reply_key) REFERENCES replies(id)
    FOREIGN KEY (users_reply_id) REFERENCES users(id)

);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
    questions_id INTEGER NOT NULL,
    users_id INTEGER NOT NULL,

    FOREIGN KEY (questions_id) REFERENCES questions(id)
    FOREIGN KEY (users_id) REFERENCES users(id)
);


INSERT INTO
  users (fname, lname)
VALUES
  ('Joe', 'Biden'),
  ('Melissa', 'Carter'),
  ('Barack', 'Obama');

INSERT INTO
  questions (title, body, users_id)
VALUES
  ('How to change variable', 'how to do it in ruby', (SELECT id FROM users WHERE fname = 'Joe' AND lname = 'Biden' )),
  ('URGENT', 'NEED HELP!', (SELECT id FROM users WHERE fname = 'Melissa' AND lname = 'Carter' )),
  ('TESTING', 'STILL NEED HELP', (SELECT id FROM users WHERE fname = 'Melissa' AND lname = 'Carter' )),
  ('NEW QUESTION', 'AMERICA', (SELECT id FROM users WHERE fname = 'Barack' AND lname = 'Obama' ));

INSERT INTO
  questions_follows (users_id, questions_id )
VALUES
  (2, 2),
--   (SELECT id FROM questions WHERE users_id = (SELECT id FROM users WHERE fname = 'Melissa' AND lname = 'Carter')),
  ((SELECT id FROM users WHERE fname = 'Joe' AND lname = 'Biden' ),
  (SELECT id FROM questions WHERE users_id = (SELECT id FROM users WHERE fname = 'Joe' AND lname = 'Biden'))
  );

INSERT INTO
    replies (questions_id, reply_key, users_reply_id, body, top_level)
VALUES
    (1, NULL, 2, "REPLIES", 1),
    (1, 1, 3, "RESPONSE", 2);

  