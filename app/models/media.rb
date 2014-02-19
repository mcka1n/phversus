class Media < ActiveRecord::Base

  acts_as_taggable
  acts_as_taggable_on :tags
  scope :by_join_date, order("created_at DESC")
  acts_as_voteable

  has_many :distillates

  def self.save_media row
    # save my stuff
    result = false
    
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
    
    if media.save
      result = true
    end
    result
  end


  def self.tag_parse array_param
    result = ''
    array_param.each do |row|
      result = result + row
    end
  end

  def self.get_phversus_media_based_on_tag tag_param
    Media.tagged_with(tag_param)
  end

  def self.ask_for_fresh_popular_media
    popular_media = Instagram.media_popular
    popular_media.each do |row|

      if row.type != 'video'
        does_it_exists = Media.where(:instagram_id => row.id).count
        if does_it_exists == 0
            p '==> Boom!, saving an image'
            Media.save_media row
        end
      end
    end
    Media.all.count
  end

  def self.ask_for_media_by_tag tag_param
    # Go to Instagram
    tagged_media = Instagram.tag_recent_media tag_param
    p '======== Tagged media ======='
    tagged_media.each do |row|

      if row.type != 'video'
        does_it_exists = Media.where(:instagram_id => row.id).count
        if does_it_exists == 0
            p '==> Boom!, saving an image'
            Media.save_media row
        end
      end
    end
    Media.all.count

  end


end
