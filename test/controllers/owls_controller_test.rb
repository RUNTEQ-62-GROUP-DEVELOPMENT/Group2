require "test_helper"

class OwlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @owl = owls(:one)
  end

  test "should get index" do
    get owls_url
    assert_response :success
  end

  test "should get new" do
    get new_owl_url
    assert_response :success
  end

  test "should create owl" do
    assert_difference("Owl.count") do
      post owls_url, params: { owl: { age: @owl.age, name: @owl.name } }
    end

    assert_redirected_to owl_url(Owl.last)
  end

  test "should show owl" do
    get owl_url(@owl)
    assert_response :success
  end

  test "should get edit" do
    get edit_owl_url(@owl)
    assert_response :success
  end

  test "should update owl" do
    patch owl_url(@owl), params: { owl: { age: @owl.age, name: @owl.name } }
    assert_redirected_to owl_url(@owl)
  end

  test "should destroy owl" do
    assert_difference("Owl.count", -1) do
      delete owl_url(@owl)
    end

    assert_redirected_to owls_url
  end
end
