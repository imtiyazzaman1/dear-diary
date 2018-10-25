feature "Adding a diary entry" do
  scenario "Clicking 'add entry' and filling out form" do
    visit '/'
    click_button 'Add Entry'
    fill_in :title, with: 'Entry 5'
    fill_in :body, with: 'This is entry 5'
    click_button 'Save'
    click_link 'Entry 5'
    expect(page).to have_content "Entry 5\nThis is entry 5"
  end
end
