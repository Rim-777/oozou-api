require 'rails_helper'

RSpec.describe Content, type: :model do
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:published_at)}
  it {should validate_presence_of(:summary)}
  it {should validate_presence_of(:content)}
  it {should validate_presence_of(:status)}
  it {should belong_to(:author)}

  describe '#publish_on_date' do
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

    context 'draft' do
      it 'runs the publish job' do
        expect(PublishJob).to receive(:set).once.with({wait_until: content.published_at}).and_call_original
        content.publish_on_date
      end
    end

    context 'published' do
      context 'draft' do
        before {content.to_publish}

        it 'does not run the publish job' do
          expect(PublishJob).to_not receive(:set)
          content.publish_on_date
        end
      end
    end
  end

  describe '. after_create callback for publish_on_date' do
    let(:content) do
      build(:content,
             author: create(:author, name: 'Some Author'),
             title: 'Some Title',
             published_at: '01.01.2018',
             summary: 'Some Summary',
             content: 'Some Content',
             status: 'draft'
      )
    end

    it 'receives the publish_on_date method after the content is created' do
      expect(content).to receive(:publish_on_date).once.and_call_original
      content.save
    end
  end
end
