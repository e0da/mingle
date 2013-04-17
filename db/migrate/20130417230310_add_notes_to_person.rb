class AddNotesToPerson < ActiveRecord::Migration
  def change
    add_column :people, :notes, :string
  end
end
