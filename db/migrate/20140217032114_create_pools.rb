class CreatePools < ActiveRecord::Migration
  def change
    create_table :pools do |t|
      t.string   "instagram_id"
      t.string   "instagram_user_id"
      t.string   "instagram_link"
      t.string   "title"
      t.text     "description"
      t.string   "slug"
      t.string   "content_type"
      t.string   "small"
      t.string   "medium"
      t.string   "large"
      t.string   "instagram_user_profile_picture"
      t.string   "instagram_user_username"
      t.string   "instagram_media_created_at"
      t.timestamps
    end
  end
end
