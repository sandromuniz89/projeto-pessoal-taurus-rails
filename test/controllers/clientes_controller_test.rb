require "test_helper"

class ClientesControllerTest < ActionDispatch::IntegrationTest
  test "should get conta" do
    get clientes_conta_url
    assert_response :success
  end
end
