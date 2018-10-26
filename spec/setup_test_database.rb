require 'pg'

def setup_test_database
  p 'setting up the database'

  connection = PG.connect(dbname: 'diary_test')
  connection.exec("TRUNCATE diary_entries, comments;")

end
