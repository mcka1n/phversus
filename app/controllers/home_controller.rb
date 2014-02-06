class HomeController < ApplicationController

  def index

    if user_signed_in?
      # ###################################
      # Show stuff related to user's tag_list
      # ###################################

      tag_to_search_for = Profile.get_random_interest current_user.profile.tag_list
      

      @media_left = Media.all[Random.rand(Media.all.count)]
      @media_right = Media.all[Random.rand(Media.all.count)]

      @tag = @media_left.tag_list
      @picture_left = @media_left.large
      @picture_right = @media_right.large
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
