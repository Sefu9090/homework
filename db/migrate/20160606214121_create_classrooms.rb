class CreateClassrooms < ActiveRecord::Migration
  def up
    create_table :classrooms do |t|
      t.string :name
      t.string :period
      t.string :teacher
    end
  end
  
  def down
    drop_table :classrooms
  end
end