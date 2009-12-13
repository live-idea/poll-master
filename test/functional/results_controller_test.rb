require 'test_helper'

class ResultsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create result" do
    assert_difference('Result.count') do
      post :create, :result => { }
    end

    assert_redirected_to result_path(assigns(:result))
  end

  test "should show result" do
    get :show, :id => results(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => results(:one).to_param
    assert_response :success
  end

  test "should update result" do
    put :update, :id => results(:one).to_param, :result => { }
    assert_redirected_to result_path(assigns(:result))
  end

  test "should destroy result" do
    assert_difference('Result.count', -1) do
      delete :destroy, :id => results(:one).to_param
    end

    assert_redirected_to results_path
  end
end
