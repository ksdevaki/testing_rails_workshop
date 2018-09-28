require './test/test_helper'

class User::ValidTest < ActiveSupport::TestCase
    def setup
        @test_user ||= users (:test1)
    end

    def test_valid_user
        assert_predicate @test_user, :valid?
    end

    def test_user_invalid_without_email
        @test_user.email = nil
        refute_predicate @test_user, :valid?
        assert_includes @test_user.errors[:email], "can't be blank"
    end

    def test_user_invalid_with_existing_email
        @test_user.save!
        invalid_user = @test_user.dup
        refute_predicate invalid_user , :valid?
        assert_includes invalid_user.errors[:email], "has already been taken"
    end
end