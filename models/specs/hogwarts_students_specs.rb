require("minitest/autorun")
require_relative("../hogwarts_student")

class TestStudent < MiniTest::Test

  def setup()
    options = {
      "id" => 1,
      "first_name" => "Harry",
      "last_name" => "Potter",
      "house" => "Gryffindor",
      "age" => 11
    }

    @student = Student.new(options)

  end

  def test_first_name()
    assert_equal("Harry", @student.first_name)
  end

  def test_last_name()
    assert_equal("Potter", @student.last_name)
  end

  def test_house()
    assert_equal("Gryffindor", @student.house)
  end

  def test_age()
    assert_equal(11, @student.age)
  end
  
end
