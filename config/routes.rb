require 'sidekiq/web'

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount Sidekiq::Web => '/sidekiq'
  api vendor_string: "oozou_api", default_version: 1 do
    version 1 do
      cache as: 'v1' do
        resources :contents, only: :index
      end
    end
  end
end
