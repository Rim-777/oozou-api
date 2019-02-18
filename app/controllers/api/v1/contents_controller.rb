module Api::V1
  class ContentsController < BaseController

    def index
      render json: Content.with_status(:published), each_serializer: ContentSerializer, status: :ok
    end

  end
end
