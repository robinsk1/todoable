class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :todo_id
      t.boolean :complete
      t.timestamps
    end
  end
end
