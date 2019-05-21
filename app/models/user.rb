class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_secure_password
  # before_save {email.downcase!}
  validates :name, presence: true, length: {maximum: Settings.maximum_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.maximum_email},
  format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.minimum_pass},
    allow_nil: true
  validates :address, length: {minimum: Settings.minimum_address}
  # validates :phone, length: {minimum: 10}
  validates :gender, inclusion: {in: ["Female","Male",nil]}
  validates :permission, inclusion: {in: [true,false]}
  scope :select_column, -> {select :id, :email, :name, :address,:phone, :permission}
end
