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
    result = DatabaseConnection.query('SELECT * FROM diary_entries ORDER BY id')
    result.map { |entry| DiaryEntry.new(id: entry['id'], title: entry['title'], body: entry['body']) }
  end

  def self.create(title, body)
    DatabaseConnection.query("INSERT INTO diary_entries (title, body)
      VALUES ('#{title}', '#{body}');"
    )
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM diary_entries
      WHERE id = '#{id}'"
    )
  end

  def self.update(id, new_title, new_body)
    DatabaseConnection.query("UPDATE diary_entries
      SET title = '#{new_title}',
      body = '#{new_body}'
      WHERE id = '#{id}'"
    )
  end
end
