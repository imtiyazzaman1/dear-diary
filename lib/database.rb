require 'pg'

class Database
  attr_reader :connection
  def initialize(database)
    @connection = PG.connect(dbname: database)
  end

  def self.connect
    database = ENV['ENVIRONMENT'] == 'test' ? 'diary_test' : 'diary'
    instance = Database.new(database)
    instance.connection
  end
end
