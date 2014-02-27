class AfterSignupController < ApplicationController
  include Wicked::Wizard
  before_filter :authenticate_user!

  steps :add_interests_list

  def show
    @user = current_user
    case step
    when :add_interests_list
      if !@user.profile
        @profile = Profile.save_profile @user
      else
        @profile = @user.profile
      end
    end
    render_wizard
  end


  def update
    @user = current_user
    case step
    when :add_interests_list
      profile = @user.profile

      if profile.tag_list.empty?
        profile.update_attributes(user_profile_parameters)

        if current_user.email == 'temporary_email@domain.com'
          if !user_profile_parameters[:address].empty? && user_profile_parameters[:address] != 'temporary_email@domain.com'
            p 'BOOM lets save the new email address'
            current_user.email = user_profile_parameters[:address]
            current_user.save
          end
        end

      end
    end
    sign_in(@user, :bypass => true) # needed for devise
    render_wizard @user
  end


  private
  def user_profile_parameters
    params.require(:profile).permit(:user_id, :username, :first_name, :last_name, :gender, :birthday, :phone, :current_city, :address, :zip, :about, :school, :employer, :languages, :facebook, :twitter, :linkedin, :youtube, :instagram, :tag_list)
  end

end
