class Group < ApplicationRecord
  enum category: %i[home apartment office other]
end
