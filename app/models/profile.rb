class Profile < ActiveRecord::Base
  #attr_accessible :user_id, :username, :first_name, :last_name, :gender, :birthday, :phone, :current_city, :address, :zip, :about, :school, :employer, :languages, :facebook, :twitter, :linkedin, :youtube, :instagram
  
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  belongs_to :user

end
