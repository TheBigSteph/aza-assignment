class Customer < ApplicationRecord
    validates_presence_of :fullname
    validates_presence_of :email
end
