require 'pg'

class DiaryEntry
  attr_reader :title, :id, :body

  def initialize(id:, title:, body: "")
    @id = id
    @title = title
    @body = body
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'diary_test')
    else
      connection = PG.connect(dbname: 'diary')
    end

    result = connection.exec('SELECT * FROM diary_entries')
    result.map { |entry| DiaryEntry.new(id: entry['id'], title: entry['title'], body: entry['body']) }
  end
end
