require 'pg'

class DiaryEntry
  attr_reader :title, :id

  def initialize(id, title)
    @id = id
    @title = title
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'diary_test')
    else
      connection = PG.connect(dbname: 'diary')
    end

    result = connection.exec('SELECT * FROM diary_entries')
    result.map { |entry| DiaryEntry.new(entry['id'], entry['title']) }
  end
end
