class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :orders
    has_many :dishes, through: :order_dishes
end
