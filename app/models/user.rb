class User < ActiveRecord::Base
  has_secure_password
  has_many :orders, dependent: :destroy
  has_many :items, through: :orders, dependent: :destroy
  validates_presence_of :email, :password, :password_confirmation
end
