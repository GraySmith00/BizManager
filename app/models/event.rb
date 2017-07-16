class Event < ApplicationRecord
  has_many :revenues, dependent: :destroy
  has_many :expenses, dependent: :destroy
  
end
