class CreateTaskS < ActiveRecord::Migration[7.0]
  def change
    create_table :task_s do |t|
      t.string :name
      t.string :task_status
      t.string :task_description
      t.string :created_at
      t.string :updated_at
      t.string :references

      t.timestamps
    end
  end
end
