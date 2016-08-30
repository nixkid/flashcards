class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :original_text
      t.text :translated_text
      t.date :review_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :cards, [:user_id, :created_at]
  end
end
