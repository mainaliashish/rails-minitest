require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:john)
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'should contain unique email and username' do
    @user.save!
    @user_one = User.new(email: 'john@doe.com', username: 'johndoe', slug: 'john-doe')
    assert_not @user_one.valid?
  end
end
