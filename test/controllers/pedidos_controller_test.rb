require "test_helper"

class PedidosControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get pedidos_create_url
    assert_response :success
  end

  test "should get show" do
    get pedidos_show_url
    assert_response :success
  end
end
