class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.boolean :is_public
      t.string :img_url

      t.belongs_to :category, index: true
      t.belongs_to :author

      t.timestamps null: false
    end
  end
end
