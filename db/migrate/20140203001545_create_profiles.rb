class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.integer  "user_id"
	    t.string   "username"
	    t.string   "first_name"
	    t.string   "last_name"
	    t.string   "gender"
	    t.date     "birthday"
	    t.integer  "phone"
	    t.string   "current_city"
	    t.string   "address"
	    t.integer  "zip"
	    t.text     "about"
	    t.string   "school"
	    t.string   "employer"
	    t.string   "languages"
	    t.string   "facebook"
	    t.string   "twitter"
	    t.string   "linkedin"
	    t.string   "instagram"
	    t.string   "youtube"
      t.timestamps
    end
  end
end
