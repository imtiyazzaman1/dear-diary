feature "Updating an entry" do
  scenario "by clicking on the 'Update Entry' button" do
    visit '/'
    click_button 'Add Entry'
    fill_in :title, with: 'Entry 8'
    fill_in :body, with: 'This is entry 7'
    click_button 'Save'

    click_link 'Entry 8'
    click_button 'Update'
    fill_in :body, with: 'Correction! This is entry 8'
    click_button 'Save'

    click_link 'Entry 8'
    expect(page).to have_content "Entry 8\nCorrection! This is entry 8"


  end
end
