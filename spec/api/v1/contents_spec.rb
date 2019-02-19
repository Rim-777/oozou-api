require 'rails_helper'

describe 'Contents API' do
  describe 'GET :index' do
    let(:author) {create(:author, name: 'Some Name')}
    let!(:content_list) do
      create_list(
          :content, 2,
          author: author,
          title: 'Some Title',
          published_at: '01.01.2018',
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

    let(:expected_response) do
      [
          {
              'author' => {
                  'name' => 'Some Name',
              },
              'title' => 'Some Title',
              'content' => 'Some Content',
              'published_at' => '2018-01-01T00:00:00.000Z',
              'summary' => 'Some Summary',
          }, {
              'author' => {
                  'name' => 'Some Name',
              },
              'title' => 'Some Title',
              'content' => 'Some Content',
              'published_at' => '2018-01-01T00:00:00.000Z',
              'summary' => 'Some Summary',
          }
      ]

    end

    before {get '/api/contents', params: {}, headers: headers, xhr: true}

    it 'returns status :ok' do
      expect(response).to be_success
    end

    it 'returns json with an array' do
      expect(response.body).to have_json_size(2).at_path('/')
    end

    it 'responses with an expected content' do
      expect(JSON.parse(response.body)).to eq expected_response
    end
  end
end
