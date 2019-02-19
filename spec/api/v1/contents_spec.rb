require 'rails_helper'

describe 'Contents API' do
  describe 'GET :index' do
    let(:author) {create(:author, name: 'Some Name')}
    let!(:content_list) do
      create_list(
          :content, 2,
          author: author,
          title: 'Some Title',
          published_date: '01.01.2018',
          summary: 'Some Summary',
          content: 'Some Content',
          status: 'published'
      )
    end

    let(:headers) do
      {
          "HTTP_ACCEPT" => "application/json"
      }
    end

    let(:response_item) do
      {
          author: {
              name: 'Some Name',
          },
          title: 'Some Title',
          content: 'Some Content',
          published_date: '2018-01-01T00:00:00.000Z',
          summary: 'Some Summary',
      }
    end

    let(:request) {get '/api/contents', params: {}, headers: headers, xhr: true}

    before {request}

    it 'returns status :ok' do
      expect(response).to be_success
    end

    it 'returns json with an array' do
      expect(response.body).to have_json_size(2).at_path('/')
    end

    it 'responses with an expected content' do
      JSON.parse(response.body).each do |content|
        expect(content.deep_symbolize_keys).to eq response_item
      end
    end
  end
end
