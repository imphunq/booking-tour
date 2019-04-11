class Tour < ApplicationRecord
  has_many :locations, dependent: :destroy
  has_many :sales, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  mount_uploader :picture, PictureUploader
  scope :get_list_tour, -> {select :id, :name}
end
