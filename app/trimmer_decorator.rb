require_relative './decorator'
class TrimmerDecorator < BaseDecorator
  attr_accessor :person

  def initialize(person)
    super()
    @person = person
  end

  def correct_name
    @person.correct_name[0, 10]
  end
end
