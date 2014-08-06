require 'test_helper'

class WebhooksControllerTest < ActionController::TestCase
 test "postmark email" do 

    setup
    test_data = File.open("#{Rails.root}/test/fixtures/inbound_email.json").read
    @request.env["RAW_POST_DATA"] = test_data
    response = post(:postmark, {})
    @request.env.delete('RAW_POST_DATA')
    json = JSON.parse response.body

    assert_response 404



  end


end
