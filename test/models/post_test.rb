require './test/test_helper'

class PostTest < ActiveSupport::TestCase
  
  def setup
    @post ||= posts(:today)
  end

  def test_valid_post
    assert @post
  end

  def test_post_with_empty_group
    @post.group = nil
    refute @post.valid?
    assert_includes @post.errors[:group_id], "can't be blank"
  end

  def test_post_with_empty_user
    @post.user = nil
    refute @post.valid?
    assert_includes @post.errors[:user_id], "can't be blank"
  end

  def test_post_with_empty_date
    @post.date = nil
    refute @post.valid?
    assert_includes @post.errors[:date], "can't be blank"
  end

  def test_post_with_duplicate_group_user_date
    @post.save
    invalid_post = Post.new
    invalid_post.user = @post.user
    invalid_post.group = @post.group
    invalid_post.date = @post.date
    refute invalid_post.valid?
    assert_includes invalid_post.errors[:user_id], "has already been taken"
  end

  def test_post_with_empty_body
    @post.body = nil
    refute @post.valid?
    assert_includes @post.errors[:body], "can't be blank"
  end

end
