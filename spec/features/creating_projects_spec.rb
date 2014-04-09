require 'spec_helper'

feature 'Creating Project' do
  scenario 'can create a project' do
    visit '/'

    click_link 'New Project'

    fill_in 'Name', with: 'TexMate 2'
    fill_in 'Description', with: 'A text-editor for OS X'
    click_button 'Create Project'

    expect(page).to have_content( 'Project has been created.')

    project = Project.where(name: 'TexMate 2').first
    expect(page.current_url).to eq project_url(project)

    expect(page).to have_title('TexMate 2 - Project - Ticketee')
  end
end