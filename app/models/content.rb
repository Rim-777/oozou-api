class Content < ApplicationRecord
  validates :title, :content, :status, presence: true
  belongs_to :author, inverse_of: :contents

  state_machine :status, :initial => :draft do
    event :publish do
      transition all => :published
    end

    event :to_draft do
      transition all => :draft
    end
  end
end
