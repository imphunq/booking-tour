class Comment < ApplicationRecord
  belongs_to :location
  belongs_to :user
  scope :select_col, -> {select :id, :content, :user_id, :location_id}
  scope :get_comment, -> {order(created_at: :desc).limit(5)}
  scope :filter_by_location, -> (location_id){where(location_id: location_id)}
end
