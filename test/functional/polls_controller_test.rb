require 'test_helper'

class PollsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:polls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create poll" do
    assert_difference('Poll.count') do
      post :create, :poll => { }
    end

    assert_redirected_to poll_path(assigns(:poll))
  end

  test "should show poll" do
    get :show, :id => polls(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => polls(:one).to_param
    assert_response :success
  end

  test "should update poll" do
    put :update, :id => polls(:one).to_param, :poll => { }
    assert_redirected_to poll_path(assigns(:poll))
  end

  test "should destroy poll" do
    assert_difference('Poll.count', -1) do
      delete :destroy, :id => polls(:one).to_param
    end

    assert_redirected_to polls_path
  end
end
