class User < ActiveRecord::Base
  has_many :invitations
  has_many :sent_invitations, :class_name => "Invitation", :foreign_key => "host_id"
end
