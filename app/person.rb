class Person
  attr_accessor :id, :age, :name, :parent_permission

  def initialize(id, age, name = 'Unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?(age)
    is_of_age(age) && @parent_permission
  end

  private

  def of_age?(age)
    age >= 18
  end
end
