require 'rails_helper'

RSpec.describe Loan, type: :model do
  describe "#cltv" do
    it "should return the combined loan to value for a loan" do
      loan = build_stubbed(:loan, starting_loan_amount: 100, starting_second_loan_amount: 50, property_value: 200)

      expect(loan.cltv).to eq(0.75)
    end
  end

  describe "#ltv" do
    it "should return the loan to value for a given loan" do
      loan = build_stubbed(:loan, starting_loan_amount: 100, property_value: 200)

      expect(loan.ltv).to eq(0.5)
    end
  end

  describe "#monthly_payment" do
    it "should return the monthly payment for a loan" do
      loan = build_stubbed(:loan, term: 30, starting_loan_amount: 100000, starting_rate: 0.04375)

      expect(loan.monthly_payment).to eq(499.29)
    end
  end

  describe "#monthly_starting_rate" do
    it "divides the starting_rate by 12" do
      loan = build_stubbed(:loan, starting_rate: 0.06)

      expect(loan.monthly_starting_rate).to eq(0.005)
    end

    it "does not round to the nearest integer" do
      loan = build_stubbed(:loan, starting_rate: 18)

      expect(loan.monthly_starting_rate).to eq(1.5)
    end
  end

  describe "#payments_made" do
    it "calculates the number of payments made compared to a provided date" do
      loan = build_stubbed(:loan, first_payment_date: Date.civil(2014, 1, 1))

      expect(loan.payments_made(inspect_on_date: Date.civil(2016, 2, 1))).to eq(26)
    end

    it "should be 12 for January to December" do
      loan = build_stubbed(:loan, first_payment_date: Date.civil(2015, 1, 1))

      expect(loan.payments_made(inspect_on_date: Date.civil(2015, 12, 1))).to eq(12)
    end

    it "should be 1 if the inspect date is in the same month as the first payment date" do
      loan = build_stubbed(:loan, first_payment_date: Date.civil(2015, 1, 1))

      expect(loan.payments_made(inspect_on_date: Date.civil(2015, 1, 2))).to eq(1)
    end

    it "should be 0 if the inspect date is prior to the first payment date" do
      loan = build_stubbed(:loan, first_payment_date: Date.civil(2015, 1, 1))

      expect(loan.payments_made(inspect_on_date: Date.civil(2014, 1, 2))).to eq(0)
    end
  end

  
  describe "#remaining_loan_amount" do
    it "returns the remaining balance of the loan" do
      loan = build_stubbed(:loan, term: 5, starting_loan_amount: 25000, starting_rate: 0.07, first_payment_date: Date.civil(2015, 1, 1))
      viewing_date = Date.civil(2015, 12, 1)

      expect(loan.remaining_loan_amount(inspect_on_date: viewing_date)).to eq(20672.55)
    end

    it "returns the remaining blaance of the loan after 13 months" do
      loan = build_stubbed(:loan, term: 5, starting_loan_amount: 25000, starting_rate: 0.07, first_payment_date: Date.civil(2015, 1, 1))
      viewing_date = Date.civil(2016, 1, 1)

      expect(loan.remaining_loan_amount(inspect_on_date: viewing_date)).to eq(20298.11)
     end
  end

  describe "#term_in_months" do
    it "translates the term into months" do
      loan = build_stubbed(:loan, term: 30)

      expect(loan.term_in_months).to eq(360)
    end
  end
end
