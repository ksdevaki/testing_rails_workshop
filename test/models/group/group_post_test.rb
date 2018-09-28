require './test/test_helper'

class Group::GroupPostTest < ActiveSupport::TestCase
    def setup
        @group ||=groups(:dev)
    end

    def test_get_post_for_the_day
        assert_equal 2, @group.post_for_day(Time.zone.today).count
        assert_includes @group.post_for_day(Time.zone.today), posts(:today)
    end

      # Retrieve a post for a given user and day: Group#post_for(user, date)

    def test_get_post_for_user_and_day
        date = Time.zone.today
        user = users(:author)
        assert_includes @group.post_for_day_and_user(date, user), posts(:today)
        assert_equal 1, @group.post_for_day_and_user(date, user).count
    end

    def test_returns_nil_post_for_user_day
        date = Time.zone.today
        user = users(:nonmember)
        assert_equal 0, (@group.post_for_day_and_user(date, user)).count
    end
  
    # Add a new post: Group#add_post(user, date, body)

    def test_add_post
        date = Time.zone.today
        user = users(:nonmember)
        body = "Hello this is my post!!!!"
        # assert @group.add_post(date, user, body)
        assert_difference "Post.count" do
            @group.add_post(date, user, body)
          end

    end
end
