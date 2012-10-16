class AddExpectedGraduationDate < ActiveRecord::Migration
  def change
    add_column :people, :expected_graduation_date, :datetime
  end
end
