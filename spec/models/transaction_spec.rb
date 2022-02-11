require 'rails_helper'

RSpec.describe Transaction, type: :model do
  
  customer = Customer.create(fullname: "John Doe", email: "john@gmail")
  
  subject { 
    described_class.new(
      customer_id: customer.id,
      input_amount: 100,
      input_currency: "Euro",
      output_amount: "55000",
      output_currency: "Xaf"
    )
   } 
  it "Is valid with valid attributes" do
    expect(subject).to be_valid 
  end

  it "Is not valid without customer_id" do
    subject.customer_id = nil
    expect(subject).to_not  be_valid
  end

  it "Is not valid without input_amount" do
    subject.input_amount = nil
    expect(subject).to_not  be_valid
  end

  it "Is not valid without input_currency" do
    subject.input_currency = nil
    expect(subject).to_not  be_valid
  end

  it "Is not valid without output_amount" do
    subject.output_amount = nil
    expect(subject).to_not  be_valid
  end

  it "Is not valid without output_currency" do
    subject.output_currency = nil
    expect(subject).to_not  be_valid
  end

  describe "Associations" do
    it { should belong_to(:customer) }
  end
  

end
