class Customer < ApplicationRecord
    validates_presence_of :fullname, :email
end
