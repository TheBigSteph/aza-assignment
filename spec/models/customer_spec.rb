require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject { 
    described_class.new(
      fullname: "John Doe",
      email: "john@gmail.com"
    )
  }
  it "Is valid with valid attributes" do 
    expect(subject).to be_valid 
  end

  it "Is not valid without fullname" do
    subject.fullname = nil
    expect(subject).to_not  be_valid
  end

  it "Is not valid without email" do
    subject.email = nil
    expect(subject).to_not  be_valid
  end

  
end
