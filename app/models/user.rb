class User < ApplicationRecord
  has_and_belongs_to_many :groups
  has_many :creditor, class_name: 'Expense', foreign_key: 'payer_id'

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
