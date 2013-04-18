module PeopleHelper

  def showing_person?
    @showing_person ||= controller.controller_name == 'people' and controller.action_name == 'show'
  end
end
