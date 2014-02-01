class HomeController < ApplicationController

	def index
		@photo = 'http://google.com/picturea'
		@tag = 'NYC'
		puts Instagram.user_recent_media(777)
	end

end
