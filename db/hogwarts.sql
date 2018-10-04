DROP TABLE hogwarts_students;

CREATE TABLE hogwarts_students(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  house VARCHAR(255),
  age INT2
);
