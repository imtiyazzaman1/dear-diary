require 'diary_entry'
describe DiaryEntry do
  it "should have a title" do
    entry = described_class.new('Entry 1')
    expect(entry.title).to eq('Entry 1')
  end
end
