class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :username
      t.text :bio
      t.text :password

      t.timestamps
    end
  end
end
