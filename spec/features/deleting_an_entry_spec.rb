feature "Deleting an entry" do
  scenario "by pressing delete" do
    visit '/'
    click_button 'Add Entry'
    fill_in :title, with: 'Entry 5'
    fill_in :body, with: 'This is entry 5'
    click_button 'Save'

    visit '/'
    click_button 'Add Entry'
    fill_in :title, with: 'Entry 6'
    fill_in :body, with: 'This is entry 6'
    click_button 'Save'

    click_link 'Entry 5'
    click_button 'Delete'
    expect(page).to have_content 'Entry 6'
    expect(page).not_to have_content 'Entry 5'
  end
end
