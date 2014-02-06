class Media < ActiveRecord::Base

  acts_as_taggable
  acts_as_taggable_on :tags
  scope :by_join_date, order("created_at DESC")

  def self.tag_parse array_param
    result = ''
    array_param.each do |row|
      result = result + row
    end
  end

  def self.get_media_based_on_tag tag_param
    # Do this shit
    # http://stackoverflow.com/questions/2816562/acts-as-taggable-on-find-tags-with-name-like-sort-by-tag-counts
    #User.skill_counts.order('count DESC').limit(5).where('tags.name LIKE ?', params[:query]) 
    Media.tags.order('created_at DESC').limit(5).where('tags.name LIKE ?', 'nyc') 
  end

  def self.ask_for_fresh_popular_media
    popular_media = Instagram.media_popular
    popular_media.each do |row|

      if row.type != 'video'
        does_it_exists = Media.where(:instagram_id => row.id).count
        if does_it_exists == 0
            p '==> Boom!, saving an image'
            media = Media.new
            media.content_type = row.type
            media.tag_list = row.tags.map{ |i|  %Q(#{i}) }.join(',')
            media.instagram_id = row.id

            if row.caption
              media.title = row.caption.text
            end
            
            media.instagram_user_id = row.user.id
            media.instagram_user_profile_picture = row.user.profile_picture
            media.instagram_user_username = row.user.username
            media.instagram_link = row.link
            media.instagram_media_created_at = row.created_time
            media.small = row.images.low_resolution.url
            media.medium = row.images.thumbnail.url
            media.large = row.images.standard_resolution.url
            media.save
        end
      end
    end
    Media.all.count
  end

end
