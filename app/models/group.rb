class Group < ApplicationRecord
  enum category: %i[home apartment office other]

  validate :name, :category, presence: true
end
