feature 'Viewing diary entry titles' do
  scenario 'visiting the index page' do
    visit '/'
    expect(page).to have_content 'Diary'
  end
end
