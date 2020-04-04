class DeptorsExpense < ApplicationRecord
  belongs_to :expense
  belongs_to :deptor, class_name: 'User'
end
