class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :name, :genre

  has_one :user

  has_many :songs
end
