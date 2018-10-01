require './test/test_helper'

class PostsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

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
  end

  #Create
  # def test_new_post
  #   current_user = users(:author)
  #   get :new
  #   assert_response :success
  # end

  # def test_create_post
  #   assert_difference "Post.count", 1 do
  #     post :create, post: {groups: groups(:dev),
  #                           users: users(:test2),
  #                           date: Time.zone.today,
  #                         body: "samplepost test2" }
  #   end
  #  assert_redirected_to post_path(assigns(:post))

  # end

end
