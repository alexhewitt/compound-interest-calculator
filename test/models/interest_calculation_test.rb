require 'test_helper'

class InterestCalculationTest < ActiveSupport::TestCase
  setup do
    @standard = interest_calculations(:one)
    @low      = interest_calculations(:three)
    @high     = interest_calculations(:four)
  end

  test "record_count" do
    assert_equal 4, InterestCalculation.count
  end

  test "find_one" do
    assert_equal 5000, @standard.principal_amount
  end

  test "check interest calculation for different amounts" do
    assert_equal @standard.final_amount, InterestCalculation.compound_interest(@standard.principal_amount, @standard.interest_rate, @standard.duration, @standard.frequency).truncate(10)
    assert_equal @low.final_amount, InterestCalculation.compound_interest(@low.principal_amount, @low.interest_rate, @low.duration, @low.frequency).truncate(10)
    assert_equal @high.final_amount, InterestCalculation.compound_interest(@high.principal_amount, @high.interest_rate, @high.duration, @high.frequency).truncate(10)
  end
end
