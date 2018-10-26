feature "Adding a comment" do
  scenario 'filling in comments box and pressing "Comment"'do

    DatabaseConnection.query("INSERT INTO diary_entries (id, title, body)
      VALUES ('1','Entry 1', 'This is entry 1');"
    )
    visit '/'
    click_button 'View Diary'
    click_link 'Entry 1'
    fill_in :comment, with: 'This is a comment for entry 1'
    click_button 'Comment'

    expect(page).to have_content "Comments\nThis is a comment for entry 1"
  end
end
