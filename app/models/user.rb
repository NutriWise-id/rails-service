class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :email_address, uniqueness: { case_sensitive: false }
  validates :password, presence: true
end
