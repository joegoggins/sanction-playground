require 'test_helper'

class MagazinesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:magazines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create magazine" do
    assert_difference('Magazine.count') do
      post :create, :magazine => { }
    end

    assert_redirected_to magazine_path(assigns(:magazine))
  end

  test "should show magazine" do
    get :show, :id => magazines(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => magazines(:one).to_param
    assert_response :success
  end

  test "should update magazine" do
    put :update, :id => magazines(:one).to_param, :magazine => { }
    assert_redirected_to magazine_path(assigns(:magazine))
  end

  test "should destroy magazine" do
    assert_difference('Magazine.count', -1) do
      delete :destroy, :id => magazines(:one).to_param
    end

    assert_redirected_to magazines_path
  end
end
