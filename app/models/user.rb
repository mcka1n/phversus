class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:instagram]
  has_one :profile
  acts_as_voter

  def self.from_omniauth auth
    results = where(auth.slice("provider", "uid"))
    user = nil
    if results.any?
      user = results.first
      update_from_omniauth user, auth
    else
      user = create_from_omniauth auth
    end
    
    user
  end


  def self.update_from_omniauth user, auth
    load_auth_info user, auth
    user.save
  end
  
  def self.create_from_omniauth auth
    create do |user|
      load_auth_info user, auth
      user.password = Devise.friendly_token[0,20]
      p '=====update_from_omniauth====='
      p user
    end
  end
  
  private
  
  def self.load_auth_info user, auth
    p 'auth: '+auth.to_s
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.name = auth["info"]["name"]
    user.first_name = auth["info"]["first_name"]
    user.last_name = auth["info"]["last_name"]
    user.email = auth["info"]["email"]
    user.picture = auth["info"]["image"]
  end

end
