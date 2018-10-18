class AddSituationToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :situation, :text
  end
end
