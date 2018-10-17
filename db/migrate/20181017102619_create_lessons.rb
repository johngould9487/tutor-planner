class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.references :student, foreign_key: true
      t.string :theme
      t.date :date

      t.timestamps
    end
  end
end
