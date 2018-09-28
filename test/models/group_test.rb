require './test/test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @group ||= groups(:dev)

  end

  def test_valid_group
    assert @group.valid?
  end

  def test_group_without_name
    @group.name=nil
    refute @group.valid?
    assert_includes @group.errors[:name], "can't be blank"
  end

end
