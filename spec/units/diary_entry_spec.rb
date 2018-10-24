require 'diary_entry'
describe DiaryEntry do
  it "should have a title" do
    entry = described_class.new(1, 'Entry 1')
    expect(entry.title).to eq('Entry 1')
  end

  it "should have an id" do
    entry = described_class.new(1, 'Entry 1')
    expect(entry.id).to eq(1)
  end

  describe '#self.all' do
    it "should return the title of each diary entry" do
      connection = PG.connect(dbname: 'diary_test')

      connection.exec("INSERT INTO diary_entries (id, title)
        VALUES ('1','Entry 1'),
          ('2', 'Entry 2'),
          ('3', 'Entry 3');"
      )


      expect(DiaryEntry.all[0].id).to eq ('1')
      expect(DiaryEntry.all[1].id).to eq ('2')
      expect(DiaryEntry.all[2].id).to eq ('3')
    end
  end
end
