require "./test/test_helper.rb"

class LoginCapybaraTest < Capybara::Rails::TestCase
    def test_navigation_changes_when_logged_in
        visit "/"                   #get "/"
                                    # assert_response :success
        assert_content /Login/      #assert_match /Login/, response.body
        refute_content /Logout/     #refute_match /Logout/, response.body

        visit "/login"              #get "/login"
                                    #assert_response :success

        # post_via_redirect "/login", user: {email: users(:author).email, password: "author"}
        fill_in "Email",	with: users(:author).email
        fill_in "Password", with: "author"
        click_on "Sign in"

        assert_equal current_path, "/"
        assert_content /Hello #{users(:author).name}/
        assert_content /Logout/
        refute_content /Login/

        # assert_equal "/", path # root_url, path
        # assert_match /Logout/, response.body
        # refute_match /Login/, response.body
    end
end