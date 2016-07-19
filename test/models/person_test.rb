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
end
