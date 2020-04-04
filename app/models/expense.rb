class Expense < ApplicationRecord
  belongs_to :payer, class_name: 'User'
  belongs_to :group

  has_and_belongs_to_many :deptors, class_name: 'User', join_table: 'deptors_expenses', association_foreign_key: 'deptor_id'
end
