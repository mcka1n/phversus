class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
    	t.string   "instagram_id"
    	t.string   "instagram_user_id"
    	t.string   "instagram_link"
    	t.string   "title"
    	t.text     "description"
    	t.string   "slug"
    	t.string   "tags"
    	t.string   "content_type"
    	t.string   "small"
    	t.string   "medium"
    	t.string   "large"
      t.timestamps
    end
  end
end
