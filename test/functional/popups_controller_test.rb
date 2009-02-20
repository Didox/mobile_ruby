require 'test_helper'

class PopupsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:popups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create popup" do
    assert_difference('Popup.count') do
      post :create, :popup => { }
    end

    assert_redirected_to popup_path(assigns(:popup))
  end

  test "should show popup" do
    get :show, :id => popups(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => popups(:one).id
    assert_response :success
  end

  test "should update popup" do
    put :update, :id => popups(:one).id, :popup => { }
    assert_redirected_to popup_path(assigns(:popup))
  end

  test "should destroy popup" do
    assert_difference('Popup.count', -1) do
      delete :destroy, :id => popups(:one).id
    end

    assert_redirected_to popups_path
  end
end
