class Pool < ActiveRecord::Base
  
  acts_as_taggable
  scope :by_join_date, order("created_at DESC")
  acts_as_voteable

  def self.save_media row
    # save my stuff
    result = false
    
    pool = Pool.new
    pool.content_type = row.type
    pool.tag_list = row.tags.map{ |i|  %Q(#{i}) }.join(',')
    pool.instagram_id = row.id

    if row.caption
      pool.title = row.caption.text
    end

    pool.instagram_user_id = row.user.id
    pool.instagram_user_profile_picture = row.user.profile_picture
    pool.instagram_user_username = row.user.username
    pool.instagram_link = row.link
    pool.instagram_media_created_at = row.created_time
    pool.small = row.images.low_resolution.url
    pool.medium = row.images.thumbnail.url
    pool.large = row.images.standard_resolution.url
    
    if pool.save
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
    Pool.tagged_with(tag_param)
  end

  def self.ask_for_fresh_popular_media
    popular_media = Instagram.media_popular
    popular_pool.each do |row|

      if row.type != 'video'
        does_it_exists = Pool.where(:instagram_id => row.id).count
        if does_it_exists == 0
            p '==> Boom!, saving an image'
            Pool.save_media row
        end
      end
    end
    Pool.all.count
  end

  def self.ask_for_media_by_tag tag_param
    # Go to Instagram
    tagged_media = Instagram.tag_recent_media tag_param
    p '======== Tagged media ======='
    tagged_pool.each do |row|

      if row.type != 'video'
        does_it_exists = Pool.where(:instagram_id => row.id).count
        if does_it_exists == 0
            p '==> Boom!, saving an image'
            Pool.save_media row
        end
      end
    end
    Pool.all.count

  end
  
end
