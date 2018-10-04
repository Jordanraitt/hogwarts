require_relative('../db/sql_runner.rb')

class Student

  attr_reader :id, :first_name, :last_name, :house, :age

    def initialize(options)
      @id = options["id"].to_i
      @first_name = options["first_name"]
      @last_name = options["last_name"]
      @house = options["house"]
      @age = options["age"].to_i
    end

    def self.all()
    sql = "SELECT * FROM hogwarts_students"
    students = SqlRunner.run(sql)
    result = students.map { |student| Student.new(student)}
    return result
    end

    def save()
      sql = "INSERT INTO hogwarts_students
      ( first_name, last_name, house, age )
      VALUES ( $1, $2, $3, $4 )
      RETURNING *"
      values = [@first_name, @last_name, @house, @age]
      student_data = SqlRunner.run(sql, values)
      @id = student_data.first()['id'].to_i
    end

    def find(id)
      sql = "SELECT * FROM hogwarts_students
      WHERE id = $1"
      values = [id]
      student_id = SqlRunner.run(sql, values)
      result = Student.new(student_id.first)
      return result
    end

    def update()
    sql = "UPDATE hogwarts_students SET
    ( first_name, last_name, house, age )
    = ( $1, $2, $3, $4 )
    WHERE id = $5"
    values = [@first_name, @last_name, @house, @age, @id]
    SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM hogwarts_students
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql,values)
    end

    def self.delete_all()
      sql = "DELETE FROM hogwarts_students"
      SqlRunner.run(sql)
    end

    def full_name()
      return "#{@first_name} #{@last_name}"
    end

end
