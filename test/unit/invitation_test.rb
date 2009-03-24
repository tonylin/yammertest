require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_invitation
    u1 = User.create
    u2 = User.create
    p = Project.create
    g = Group.create
    e = Event.create
    assert p.invitations.create(:user=>u1, :host=>u2)
    assert g.invitations.create(:user=>u1, :host=>u2)
    assert e.invitations.create(:user=>u1, :host=>u2)
    assert_equal u1.invitations.length, 3
    assert_equal u2.sent_invitations.length, 3
  end

  def test_invitation_note
    u1 = User.create
    u2 = User.create
    p = Project.create
    my_note = "This is a project invitation"
    assert p.invitations.create(:user=>u1, :host=>u2, :note=>my_note)
    assert_equal p.invitations[0].note, my_note
  end

end
