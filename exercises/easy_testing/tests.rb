require "minitest/autorun"
require "minitest/reporters"
# require "simplecov"
# SimpleCov.start
# Minitest::Reporters.use!

class Tests < MiniTest::Test
  
  def setup
    @value1 = 2
    @value2 = "not xyz"
    @value = 0
    @list = ["not empty"]
    @employee
  end
  
  def test_boolean
    assert(@value1.odd?, "Value is not odd.")
  end
  
  def test_equality
    assert_equal(true, @value2.downcase == "xyz")
  end
  
  def test_nil
    assert_nil @value
  end
  
  def test_empty
    assert_empty(@list)
  end
  
  def test_xyz_in_list
    assert_includes(@list, "xyz")
  end
  
  # def test_exceptions
  #   assert_raises NoExperienceError do
  #     employee.hire
  #   end
  # end

end