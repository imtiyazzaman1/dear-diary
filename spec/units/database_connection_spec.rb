require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it "sets up a connection" do
      DatabaseConnection.setup('diary_test')
      expect(DatabaseConnection.connection).to be_a PG::Connection
    end

    it "should presist" do
      connection = DatabaseConnection.setup('diary_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it "executes a SQL query via PG" do
      connection = DatabaseConnection.setup('diary_test')

      expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")

      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end
