class Hotel < ApplicationRecord
  validates :name, uniqueness: true
end
