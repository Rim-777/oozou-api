module Api::V1
  class BaseController < ApplicationController
    include ::ActionController::Serialization
    respond_to :json
  end
end