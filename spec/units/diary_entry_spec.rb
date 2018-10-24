require 'diary_entry'
describe DiaryEntry do
  it "should have a title" do
    entry = described_class.new('Entry 1')
    expect(entry.title).to eq('Entry 1')
  end

  describe '#self.all' do
    it "should return the title of each diary entry" do
      connection = PG.connect(dbname: 'diary_test')

      connection.exec("INSERT INTO diary_entries (title)
        VALUES ('Entry 1'),
          ('Entry 2'),
          ('Entry 3');")

      expect(DiaryEntry.all).to include ('Entry 1')
      expect(DiaryEntry.all).to include ('Entry 2')
      expect(DiaryEntry.all).to include ('Entry 3')
    end
  end
end
