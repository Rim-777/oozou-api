class Content < ApplicationRecord
  belongs_to :author, inverse_of: :contents
end
