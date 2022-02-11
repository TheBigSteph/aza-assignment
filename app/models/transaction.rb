class Transaction < ApplicationRecord
  belongs_to :customer, class_name: "Customer"
  validates_presence_of :customer_id, :input_amount, :input_currency, :output_amount, :output_currency
end
