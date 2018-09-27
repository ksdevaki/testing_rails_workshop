require "minitest/autorun"
class HelloWorldTest < MiniTest::Unit::TestCase
    def test_greeting
        assert_equal "Hello world!" , HelloWorld.new.greeting
    end

    class HelloWorld
        def greeting
            "Hello world!"
        end
    end
end