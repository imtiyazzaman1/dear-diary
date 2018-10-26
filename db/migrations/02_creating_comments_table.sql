CREATE TABLE comments
(
  id SERIAL PRIMARY KEY,
  text VARCHAR(100),
  entry_id INT,
  FOREIGN KEY (entry_id) REFERENCES diary_entries ON DELETE CASCADE
);
