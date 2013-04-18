module PeopleHelper

  def showing_or_editing_person?
    @showing_person ||= controller.controller_name == 'people' &&
      (controller.action_name == 'show' ||
       controller.action_name == 'edit')
  end
end
