class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.string :description

      t.timestamps
    end
    add_column :people, :availability_id, :integer
  end
end
