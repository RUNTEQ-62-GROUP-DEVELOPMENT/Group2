require "test_helper"

class HedgehogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hedgehog = hedgehogs(:one)
  end

  test "should get index" do
    get hedgehogs_url
    assert_response :success
  end

  test "should get new" do
    get new_hedgehog_url
    assert_response :success
  end

  test "should create hedgehog" do
    assert_difference("Hedgehog.count") do
      post hedgehogs_url, params: { hedgehog: { age: @hedgehog.age, name: @hedgehog.name } }
    end

    assert_redirected_to hedgehog_url(Hedgehog.last)
  end

  test "should show hedgehog" do
    get hedgehog_url(@hedgehog)
    assert_response :success
  end

  test "should get edit" do
    get edit_hedgehog_url(@hedgehog)
    assert_response :success
  end

  test "should update hedgehog" do
    patch hedgehog_url(@hedgehog), params: { hedgehog: { age: @hedgehog.age, name: @hedgehog.name } }
    assert_redirected_to hedgehog_url(@hedgehog)
  end

  test "should destroy hedgehog" do
    assert_difference("Hedgehog.count", -1) do
      delete hedgehog_url(@hedgehog)
    end

    assert_redirected_to hedgehogs_url
  end
end
