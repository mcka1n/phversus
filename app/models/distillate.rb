class Distillate < ActiveRecord::Base

  acts_as_voteable
  belongs_to :media

end
