class Comment
  attr_reader :id, :text, :entry_id

  def initialize(id:, text:, entry_id:)
    @id = id
    @text = text
    @entry_id = entry_id
  end

  def self.all(entry_id)
    result = Database.connect.exec("SELECT * FROM comments
      WHERE entry_id = '#{entry_id}'"
    )
    result.map { |comment|
        Comment.new(id: comment['id'],
          text: comment['text'],
          entry_id: comment['entry_id'])
    }
  end

  def self.add(text:, entry_id:)
    Database.connect.exec("INSERT INTO comments (text, entry_id)
      VALUES ('#{text}', '#{entry_id}')")
  end
end
