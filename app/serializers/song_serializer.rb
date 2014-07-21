class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist, :duration, :price
end
