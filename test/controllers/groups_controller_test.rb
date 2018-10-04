require './test/test_helper'

class GroupsControllerTest < ActionController::TestCase
  # test "should get index" do
  #   get :index
  #   assert_response :success
  # end

  # test "should get show" do
  #   get :show , id: groups(:dev)
  #   assert_response :success
  # end
  def setup
    @user = users(:author)
    request.session[:user_id] = @user.try(:id)
  end
  def test_index
    get :index
    assert_response :success
  end

  def test_show
    get :show, id: groups(:dev)
    assert_response :success
    # Displays the Post
    assert_includes response.body, posts(:today).body
  end
  

  def test_show_with_date_query
    get :show, id: groups(:dev) , date: Time.zone.today
    
    assert_response :success
    # Displays the Post
    assert_includes response.body, posts(:today).body
    refute_includes response.body, posts(:yesterday).body
  end

  #Handle for give bad date
  def test_show_with_bad_date
    get :show, id: groups(:dev), date: "sfdsf"
    assert_redirected_to group_path(groups(:dev))
    # assert_response :success
    # assert_includes response.body, posts(:today).body
    # assert_includes response.body, posts(:yesterday).body
  end


end
