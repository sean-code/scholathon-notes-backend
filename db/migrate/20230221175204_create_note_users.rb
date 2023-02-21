class CreateNoteUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :note_users do |t|
      t.belongs_to :note, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
