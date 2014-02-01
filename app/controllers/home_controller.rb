class HomeController < ApplicationController

	def index
		@media_left = Media.all[Random.rand(Media.all.count)]
		@media_right = Media.all[Random.rand(Media.all.count)]

		@tag = @media_left.tags
		@picture_left = @media_left.large
		@picture_right = @media_right.large

	end

end
