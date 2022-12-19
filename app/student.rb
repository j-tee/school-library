require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, id, age, name, parent_permission)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
