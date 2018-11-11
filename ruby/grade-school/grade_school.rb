class School
  def initialize
    @student_list = []
  end

  def students(grade)
    students = @student_list.select { |student| student[1] == grade }
    students.sort.map { |student| student[0] }
  end

  def add(name, grade)
    @student_list << [name, grade]
  end

  def students_by_grade
    grades = (1..6).reject { |num| students(num).empty? }
    grades.map do |number|
      { grade: number, students: students(number) }
    end
  end
end
