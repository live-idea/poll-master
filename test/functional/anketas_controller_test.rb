require 'test_helper'

class AnketasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:anketas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create anketa" do
    assert_difference('Anketa.count') do
      post :create, :anketa => { }
    end

    assert_redirected_to anketa_path(assigns(:anketa))
  end

  test "should show anketa" do
    get :show, :id => anketas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => anketas(:one).to_param
    assert_response :success
  end

  test "should update anketa" do
    put :update, :id => anketas(:one).to_param, :anketa => { }
    assert_redirected_to anketa_path(assigns(:anketa))
  end

  test "should destroy anketa" do
    assert_difference('Anketa.count', -1) do
      delete :destroy, :id => anketas(:one).to_param
    end

    assert_redirected_to anketas_path
  end
end
