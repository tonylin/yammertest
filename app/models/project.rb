class Project < ActiveRecord::Base
  has_many :invitations, :as => :participant
end
