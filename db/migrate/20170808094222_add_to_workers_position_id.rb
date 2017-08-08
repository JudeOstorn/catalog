class AddToWorkersPositionId < ActiveRecord::Migration[5.0]
  def change
    add_column :workers, :position_id, :integer
  end
end
