class AddToWorkersBirthday < ActiveRecord::Migration[5.0]
  def change
    add_column :workers, :birthdate, :datetime
  end
end
