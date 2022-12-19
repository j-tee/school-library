class Person
  attr_reader :id, :age, :name, :parent_permission

  attr_writer :id, :age, :name, :parent_permission
  
  def initialize(id, age, name = "Unknown", parent_permission = true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?(age)
    return is_of_age(age) && @parent_permission
  end

  private
  def is_of_age?(age)
    return age >= 18 ? true : false
  end
end