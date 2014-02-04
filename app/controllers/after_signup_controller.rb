class AfterSignupController < ApplicationController
  include Wicked::Wizard
  before_filter :authenticate_user!

  steps :add_interests_list

  def show
    @user = current_user
    case step
    when :add_interests_list
      @profile = Profile.new
      @profile.user_id = @user.id
      @profile.save

      @username = @user.profile.username
    end
    render_wizard
  end


  def update
    @user = current_user
    case step
    when :add_interests_list
      @profile = @user.profile
      @profile.update_attributes(user_profile_parameters)
    end
    sign_in(@user, :bypass => true) # needed for devise
    render_wizard @user
  end


  private
  def user_profile_parameters
    params.require(:profile).permit(:user_id, :username, :first_name, :last_name, :gender, :birthday, :phone, :current_city, :address, :zip, :about, :school, :employer, :languages, :facebook, :twitter, :linkedin, :youtube, :instagram, :tag_list)
  end

end
