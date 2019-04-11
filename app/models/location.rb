class Location < ApplicationRecord
  belongs_to :tour
  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  mount_uploader :picture, PictureUploader
  scope :select_column, -> {select :id, :name, :address, :description}
  scope :order_created_at_desc, -> {order created_at: :desc}
  scope :get_location_newest, -> {order(created_at: :desc).limit(Settings.maximum_newest)}
  scope :get_location_random, -> {order("RAND()").limit(Settings.maximum_newest)}
  scope :filter_by_tour, -> (tour_id){where(tour_id: tour_id)}
  scope :filter_by_name, -> (key){where("name LIKE ?", "%#{key}%")}
  scope :filter_by_duration, -> (duration){where("name LIKE ?", "%#{duration}%")}
  scope :filter_by_money, -> (money){where("name LIKE ?", "%#{money}%")}
end
