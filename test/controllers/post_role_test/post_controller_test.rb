require './test/test_helper'

#Test cases for PostController to check the user roles..
class PostsControllerTest < ActionController::TestCase
    def setup
        @user = users(:author)
        request.session[:user_id] = @user.try(:id)
    end

    def test_group_member_with_a_post_for_day
        get :index, group_id: groups(:dev)
        assert_response :success
        assert_includes response.body, posts(:today).body
        refute_includes response.body, "Add Post!"
    end

    def test_group_member_without_a_post_for_day
        user = users(:member)
        request.session[:user_id] = user.try(:id)
        get :index, group_id: groups(:dev)
        assert_response :success
        assert_includes response.body, posts(:today).body
        assert_includes response.body, "Add Post!"
        
    end

    def test_group_non_member_without_a_post_for_day
        user = users(:nonmember)
        request.session[:user_id] = user.try(:id)
        get :index, group_id: groups(:dev)
        assert_response :success
        assert_includes response.body, posts(:today).body
        refute_includes response.body, "Add Post!"
    end
    def test_group_non_member_without_a_post_for_day
        user = users(:nonmember)
        request.session[:user_id] = user.try(:id)
        get :index, group_id: groups(:dev)
        assert_response :success
        assert_includes response.body, posts(:today).body
        refute_includes response.body, "Add Post!"
    end

    def test_anonymous_user
        user = nil
        request.session[:user_id] = nil
        get :index, group_id: groups(:dev)
        assert_response :redirect
        # assert_includes response.body, "Login"
        refute_includes response.body, posts(:today).body
        refute_includes response.body, "Add Post!"
    end 
end