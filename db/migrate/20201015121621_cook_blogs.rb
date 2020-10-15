class CookBlogs < ActiveRecord::Migration[6.0]
  def change
    create_tables :posts do |t|
      t.text :autor
      t.text :content
      t.string :path_to_image

      t.timestamps
    end
  end
end
