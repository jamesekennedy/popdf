require 'test_helper'

class WebhooksControllerTest < ActionController::TestCase
  test "should get postmark" do
    get :postmark
    assert_response :success
  end

end
