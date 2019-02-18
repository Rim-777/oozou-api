Rails.application.routes.draw do
  api vendor_string: "oozou_api", default_version: 1 do
    version 1 do
      cache as: 'v1' do
        resources :contents, only: :index
      end
    end
  end
end
