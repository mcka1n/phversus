class HomeController < ApplicationController

	def index
		@home = 'Hello world!'
		puts Instagram.user_recent_media(777)
	end

end
