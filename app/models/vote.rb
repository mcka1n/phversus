class Vote < ActiveRecord::Base

	def recent_media
		# Get a list of a user's most recent media
		puts Instagram.user_recent_media(777)
	end
end
