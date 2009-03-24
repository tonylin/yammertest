class InviteController < ApplicationController
  def index
    @invitation_info = {
      Project.to_s=>Project.find(:all).collect {|p| ["Project%d"%p.id, p.id]},
      Group.to_s=>Group.find(:all).collect {|p| ["Group%d"%p.id, p.id]},
      Event.to_s=>Event.find(:all).collect {|p| ["Event%d"%p.id, p.id]}}
    @invitation_types = []
    @invitation_info.each_key {|key| @invitation_types << [key, key]}

  end

  def create
    puts "************%s"%params.inspect
    invitation = params['invitation']
    host = invitation['host']
    user = invitation['user']
    itype = invitation['type'].constantize.find_by_id(invitation['type_id'])
    puts "=============%s,%s,%s"%[invitation['type'],invitation['type_id'],itype]
    itype.invitations.create(:host_id=>host, :user_id=>user, :note=>invitation['note'])
    respond_to do |format|
        format.html { redirect_to :action => "index" }
    end
  end
end
