require 'comment'
describe Comment do
  subject { described_class.new(id: '1', text: 'This is comment 1, linked to entry 2', entry_id: '2')}
  it "should have an id" do
    expect(subject.id).to eq '1'
  end
  it "should have text" do
    expect(subject.text).to eq 'This is comment 1, linked to entry 2'
  end
  it "should have an entry id" do
    expect(subject.entry_id).to eq '2'
  end
end
