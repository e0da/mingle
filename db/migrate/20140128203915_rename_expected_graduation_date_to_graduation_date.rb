class RenameExpectedGraduationDateToGraduationDate < ActiveRecord::Migration
  def change
    rename_column :people, :expected_graduation_date, :graduation_date
  end
end
