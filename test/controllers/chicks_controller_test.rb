require "test_helper"

class ChicksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chick = chicks(:one)
  end

  test "should get index" do
    get chicks_url
    assert_response :success
  end

  test "should get new" do
    get new_chick_url
    assert_response :success
  end

  test "should create chick" do
    assert_difference("Chick.count") do
      post chicks_url, params: { chick: { age: @chick.age, name: @chick.name } }
    end

    assert_redirected_to chick_url(Chick.last)
  end

  test "should show chick" do
    get chick_url(@chick)
    assert_response :success
  end

  test "should get edit" do
    get edit_chick_url(@chick)
    assert_response :success
  end

  test "should update chick" do
    patch chick_url(@chick), params: { chick: { age: @chick.age, name: @chick.name } }
    assert_redirected_to chick_url(@chick)
  end

  test "should destroy chick" do
    assert_difference("Chick.count", -1) do
      delete chick_url(@chick)
    end

    assert_redirected_to chicks_url
  end
end
