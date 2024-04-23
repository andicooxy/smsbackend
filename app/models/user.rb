class User < ApplicationRecord
  belongs_to :user_type
  has_secure_password
  validates :username, uniqueness: true
end
