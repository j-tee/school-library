require_relative './decorator'

class CapitalizeDecorator < BaseDecorator
  attr_accessor :person

  def initialize(person)
    super(person)
    @person = person
  end

  def correct_name
    @person.correct_name.capitalize
  end
end
