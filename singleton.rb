#Andrew Melis
#CSPP5150
#hw1 - Singleton


##########
#class declaration section
##########

require 'singleton'   #i've used ruby's included singleton classes
		      #as in the second example shown in class - singleton.ruby.2/my_singleton.rb

class Registrar
  include Singleton
  
  @@courses = Array.new
  
  def add_course(course)
    @@courses.push(course)
  end

  def find_course(course)
    @@courses[@@courses.index(course)]
  end
  
  def register_student(student, course)
    c = find_course(course)
    c.add_student(student)
  end

  def seeCourses
    @@courses.each do |c|
      puts c
    end
  end

end

class Student
  attr_accessor :id
end

class Course
  attr_accessor :max_enrollment, :cur_enrollment, :enrolled_students, :name

  def initialize(max, cur, name)
    self.max_enrollment = max
    self.cur_enrollment = cur
    self.enrolled_students = Array.new
    self.name = name
  end

  def add_student(s)
    if self.cur_enrollment+1 >self.max_enrollment
      puts "Unable to add student #{s.id} to #{self.name} because it is full!"
    else
      self.enrolled_students.push(s)
      self.cur_enrollment += 1
      puts "student #{s.id} added to #{self.name}"
    end
  end

  def to_s
    puts "#{self.name} has #{self.cur_enrollment} / #{self.max_enrollment} students\n"
  end

end


##########
#testing section
##########
puts "\n\nNOW TESTING\n\n"

#instantiate Registrar twice, to two different objects
r = Registrar.instance
r2 = Registrar.instance

#create two courses
c1 = Course.new(40,35,"history")
c2 = Course.new(1,1,"cs")

#create two students
s1 = Student.new
s1.id = 1

s2 = Student.new
s2.id = 2 

#add one course to each of the two instances
r.add_course(c1)
r2.add_course(c2)

r.register_student(s1,c1) #class 1, history, is not full. Has 36 students after this student added
r.register_student(s2,c2) #class 2, cs, is full

r2.register_student(s2,c1)  #class 1, history, is still not full. Since r2's history class is the same as r's, it will have 37 students after s2 is added
r2.register_student(s1,c2)  #class 2, cs, is still full

#show that the two instances of Registrar are the same
#first, the courses contained are the same, with the same enrollments
puts "\nr's courses\n"
r.seeCourses
puts "\nr2's courses\n"
r2.seeCourses

#second, show memory addresses and truth value
puts "\nr's memory address is #{r}"
puts "r2's memory address is #{r2}"
puts "does r1 == r2? #{r==r2}"

#finally
#test code by trying to instantiate Registrar class more than once
begin
  r3 = Registrar.new
rescue
  puts "\nnew is a private function for Registrar class!\n"
end
