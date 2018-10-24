require 'diary_entry'
describe DiaryEntry do
  subject {
   described_class.new(id: 1, title: 'Entry 1', body: 'This is entry 1')
  }
  it "should have a title" do
    expect(subject.title).to eq('Entry 1')
  end

  it "should have an id" do
    expect(subject.id).to eq(1)
  end

  it "should have a body" do
    expect(subject.body).to eq('This is entry 1')
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
