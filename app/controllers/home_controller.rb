class HomeController < ApplicationController

  def index

    if user_signed_in?
      # ###################################
      # Show stuff related to user's tag_list
      # ###################################

      tag_to_search_for = Profile.get_random_interest current_user.profile.tag_list
      media_array = Media.get_phversus_media_based_on_tag tag_to_search_for
      
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
        do_random_media
        HarvestJob.new.async.perform tag_to_search_for
      end
      @tag_based_on_user = tag_to_search_for
    else
     do_random_media
    end
  end

  def do_random_media

     # ###################################
      # Show random stuff
      # ###################################
      @media_left = Media.all[Random.rand(Media.all.count)]
      @media_right = Media.all[Random.rand(Media.all.count)]

      @tag = @media_left.tag_list
      @picture_left = @media_left.large
      @picture_right = @media_right.large
  end

  def vote_up
    begin
      media = Media.find(params[:id])
      distillates = media.distillates.where(:tag => params[:tag])
      if distillates.count > 0
        current_user.vote_for(distillates.last)
      else
        distillate = Distillate.new
        distillate.media_id = media.id
        distillate.tag = params[:tag]
        distillate.save
        current_user.vote_for(distillate)
      end
      redirect_to :back
      flash[:sucess] = "You have voted successfully"
    rescue ActiveRecord::RecordInvalid
      redirect_to :back
      flash[:error] = "You have already voted for this one"
    end
  end

end
