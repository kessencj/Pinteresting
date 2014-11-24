class AddImageToBlogpost < ActiveRecord::Migration
  def change 
  	drop_table :posts
  	create_table :blog_posts do |t|
  		t.attachment :image
  		t.string :description

  		t.timestamps
  	end
  end
end
