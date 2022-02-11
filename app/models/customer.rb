class Customer < ApplicationRecord
    has_many :transactions
    validates_presence_of :fullname, :email
end
