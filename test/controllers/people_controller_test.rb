require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  def setup
    @person = people(:david)
  end

  test 'get index' do
    get people_path
    assert_response :success
    assert_select 'h1', 'People'
  end

  test 'get show' do
    get person_path @person
    assert_response :success
    assert_select 'h1', @person.name
  end

  test 'get new' do
    get new_person_path
    assert_response :success
    assert_select 'h1', 'Add person'
  end

  test 'valid create' do
    assert_difference 'Person.count', 1 do
      post people_path, params: { person: { name: str, job_title: str } }
    end
    assert_response :redirect
    follow_redirect!
    assert_select 'h1', 'People'
    assert_select '.flash', "#{Person.last.name} has been created"
  end

  test 'invalid create' do
    assert_no_difference 'Person.count' do
      post people_path, params: { person: { name: '' } }
    end
    assert_response :success
    assert_select 'h1', 'Add person'
  end

  test 'get edit' do
    get edit_person_path @person
    assert_response :success
    assert_select 'h1', "Edit #{@person.name}"
  end

  test 'valid update' do
    patch person_path @person, params: { person: { name: str } }
    assert_response :redirect
    follow_redirect!
    assert_select 'h1', 'People'
    assert_select '.flash', "#{@person.reload.name} has been updated"
  end

  test 'invalid update' do
    patch person_path @person, params: { person: { name: '' } }
    assert_response :success
    assert_select 'h1', 'Edit'
  end

  test 'destroy' do
    assert_difference 'Person.count', -1 do
      delete person_path @person
    end
    assert_response :redirect
    follow_redirect!
    assert_select 'h1', 'People'
  end
end
