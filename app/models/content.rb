class Content < ApplicationRecord
  validates :title,
            :summary,
            :content,
            :status,
            :published_at,
            presence: true

  belongs_to :author, inverse_of: :contents

  after_create :publish_on_date

  def publish_on_date
    return if published?
    PublishJob.set(wait_until: published_at).perform_later(self)
  end

  state_machine :status, :initial => :draft do
    event :to_publish do
      transition all => :published
    end

    event :to_draft do
      transition all => :draft
    end
  end
end
