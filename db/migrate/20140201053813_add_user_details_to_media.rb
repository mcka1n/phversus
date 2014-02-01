class AddUserDetailsToMedia < ActiveRecord::Migration
  def change
  	add_column :media, :instagram_user_profile_picture, :string
  	add_column :media, :instagram_user_username, :string
  	add_column :media, :instagram_media_created_at, :string
    add_index :media, :instagram_user_id
  end
end
