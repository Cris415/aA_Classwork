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
  -- id INTEGER PRIMARY KEY,
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


INSERT INTO
  users (fname, lname)
VALUES
  ('Joe', 'Biden'),
  ('Melissa', 'Carter');

INSERT INTO
  questions (title, body, users_id)
VALUES
  ('How to change variable', 'how to do it in ruby', (SELECT id FROM users WHERE fname = 'Joe' AND lname = 'Biden' )),
  ('URGENT', 'NEED HELP!', (SELECT id FROM users WHERE fname = 'Melissa' AND lname = 'Carter' )),
  ('TESTING', 'STILL NEED HELP', (SELECT id FROM users WHERE fname = 'Melissa' AND lname = 'Carter' ));

INSERT INTO
  questions_follows (users_id, questions_id )
VALUES
  ((SELECT id FROM users WHERE fname = 'Melissa' AND lname = 'Carter' ),
  (SELECT id FROM questions WHERE users_id = (SELECT id FROM users WHERE fname = 'Melissa' AND lname = 'Carter'))
  ),
  ((SELECT id FROM users WHERE fname = 'Joe' AND lname = 'Biden' ),
  (SELECT id FROM questions WHERE users_id = (SELECT id FROM users WHERE fname = 'Joe' AND lname = 'Biden'))
  );
  