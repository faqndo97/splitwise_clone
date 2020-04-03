class User < ApplicationRecord
  validate :name, :email, presence: true
  validates :email, uniqueness: true
end
