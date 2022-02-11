require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = categories(:sports)
    @user = users(:john)
  end

  test 'should get categories index' do
    get categories_path
    assert_response :success
  end

  test 'should get new if user is an admin' do
    log_in_as(@user, 'password')
    get new_category_path
    assert_response :success
  end

  test 'should get show' do
    get category_path(@category)
    assert_response :success
  end

  test 'should redirect create when admin not logged in' do
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: 'Health' } }
    end
    assert_redirected_to categories_path
  end

  test 'should be able to get edit category if admin' do
    log_in_as(@user, 'password')
    get edit_category_path(@category)
    assert_response :success
  end

  test 'should not be able to update category if not admin' do
    patch category_path(@category), params: { category: { name: 'Health' }, method: :patch }
    assert_response :redirect
  end

  test 'should be able to update category if admin' do
    log_in_as(@user, 'password')
    patch category_url(@category), params: { category: { name: 'Health' }, method: :patch }
    assert_response :redirect
  end

  test 'should not be able to update empty category if admin' do
    log_in_as(@user, 'password')
    patch category_url(@category), params: { category: { name: 'Health' }, method: :patch }
    assert_response :redirect
  end

  test 'should not be able to delete category if not admin' do
    assert_no_difference 'Category.count' do
      delete category_path(@category)
    end
    assert_redirected_to categories_path
  end

  test 'admin should be able to delete category' do
    log_in_as(@user, 'password')
    delete category_path(@category), params: { method: :delete }
    assert_response :see_other
  end
end
