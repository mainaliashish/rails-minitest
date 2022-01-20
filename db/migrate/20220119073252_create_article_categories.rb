class CreateArticleCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :article_categories do |t|
      t.integer :category_id
      t.integer :article_id

      t.timestamps
    end
  end
end
