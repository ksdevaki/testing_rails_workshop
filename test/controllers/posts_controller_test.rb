require './test/test_helper'

class PostsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:nonmember)
    # login_path(user=@user, route = login_url)
    request.session[:user_id] = @user.try(:id)
  end

  def test_index
    get :index
    assert_response :success
    assert_includes response.body, posts(:today).body
  end

  def test_show
    get :show, id: posts(:today)
    assert_response :success
    assert_includes response.body, posts(:today).body
  end
  #Test for checking the comments for the post
  def test_show_lists_comments
    get :show, id: posts(:today)
    assert_response :success
    assert_includes response.body, comments(:today_member).body
    # assert page.has_content?(comments(:today_member).body)
  end

  # Create
  def test_new_post
    # current_user = users(:author)
    get :new
    assert_response :success
  end

  def test_create_post
    assert_difference "Post.count", 1 do
      post :create, post: {group_id: groups(:dev).id, body: "samplepost test2"}
    end
   assert_redirected_to post_path(assigns(:post))

  end

end
