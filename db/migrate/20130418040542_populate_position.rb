class PopulatePosition < ActiveRecord::Migration

  # everybody who applied before we introduced positions was applying for
  # Software Developer
  def up
    developer = Position.find_by_description 'Software Developer'
    Person.find_all_by_position_id(nil).each do |person|
      person.position = developer
      person.save
    end
  end
end
