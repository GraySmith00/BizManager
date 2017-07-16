class Revenue < ApplicationRecord
  belongs_to :event
  
  def self.persisted
    where.not(id: nil)
  end
end
