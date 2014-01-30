module PeopleHelper

  def showing_or_editing_person?
    @showing_person ||= controller.controller_name == 'people' &&
      (controller.action_name == 'show' ||
       controller.action_name == 'edit')
  end

  def enabled_positions
    Position.where(enabled: true).order(:description)
  end

  def enabled_availabilities
    Availability.where(enabled: true)
  end
end
