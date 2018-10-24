feature 'Viewing diary entry titles' do
  scenario 'visiting the index page' do
    connection = PG.connect(dbname: 'diary_test')
    connection.exec("INSERT INTO diary_entries (title)
      VALUES ('Entry 1'),
        ('Entry 2'),
        ('Entry 3');")

    visit '/diary'
    expect(page).to have_content 'Entry 1'
    expect(page).to have_content 'Entry 2'
    expect(page).to have_content 'Entry 3'
  end
end
