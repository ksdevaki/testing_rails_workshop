require './test/test_helper'

class Group::GroupMembershipTest < ActiveSupport::TestCase
    
    def setup
        @group ||=groups(:dev)
    end

    def test_user_is_member
        # user = users(:author)
        assert @group.is_member?(users(:author))
        refute @group.is_member?(users(:nonmember))

    end

    def test_add_a_new_member
        user = users(:nonmember)
        refute @group.is_member? user
        assert @group.add_member(user)
        assert @group.is_member? user
    end

    # Addded to test no error when trying to add the existing user 
    def test_add_an_existing_member_is_noop
        user = users :member
        assert @group.is_member?(user)
        @group.add_member user
        assert @group.is_member?(user)
      end

    def test_remove_a_member
        user = users(:author)
        assert @group.is_member? user
        assert @group.remove_member(user)
        refute @group.is_member? user
    end

    # Addded to test no error when trying to remove the non-existing user 
    def test_remove_an_non_member_is_noop
        user = users :nonmember
        refute @group.is_member?(user)
        @group.remove_member user
        refute @group.is_member?(user)
      end

end