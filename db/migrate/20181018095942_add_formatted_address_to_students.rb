class AddFormattedAddressToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :formatted_address, :string
  end
end
