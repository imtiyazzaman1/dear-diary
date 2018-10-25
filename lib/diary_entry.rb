require_relative 'database'

class DiaryEntry
  attr_reader :title, :id, :body

  def initialize(id:, title:, body: "")
    @id = id
    @title = title
    @body = body
  end

  def self.all
    result = Database.connect.exec('SELECT * FROM diary_entries')
    result.map { |entry| DiaryEntry.new(id: entry['id'], title: entry['title'], body: entry['body']) }
  end

  def self.create(title, body)
    Database.connect.exec("INSERT INTO diary_entries (title, body)
      VALUES ('#{title}', '#{body}');"
    )
  end
end
