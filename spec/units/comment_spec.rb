require 'comment'
describe Comment do

  before(:each) {
    Database.connect.exec("INSERT INTO diary_entries (id, title, body)
      VALUES ('1','Entry 1', 'This is entry 1');"
    )
  }

  subject { described_class.new(id: '1', text: 'This is comment 1, linked to entry 2', entry_id: '2') }

  it "should have an id" do
    expect(subject.id).to eq '1'
  end
  it "should have text" do
    expect(subject.text).to eq 'This is comment 1, linked to entry 2'
  end
  it "should have an entry id" do
    expect(subject.entry_id).to eq '2'
  end

  describe '::all' do
    it "should return all of the comments related to a diary entry " do

      Database.connect.exec("INSERT INTO comments (text, entry_id) VALUES ('This is the first comment for entry 1', '1');"
      )

      expect(Comment.all('1')[0].text).to eq 'This is the first comment for entry 1'
      expect(Comment.all('1')[0].entry_id).to eq '1'
    end
  end

  describe '::add' do
    it "should add a new comment to the database" do
      Comment.add(text: 'This is another comment for entry 1', entry_id: '1')

      expect(Comment.all('1')[0].text).to eq 'This is another comment for entry 1'
    end
  end
end
