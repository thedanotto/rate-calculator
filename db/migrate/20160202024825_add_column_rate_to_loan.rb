class AddColumnRateToLoan < ActiveRecord::Migration
  def change
    add_column :loans, :rate, :decimal, precision: 6, scale: 5
  end
end
