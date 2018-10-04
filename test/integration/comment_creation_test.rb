require "./test/test_helper.rb"

class CommentCreationTest < Capybara::Rails::TestCase
    def test_create_new_comment
        visit '/'
        visit '/login'

        fill_in "Email",	with: users(:member).email 
        fill_in "Password",	with: "member"
        click_on "Sign in" 
        
        visit groups_path
        click_on "development"

        click_on "samplepost"
        
        click_on "Add Comment"
        assert_equal current_path, new_post_comment_path(posts(:today))

        fill_in "Body",	with: "Test Comments" 
        click_on "Create"

        #Because redirecting to post page after adding new comment...
        assert_equal current_path, post_path(posts(:today))
        assert_content /Test Comment/

    end

end