require './test/test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @comment ||= comments(:today_member)
  end

  def test_post_with_empty_post
    @comment.post = nil
    refute @comment.valid?
    assert_includes @comment.errors[:post], "can't be blank"
  end

  def test_post_with_empty_user
    @comment.user = nil
    refute @comment.valid?
    assert_includes @comment.errors[:user], "can't be blank"
  end

  def test_post_with_empty_body
    @comment.body = nil
    refute @comment.valid?
    assert_includes @comment.errors[:body], "can't be blank"
  end

end
