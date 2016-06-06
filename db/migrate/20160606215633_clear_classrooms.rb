class ClearClassrooms < ActiveRecord::Migration
  def change
    drop_table :classrooms
  end
end
