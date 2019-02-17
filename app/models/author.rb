class Author < ApplicationRecord
  has_many :contents, dependent: :destroy, inverse_of: :author
end
