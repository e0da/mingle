class AddUniqueTokenToPerson < ActiveRecord::Migration
  def change
    add_column :people, :unique_token, :string
  end
end
