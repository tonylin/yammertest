class Group < ActiveRecord::Base
  has_many :invitations, :as => :participant
end
