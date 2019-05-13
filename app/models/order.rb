class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :location
  scope :select_col, -> {select :id, :user_id, :location_id, :money, :quantity}
  scope :filter_by_user_id, -> (user_id){where(user_id: user_id)}
end
