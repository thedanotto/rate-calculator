FactoryGirl.define do
  factory :loan do
    first_payment_date "2016-02-01"
    term 30
    starting_loan_amount 100000.99
    starting_rate 0.04375
  end
end
