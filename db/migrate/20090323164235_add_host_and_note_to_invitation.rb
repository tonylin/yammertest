class AddHostAndNoteToInvitation < ActiveRecord::Migration
  def self.up
    add_column :invitations, :host_id, :integer
    add_column :invitations, :note, :string
  end

  def self.down
    remove_column :invitations, :host_id
    remove_column :invitations, :note
  end
end
