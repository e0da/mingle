class AddImpressionField < ActiveRecord::Migration
  def change
    add_column :people, :impression, :integer, default: 0
  end
end
