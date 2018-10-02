require './test/test_helper'

class CommentsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:author)
    # login_path(user=@user, route = login_url)
    request.session[:user_id] = @user.try(:id)
  end

  def test_add_new_comments
    get :new, post_id: posts(:two)
    assert_response :success
  end

  def test_create_new_comment_for_post
    
    assert_difference "Comment.count", 1 do
      current_user = users(:author)
      post :create, post_id: posts(:today), comment: {body: "test comments" }
      
    end
    assert_redirected_to post_path( posts(:today))
  end

end
