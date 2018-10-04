require "./test/test_helper.rb"

class PostCreationTest < Capybara::Rails::TestCase
    def test_post_create
        visit '/'
        visit '/login'

        fill_in "Email",	with: users(:member).email 
        fill_in "Password",	with: "member"
        click_on "Sign in" 
        
        visit groups_path
        click_on "development"

        fill_in "Body",	with: "Test Post" 
        click_on "Create"

        assert_equal current_path, post_path(Post.last)
        assert_content "Test Post"
    end
end