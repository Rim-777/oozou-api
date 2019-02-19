class PublishJob < ApplicationJob
  queue_as :default

  def perform(content)
    content.to_publish
  end
end
