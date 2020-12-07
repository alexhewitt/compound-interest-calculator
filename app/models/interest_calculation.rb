class InterestCalculation < ApplicationRecord

  validates_presence_of :principal_amount, numericality: true
  validates_presence_of :interest_rate, numericality: true
  validates_presence_of :duration
  validates_presence_of :frequency

  validates :principal_amount, numericality: true
  validates :interest_rate, numericality: true
  
  def self.compound_interest(p, r, t, n)
    a = p * (1 + r/n) ** (n*t)
  end
end
