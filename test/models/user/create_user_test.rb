require './test/test_helper'

class TestCreateUser <  ActiveSupport::TestCase
    def test_create_one_user
        assert_difference "User.count", 1 do
            User::CreateUser.create_random_user
        end
    end

    def test_create_3_users
        assert_difference "User.count", 3 do
         3.times {User::CreateUser.create_random_user}
        end
    end

    def test_create_10_users
        assert_difference "User.count", 10 do
          10.times {User::CreateUser.create_random_user}
        end
    end
end