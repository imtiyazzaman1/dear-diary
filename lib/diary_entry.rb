require_relative 'database'
require_relative 'comment'


class DiaryEntry
  attr_reader :title, :id, :body, :comments

  def initialize(id:, title:, body: "", comments: Comment.all(entry_id: id))
    @id = id
    @title = title
    @body = body
    @comments = comments
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

  def self.delete(id)
    Database.connect.exec("DELETE FROM diary_entries
      WHERE id = '#{id}'"
    )
  end

  def self.update(id, new_title, new_body)
    Database.connect.exec("UPDATE diary_entries
      SET title = '#{new_title}',
      body = '#{new_body}'
      WHERE id = '#{id}'"
    )
  end
end
