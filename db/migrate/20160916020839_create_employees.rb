class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :address
      t.string :manager_id
      t.string :department_id
      t.timestamps
    end
  end
end
