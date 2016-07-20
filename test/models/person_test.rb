require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  def setup
    @person = people(:david)
  end

  test 'valid' do
    assert @person.valid?
  end

  test 'name is required' do
    @person.name = nil
    refute @person.valid?
  end

  test 'name should be 48 chars or less' do
    @person.name = 'a' * 48
    assert @person.valid?
    @person.name = 'a' * 49
    refute @person.valid?
  end

  test 'job is required' do
    @person.job = nil
    refute @person.valid?
  end

  test 'job should be 48 chars or less' do
    @person.job = 'a' * 48
    assert @person.valid?
    @person.job = 'a' * 49
    refute @person.valid?
  end

  test 'bio is optional' do
    @person.bio = nil
    assert @person.valid?
  end

  test 'first name' do
    assert @person.name == 'David Jones'
    assert @person.first_name == 'David'
    @person.name = 'Keith'
    assert @person.first_name == 'Keith'
  end
end
