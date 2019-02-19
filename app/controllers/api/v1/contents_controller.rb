module Api::V1
  class ContentsController < BaseController

    def index
      respond_with :api, Content.with_status(:published), root: false
    end
  end
end
