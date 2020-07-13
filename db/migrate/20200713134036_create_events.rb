class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t| 
      t.string :title
      t.datetime :date 
      t.text :description
      t.integer :user_id
    end 
  end
end
