class NoteUser < ApplicationRecord
    belongs_to :user
    belongs_to :note
end
