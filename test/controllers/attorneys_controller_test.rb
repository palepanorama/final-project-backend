require 'test_helper'

class AttorneysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attorney = attorneys(:one)
  end

  test "should get index" do
    get attorneys_url, as: :json
    assert_response :success
  end

  test "should create attorney" do
    assert_difference('Attorney.count') do
      post attorneys_url, params: { attorney: { description: @attorney.description, location: @attorney.location, name: @attorney.name } }, as: :json
    end

    assert_response 201
  end

  test "should show attorney" do
    get attorney_url(@attorney), as: :json
    assert_response :success
  end

  test "should update attorney" do
    patch attorney_url(@attorney), params: { attorney: { description: @attorney.description, location: @attorney.location, name: @attorney.name } }, as: :json
    assert_response 200
  end

  test "should destroy attorney" do
    assert_difference('Attorney.count', -1) do
      delete attorney_url(@attorney), as: :json
    end

    assert_response 204
  end
end
