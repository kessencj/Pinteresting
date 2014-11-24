class ChangingPostsType < ActiveRecord::Migration
  def change
  	remove_column :blog_posts, :description
  	add_column :blog_posts, :description, :text
  end
end
