class HomeController < ApplicationController

  def index

    if user_signed_in?
      # ###################################
      # Show stuff related to user's tag_list
      # ###################################
      p '------- ok, user is in'
      tag_to_search_for = Profile.get_random_interest current_user.profile.tag_list
      media_array = Media.get_phversus_media_based_on_tag tag_to_search_for
      p '--------- tag: ' + tag_to_search_for
      p ' -------- array: '+media_array.to_s
      p ' -------- count: '+media_array.count.to_s
      if media_array.count > 0
        @media_left = media_array[Random.rand(media_array.count)]
        @media_right = media_array[Random.rand(media_array.count)]

        @tag = @media_left.tag_list
        @picture_left = @media_left.large
        @picture_right = @media_right.large
      else
        # We need to go and search on Instagram for this tag.
        # If we can not find the specific tag, let's look for 
   	# related ones.
        media_array_based_on_tag = Media.ask_for_media_by_tag tag_to_search_for 
      end

    else
      # ###################################
      # Show random stuff
      # ###################################
      @media_left = Media.all[Random.rand(Media.all.count)]
      @media_right = Media.all[Random.rand(Media.all.count)]

      @tag = @media_left.tag_list
      @picture_left = @media_left.large
      @picture_right = @media_right.large
    end
  end

end
