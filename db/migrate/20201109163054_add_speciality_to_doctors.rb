class AddSpecialityToDoctors < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :speciality, :string
  end
end
