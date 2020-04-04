class Group < ApplicationRecord
  has_and_belongs_to_many :users

  enum category: %i[home apartment office other]

  validates :name, :category, presence: true
end
