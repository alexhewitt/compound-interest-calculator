class AddColumnsToInterestCalculation < ActiveRecord::Migration[6.0]
  def change
    add_column :interest_calculations, :principal_amount, :decimal
    add_column :interest_calculations, :interest_rate, :decimal
    add_column :interest_calculations, :duration, :integer
    add_column :interest_calculations, :frequency, :integer
    add_column :interest_calculations, :final_amount, :decimal
  end
end
