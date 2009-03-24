class Invitation < ActiveRecord::Base
  belongs_to :participant, :polymorphic => true
  belongs_to :user;
  belongs_to :host, :class_name=>"User", :foreign_key => "host_id"
end
