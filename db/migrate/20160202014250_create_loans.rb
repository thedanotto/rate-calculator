class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.date :first_payment_date
      t.integer :term
      t.string :loan_type
      t.decimal :loan_amount, precision: 10, scale: 2
      t.decimal :second_loan_amount, precision: 10, scale: 2
      t.decimal :property_value, precision: 10, scale: 2
      t.integer :fico1
      t.integer :fico2
      t.boolean :escrow
      t.string :occupancy
      t.string :property_type
      t.string :deal_type
      t.integer :zip_code

      t.timestamps null: false
    end
  end
end
