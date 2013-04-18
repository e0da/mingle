class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :description
      t.boolean :enabled, default: true

      t.timestamps
    end
    add_column :people, :position_id, :integer
  end
end
