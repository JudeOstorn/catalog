class CreateWorkers < ActiveRecord::Migration[5.0]
  def change
    create_table :workers do |t|
      t.string :first_name
      t.string :last_name
      t.string :patronymic_name
      t.timestamps
    end
  end
end
