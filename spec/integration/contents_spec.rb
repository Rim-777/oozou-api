require 'swagger_helper'

describe 'Contents API' do
  path '/api/contents' do
    get 'gets a list of published contents' do
      tags 'Contents'
      consumes 'application/json', 'application/xml'

      response '200', 'returns a content list'  do
            examples 'application/json' =>  [
              {
                  author: {name: 'Some Name 1'},
                  title: 'Some Title 1',
                  published_at: 1.day.ago,
                  summary: 'Some Summary 1',
                  content: 'Some Content 2',
                  status: 'published'
              }, {
                  author: {name: 'Some Name 2'},
                  title: 'Some Title 2',
                  published_at: 2.day.ago,
                  summary: 'Some Summary 2',
                  content: 'Some Content 2',
                  status: 'published'
              }
          ]

        run_test!
      end
    end
  end
end
