class AddAvailabilityEnabled < ActiveRecord::Migration
  def change
    add_column :availabilities, :enabled, :boolean, default: true
  end
end
