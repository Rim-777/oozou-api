class Author < ApplicationRecord
  validates :name, presence: true
  has_many :contents, dependent: :destroy, inverse_of: :author
end
