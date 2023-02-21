class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.text :title
      t.text :content
      t.timestamps
    end
  end
end
