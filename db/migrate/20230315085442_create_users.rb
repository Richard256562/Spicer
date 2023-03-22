class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :gender
      t.string :email
      t.string :created_at
      t.string :updated_at

      t.timestamps
    end
  end
end
