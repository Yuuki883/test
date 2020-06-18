class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.string :name
      t.text :body
      t.integer :user_id
      t.references :topic, foreign_key: true
      t.timestamps
    end
  end
end
