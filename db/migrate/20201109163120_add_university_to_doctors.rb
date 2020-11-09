class AddUniversityToDoctors < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :university, :string
  end
end
