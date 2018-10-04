require './test/test_helper'

class PermissionHelperTest < ActionView::TestCase
    def current_user
        @user
    end

    def test_member_can_create_a_post
        @group = groups(:dev)
        @user  = users(:member)
        assert can_create_post?
    end

    def test_member_has_post_cannot_create_post
        @group = groups(:dev)
        @user  = users(:author)
        refute can_create_post?
    end

    def test_non_member_cannot_create_post
        @group = groups(:dev)
        @user  = users(:nonmember)
        refute can_create_post?
    end
    
    def test_anonymous_user_cannot_create_post
        @group = groups(:dev)
        @user  = nil
        refute can_create_post?
    end

    def test_group_member_can_create_comment
        @group = groups(:dev)
        @user  = users(:member)
        assert can_create_comment? 
    end

    def test_group_member_with_post_can_create_comment
        @group = groups(:dev)
        @user  = users(:author)
        assert can_create_comment? 
    end

    def test_group_non_member_can_create_comment
        @group = groups(:dev)
        @user  = users(:nonmember)
        assert can_create_comment? 
    end

    def test_anonymous_user_cannot_create_comment
        @group = groups(:dev)
        @user  = nil
        refute can_create_comment?
    end



end