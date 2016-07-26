require 'test_helper'

class PeopleIntegrationTest < ActionDispatch::IntegrationTest
  test 'add person' do
    new_name = 'John Doe'
    new_job_title = 'Plumber'
    new_bio = 'Tales of plumbing...'

    visit '/people'
    page.has_content? 'People'
    click_on 'New Person'
    page.has_content? 'People / New'
    fill_in('Name', with: new_name)
    fill_in('Job title', with: new_job_title)
    fill_in('Bio', with: new_bio)
    click_on 'Save'
    page.has_content? "People / #{new_name}"
    page.has_content? new_name
    page.has_content? new_job_title
    page.has_content? new_bio
    click_on 'People'
    page.has_content? "#{new_name} view"
  end

  test 'edit person' do
    new_name = 'Jane Doe'
    new_job_title = 'Carpenter'
    new_bio = 'Tales of carpenting...'

    visit '/people'
    first('div.people span').click_link('view')
    page.has_content? 'People / '
    click_on 'Edit'
    fill_in('Name', with: new_name)
    fill_in('Job title', with: new_job_title)
    fill_in('Bio', with: new_bio)
    click_on 'Save'
    page.has_content? new_name
    page.has_content? new_job_title
    page.has_content? new_bio
    page.has_content? "#{new_name} has been updated"
  end
end
