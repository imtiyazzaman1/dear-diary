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
      Database.connect.exec("INSERT INTO diary_entries (id, title)
        VALUES ('1','Entry 1'),
          ('2', 'Entry 2'),
          ('3', 'Entry 3');"
      )

      expect(DiaryEntry.all[0].id).to eq ('1')
      expect(DiaryEntry.all[1].id).to eq ('2')
      expect(DiaryEntry.all[2].id).to eq ('3')
    end
  end

  describe '#self.create' do
    it "should add an entry to the database" do
      DiaryEntry.create('Entry 4', 'This is entry 4')

      expect(DiaryEntry.all[0].title).to eq 'Entry 4'
      expect(DiaryEntry.all[0].body).to eq 'This is entry 4'
    end
  end

  describe '#self.delete' do
    it "should delete an entry from the database" do
      Database.connect.exec("INSERT INTO diary_entries (id, title, body)
        VALUES ('7','Entry 7', 'This is entry 7');"
      )

      DiaryEntry.delete('7')
      expect(DiaryEntry.all).to be_empty
    end
  end

  describe '#self.update' do
    it "should update an exisiting entry in the ddb" do
      Database.connect.exec("INSERT INTO diary_entries (id, title, body)
        VALUES ('8','Entry 8', 'This is entry 7');"
      )

      DiaryEntry.update('8', 'Entry 8', 'Correction! This is entry 8')

      expect(DiaryEntry.all[0].body).to eq 'Correction! This is entry 8'
    end
  end
end
