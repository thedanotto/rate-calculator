FactoryGirl.define do
  factory :loan do
    first_payment_date "2016-02-01"
    term 1
    loan_type "MyString"
    loan_amount "9.99"
    second_loan_amount "9.99"
    property_value "9.99"
    fico1 1
    fico2 1
    escrow false
    occupancy "MyString"
    property_type "MyString"
    deal_type "MyString"
    zip_code 1
  end
end
