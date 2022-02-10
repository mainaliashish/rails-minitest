require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: 'Science')
  end

  test 'category should be valid' do
    assert @category.valid?, 'invalid category.'
  end

  test 'should have a user id' do
    @category.user_id = 1
    assert @category.valid?, 'category must belongs to a user.'
  end

  test 'name should be present' do
    @category.name = nil
    assert_not @category.valid?, 'category name should not be empty.'
  end

  test 'name should be unique' do
    @category.save
    @category2 = Category.new(name: 'Science')
    assert_not @category2.valid?, 'category name should be unique.'
  end

  test 'name should not be too long' do
    @category.name = 'a' * 33
    assert_not @category.valid?, 'category name should not be too long.'
  end

  test 'name should not be too short' do
    @category.name = 'a' * 2
    assert_not @category.valid?, 'category name should not be too short.'
  end
end
