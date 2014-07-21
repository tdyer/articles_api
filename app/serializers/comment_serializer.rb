class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :creator

  # virtual attribute
  def creator
    "#{object.user.email}"
  end
end
