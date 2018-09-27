require './test/test_helper'

class User::ValidTest < ActiveSupport::TestCase

    def test_valid_user
        test_user = users (:test1)
        assert_predicate test_user, :valid?
    end

    def test_user_invalid_without_email
        test_user = users (:test1)
        test_user.email = nil
        refute_predicate test_user, :valid?
    end

    def test_user_invalid_with_existing_email
        test_user = users (:test1)
        test_user.save!
        invalid_user = test_user.dup
        refute_predicate invalid_user , :valid?
    end
end