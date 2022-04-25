require "test_helper"

class BenevolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @benevole = benevoles(:one)
  end

  test "should get index" do
    get benevoles_url, as: :json
    assert_response :success
  end

  test "should create benevole" do
    assert_difference('Benevole.count') do
      post benevoles_url, params: { benevole: { email: @benevole.email, firstName: @benevole.firstName, lastName: @benevole.lastName } }, as: :json
    end

    assert_response 201
  end

  test "should show benevole" do
    get benevole_url(@benevole), as: :json
    assert_response :success
  end

  test "should update benevole" do
    patch benevole_url(@benevole), params: { benevole: { email: @benevole.email, firstName: @benevole.firstName, lastName: @benevole.lastName } }, as: :json
    assert_response 200
  end

  test "should destroy benevole" do
    assert_difference('Benevole.count', -1) do
      delete benevole_url(@benevole), as: :json
    end

    assert_response 204
  end
end
