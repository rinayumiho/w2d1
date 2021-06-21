class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |h, k| h[k] = [] }
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(name)
        @teachers << name
    end

    def enroll(name)
        return false if @students.length == @student_capacity
        @students << name
        true
    end

    def enrolled?(name)
        @students.include?(name)
    end

    def student_to_teacher_ratio
        @students.length / @teachers.length
    end

    def add_grade(name, score)
        return false if !@students.include?(name)
        @grades[name] << score
        true
    end

    def num_grades(name)
        @grades[name].length
    end

    def average_grade(name)
        return nil if @grades[name].length == 0
        @grades[name].sum / @grades[name].length
    end
end
