class ContentSerializer < ActiveModel::Serializer
  attributes :title, :content, :summary, :published_date, :author

  def author
    AuthorSerializer.new(object.author, {root: false})
  end
end
