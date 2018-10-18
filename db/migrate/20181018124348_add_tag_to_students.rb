class AddTagToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :tag, :integer
  end
end
