require 'test_helper'

class FullBannersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:full_banners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create full_banner" do
    assert_difference('FullBanner.count') do
      post :create, :full_banner => { }
    end

    assert_redirected_to full_banner_path(assigns(:full_banner))
  end

  test "should show full_banner" do
    get :show, :id => full_banners(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => full_banners(:one).id
    assert_response :success
  end

  test "should update full_banner" do
    put :update, :id => full_banners(:one).id, :full_banner => { }
    assert_redirected_to full_banner_path(assigns(:full_banner))
  end

  test "should destroy full_banner" do
    assert_difference('FullBanner.count', -1) do
      delete :destroy, :id => full_banners(:one).id
    end

    assert_redirected_to full_banners_path
  end
end
