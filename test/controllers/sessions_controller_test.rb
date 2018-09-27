require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  
  def new_user
    @new_user ||=users :test1
  end

  def test_show_login_form
    get :new
    assert_response :success
  end

  def test_login_with_valid_credentials
    post :create, user: {email: new_user.email, password: "test1"}
    assert_redirected_to root_path

  end

  def test_login_with_invalid_credentials
    post :create, user: {email: new_user.email, password: "test"}
    assert_response :success
    assert_template :new
  end

  def test_destroy
    delete :destroy
      assert_redirected_to root_path
    
  end

end
