require "./test/test_helper"

class LoginTest < ActionDispatch::IntegrationTest
    def test_navigation_changes_when_logged_in
        get "/"
        assert_response :success
        assert_match /Login/, response.body
        refute_match /Logout/, response.body

        get "/login"
        assert_response :success

        post_via_redirect "/login", user: {email: users(:author).email, password: "author"}
        assert_equal "/", path # root_url, path
        assert_match /Logout/, response.body
        refute_match /Login/, response.body
    end
end