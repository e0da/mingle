class DisableSomeAvailabilities < ActiveRecord::Migration

  def up
    set_availabilities false
  end

  def down
    set_availabilities true
  end

  private

  def set_availabilities(value)
    ['Intern during school', 'Intern during summer'].each do |description|
      Availability.find_by_description(description).tap do |availability|
        availability.enabled = value
        availability.save
      end
    end
  end
end
