class Event < ActiveRecord::Base
  has_many :invitations, :as => :participant
end
