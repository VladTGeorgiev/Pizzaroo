class Menu < ApplicationRecord
  belongs_to :dish
  belongs_to :restaurant
end
