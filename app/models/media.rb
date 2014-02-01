class Media < ActiveRecord::Base

	def self.ask_for_fresh_popular_media

		popular_media = Instagram.media_popular
		popular_media.each do |row|
			if row.type != 'video' && row.caption.id
				p '--------------'
				p row
				p '--------------'
				does_it_exists = Media.where(:instagram_id => row.caption.id).count
				if does_it_exists == 0
					p '==> Boom, saving an image'
					media = Media.new
					media.content_type = row.type
					media.tags = row.tags.to_s
					media.instagram_id = row.caption.id
					media.title = row.caption.text
					media.instagram_user_id = row.caption.from.id
					media.instagram_user_profile_picture = row.caption.from.profile_picture
					media.instagram_user_username = row.caption.from.username
					media.instagram_link = row.link
					media.instagram_media_created_at = row.created_time
					media.small = row.images.low_resolution.url
					media.medium = row.images.thumbnail.url
					media.large = row.images.standard_resolution.url
					media.save
				end
			end
		end
	end

end
