require 'database_connection'


def setup_test_database
  # p 'setting up the database'

  DatabaseConnection.query("TRUNCATE diary_entries, comments;")

end
