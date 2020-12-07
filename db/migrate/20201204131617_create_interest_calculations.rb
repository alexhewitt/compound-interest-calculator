class CreateInterestCalculations < ActiveRecord::Migration[6.0]
  def change
    create_table :interest_calculations do |t|

      t.timestamps
    end
  end
end
