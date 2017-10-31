require 'test_helper'

class PaymentControllerTest < ActionDispatch::IntegrationTest
  test "should get braintree" do
    get payment_braintree_url
    assert_response :success
  end

end
