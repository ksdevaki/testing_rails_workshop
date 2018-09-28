require './test/test_helper'

class MembershipTest < ActiveSupport::TestCase
  def setup
    @member ||= memberships(:dev_author)
  end

  def test_valid_membership
    assert @member.valid?
  end

  def test_membership_without_user
    @member.user =nil
    refute @member.valid?
    assert_includes @member.errors[:user_id], "can't be blank"
  end

  def test_membership_without_group
    @member.group =nil
    refute @member.valid?
    assert_includes @member.errors[:group_id], "can't be blank"
  end

  def test_membership_with_duiplicate_user_id_and_group_id
    @member.save!
    duplicate_member = Membership.new 
    duplicate_member.user = @member.user
    duplicate_member.group =@member.group
    refute duplicate_member.valid?
    assert_includes duplicate_member.errors[:user_id], "has already been taken"
  end

end
