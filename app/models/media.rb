class Media < ActiveRecord::Base

	def self.ask_for_fresh_popular_media
		first = Instagram.media_popular.first
		p '----------------- Media info ---------------------'
		p 'type:'
		p first.type
		p 'tags: '
		p first.tags
		p "caption: "
		p first.caption.id
		p first.caption.text
		p 'instagram_user_id:'
		p first.caption.from.id
		p first.caption.from.profile_picture
		p first.caption.from.username
		p '--------------------Media details--------------------'
		p first.link
		p first.images
	end

end
