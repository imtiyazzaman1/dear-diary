require 'database_connection'

def setup_test_database
  DatabaseConnection.query("TRUNCATE diary_entries, comments;")
end
