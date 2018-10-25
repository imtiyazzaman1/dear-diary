class Comment
  attr_reader :id, :text, :entry_id

  def initialize(id:, text:, entry_id:)
    @id = id
    @text = text
    @entry_id = entry_id
  end
end
