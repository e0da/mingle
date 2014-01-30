class RenameDataCenterSystemsAdministratorDescriptionToDevopsSystemsAdministrator < ActiveRecord::Migration

  OLD_TITLE = 'Data Center Systems Administrator'
  NEW_TITLE = 'DevOps / Systems Administrator'

  def up
    update_position OLD_TITLE, NEW_TITLE
  end

  def down
    update_position NEW_TITLE, OLD_TITLE
  end

  private

  def update_position(current, new)
    position = Position.find_by_description current
    position.description = new
    position.save
  end
end
