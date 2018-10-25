require 'database'

describe Database do
  it "should intialize with a connection a postgres db" do
    subject = described_class.new('diary_test')
    expect(subject.connection).to be_a PG::Connection
  end

  describe '#self.connect' do
    it "should connect to the a db" do
      expect(Database.connect).to be_a PG::Connection
    end
  end
end
