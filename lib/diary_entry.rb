require 'pg'

class DiaryEntry
  attr_reader :title

  def initialize(title)
    @title = title
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'diary_test')
    else
      connection = PG.connect(dbname: 'diary')
    end

    result = connection.exec('SELECT * FROM diary_entries')
    result.map { |entry| entry['title'] }
  end
end
