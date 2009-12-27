require 'test_helper'

class AnketasControllerTest < ActionController::TestCase

  fixtures :polls, :anketas
  include AuthenticatedTestHelper

  test "should show anketa" do
    login_as(:quentin)
    get :show, :id=>anketas(:one).to_param, :poll_id=>polls(:poll_1).to_param
    assert_response :success
    assert_not_nil assigns(:anketa)
  end
  
end
