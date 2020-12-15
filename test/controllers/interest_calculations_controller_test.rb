require 'test_helper'

class InterestCalculationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interest_calculation = interest_calculations(:one)
  end

  test "should get index" do
    get interest_calculations_url
    assert_response :success
  end

  test "should get new" do
    get new_interest_calculation_url
    assert_response :success
  end

  test "should create interest_calculation" do
    assert_difference('InterestCalculation.count') do
      post interest_calculations_url, params: { interest_calculation: { 'principal_amount' => 5000, 'interest_rate' => 5, 'duration' => 10, 'frequency' => 12 } }
    end

    assert_redirected_to interest_calculation_url(InterestCalculation.last)
  end

  test "should show interest_calculation" do
    get interest_calculation_url(@interest_calculation)
    assert_response :success
  end

  test "should get edit" do
    get edit_interest_calculation_url(@interest_calculation)
    assert_response :success
  end

  test "should update interest_calculation" do
    patch interest_calculation_url(@interest_calculation), params: { interest_calculation: { 'principal_amount' => 5000, 'interest_rate' => 3, 'duration' => 10, 'frequency' => 12 } }
    assert_redirected_to interest_calculation_url(@interest_calculation)
  end

  test "should destroy interest_calculation" do
    assert_difference('InterestCalculation.count', -1) do
      delete interest_calculation_url(@interest_calculation)
    end

    assert_redirected_to interest_calculations_url
  end
end
