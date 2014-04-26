require 'test_helper'

class LicencesControllerTest < ActionController::TestCase
  test "should get renew" do
    get :renew
    assert_response :success
  end

end
