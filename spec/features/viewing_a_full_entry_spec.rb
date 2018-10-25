feature "Viewing a full diary entry" do
  scenario "clikcing on an entry title" do
    connection = PG.connect(dbname: 'diary_test')
    connection.exec("INSERT INTO diary_entries (title, body)
      VALUES ('Entry 1', 'This is entry 1'),
      ('Entry 2', 'This is entry 2');")

      visit '/'
      click_button 'View Diary'

      expect(page).to have_content 'Entry 1'
      click_link 'Entry 1'
      expect(page).to have_content 'This is entry 1'
  end
end
