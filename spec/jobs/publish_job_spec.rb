require 'rails_helper'

RSpec.describe PublishJob, type: :job do
  let!(:content) do
    create(:content,
           author: create(:author, name: 'Some Author'),
           title: 'Some Title',
           published_at: '01.01.2018',
           summary: 'Some Summary',
           content: 'Some Content',
           status: 'draft'
    )
  end

  it 'receives to_publish method for content' do
    expect(content).to receive(:to_publish).once.and_call_original
    PublishJob.perform_now(content)
  end

  it 'sets a content status as published' do
    PublishJob.perform_now(content)
    expect(content.published?).to be_truthy
  end
end
