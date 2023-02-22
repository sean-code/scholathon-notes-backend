class NoteUserSerializer < ActiveModel::Serializer
  attributes :id, :username
  belongs_to :user
  belongs_to :note
end
