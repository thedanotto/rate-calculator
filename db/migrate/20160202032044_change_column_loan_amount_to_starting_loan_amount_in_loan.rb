class ChangeColumnLoanAmountToStartingLoanAmountInLoan < ActiveRecord::Migration
  def change
    rename_column :loans, :loan_amount, :starting_loan_amount
    rename_column :loans, :rate, :starting_rate
    rename_column :loans, :second_loan_amount, :starting_second_loan_amount
  end
end
