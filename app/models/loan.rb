class Loan < ActiveRecord::Base
  def cltv
    (self.starting_loan_amount + self.starting_second_loan_amount) / self.property_value
  end

  def ltv
    self.starting_loan_amount / self.property_value
  end

  def monthly_payment
    (monthly_starting_rate * self.starting_loan_amount / (1 - (1 + monthly_starting_rate)**-term_in_months)).round(2)
  end

  def monthly_starting_rate
    self.starting_rate / 12.0
  end

  def payments_made(inspect_on_date: Date.today)
    number_of_payments = (inspect_on_date.year * 12 + inspect_on_date.month) -
    (self.first_payment_date.year * 12 + self.first_payment_date.month) + 1

    [number_of_payments, 0].max
  end

  def remaining_loan_amount(inspect_on_date: Date.today)
    # formula http://www.financeformulas.net/Remaining_Balance_Formula.html
    future_value_of_original_balance = ((self.starting_loan_amount * (1 + monthly_starting_rate)**payments_made(inspect_on_date: inspect_on_date))) # working... left of the - sign
    future_value_of_annuity  = (monthly_payment / monthly_starting_rate) * (((1 + monthly_starting_rate)**payments_made(inspect_on_date: inspect_on_date)) - 1)

    (future_value_of_original_balance - future_value_of_annuity).round(2)
  end

  def term_in_months
    self.term * 12
  end
end
