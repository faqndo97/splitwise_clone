class User < ApplicationRecord
  has_and_belongs_to_many :groups
  has_many :creditor, class_name: 'Expense', foreign_key: 'payer_id'
  has_and_belongs_to_many :expenses, class_name: 'Expense', join_table: 'deptors_expenses', foreign_key: 'deptor_id'

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
