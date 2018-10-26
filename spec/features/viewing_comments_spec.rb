feature "Viewing comment" do
  scenario "when view a diary entry" do
    Database.connect.exec("INSERT INTO diary_entries (id, title, body)
      VALUES ('1','Entry 1', 'This is entry 1');"
    )

    Database.connect.exec("INSERT INTO comments (text, entry_id) VALUES ('This is the first comment for entry 1', '1');"
    )

    visit '/'
    click_button 'View Diary'
    click_link 'Entry 1'
    expect(page).to have_content 'This is entry 1'
    expect(page).to have_content "Comments\nThis is the first comment for entry 1"
  end
end
