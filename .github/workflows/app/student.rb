require "./person.rb"

class Student < Person

  attr_reader :classroom
  attr_writer :classroom

  def initialize(classroom,id, age, name, parent_permission)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    return "¯\(ツ)/¯"
  end
end